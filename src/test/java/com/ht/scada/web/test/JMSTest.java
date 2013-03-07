package com.ht.scada.web.test;

import java.util.Enumeration;
import java.util.Properties;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Queue;
import javax.jms.QueueBrowser;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueRequestor;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NameNotFoundException;
import javax.naming.NamingException;

import org.hornetq.api.core.TransportConfiguration;
import org.hornetq.api.core.client.ClientSession;
import org.hornetq.api.core.client.ClientSessionFactory;
import org.hornetq.api.core.client.HornetQClient;
import org.hornetq.api.core.client.ServerLocator;
import org.hornetq.api.jms.HornetQJMSClient;
import org.hornetq.api.jms.management.JMSManagementHelper;
import org.hornetq.core.remoting.impl.netty.NettyConnectorFactory;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

public class JMSTest {

	private static Context initialContext;
	private static ConnectionFactory cf;

	@BeforeClass
	public static void init() throws Exception {
		initJndiJms();
	}

	@AfterClass
	public static void destroy() throws NamingException {
		if (initialContext != null) {
			initialContext.close();
		}
	}

	private static void initJndiJms() throws Exception {
		Properties prop = new Properties();
		prop.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY,
				"org.jnp.interfaces.NamingContextFactory");
		prop.put(javax.naming.Context.PROVIDER_URL,
				"org.jboss.naming:org.jnp.interfaces");
		prop.put(javax.naming.Context.PROVIDER_URL, "jnp://localhost:1099");

		initialContext = new InitialContext(prop);
		cf = (ConnectionFactory) initialContext.lookup("/ConnectionFactory");
		System.out.println(cf);
		
		createQueue("queue1");
		createQueue("myqueue");
	}
	
	private static void createQueue(String queueName) throws JMSException {
		System.out.println("创建队列："+queueName);
		QueueConnection connection = ((QueueConnectionFactory)cf).createQueueConnection("admin", "admin123");
		connection.start();

		Queue managementQueue = HornetQJMSClient.createQueue("hornetq.management");
		QueueSession session = connection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
		QueueRequestor requestor = new QueueRequestor(session, managementQueue);
		
		Message message = session.createMessage();
		
		JMSManagementHelper.putOperationInvocation(message, "jms.server", "createQueue", queueName, "/queue/" + queueName);
		Message reply = requestor.request(message);
		System.out.println(reply);
	}

	@Test
	public void testLastValueQueue() throws Exception {

		// Step 2. Perfom a lookup on the queue
		Queue queue = null;
		 try {
			 //queue = (Queue) initialContext.lookup("/queue/DLQ");
			 queue = (Queue) initialContext.lookup("/queue/queue1");
		 } catch (NameNotFoundException e) {
		 }
		 assert queue != null;

		// Step 4.Create a JMS Connection, session and producer on the queue
		Connection connection = cf.createConnection();
		Session session = connection.createSession(false,
				Session.AUTO_ACKNOWLEDGE);

		if (queue == null) {
			queue = session.createTemporaryQueue();
		}
		MessageProducer producer = session.createProducer(queue);

		// Step 5. Create and send a text message with the Last-Value header set
		TextMessage message = session.createTextMessage("第1个设置了Last-Value属性的消息");
		message.setStringProperty("_HQ_LVQ_NAME", "STOCK_NAME");
		producer.send(message);
		System.out.format("发送消息: %s\n", message.getText());

		// Step 6. Create and send a second text message with the Last-Value
		// header set
		message = session.createTextMessage("第2个设置了Last-Value属性的消息");
		message.setStringProperty("_HQ_LVQ_NAME", "STOCK_NAME");
		message.setStringProperty("aa", "b");
		producer.send(message);
		System.out.format("发送消息: %s\n", message.getText());

		// Step 7. Create and send a third text message with the Last-Value
		// header set
		message = session.createTextMessage("第3个设置了Last-Value属性的消息");
		message.setStringProperty("_HQ_LVQ_NAME", "STOCK_NAME");
		message.setStringProperty("aa", "c");
		producer.send(message);
		System.out.format("发送消息: %s\n", message.getText());

		// Step 8. Browse the queue. There is only 1 message in it, the last
		// sent
		QueueBrowser browser = session.createBrowser(queue);
		Enumeration enumeration = browser.getEnumeration();
		while (enumeration.hasMoreElements()) {
			TextMessage messageInTheQueue = (TextMessage) enumeration
					.nextElement();
			System.out.format("队列消息: %s\n", messageInTheQueue.getText());
		}
		browser.close();

		// Step 9. Create a JMS Message Consumer for the queue
		MessageConsumer messageConsumer = session.createConsumer(queue);

		// Step 10. Start the Connection(用于接收消息)
		connection.start();

		// Step 11. Trying to receive a message. Since the queue is configured
		// to keep only the
		// last message with the Last-Value header set, the message received is
		// the last sent
		TextMessage messageReceived = (TextMessage) messageConsumer
				.receive(1000);
		assert messageReceived != null;
		System.out.format("接收消息: %s\n", messageReceived.getText());
		System.out.println(messageReceived.getStringProperty("aa"));

		// Step 12. Trying to receive another message but there will be none.
		// The 1st message was discarded when the 2nd was sent to the queue.
		// The 2nd message was in turn discarded when the 3trd was sent to the
		// queue
		messageReceived = (TextMessage) messageConsumer.receive(1000);
		System.out.format("接收消息: %s\n", messageReceived);
		assert messageReceived == null;

		connection.close();
		return;
	}

	@Test
	public void selector() throws Exception {
		// Step 1. Create an initial context to perform the JNDI lookup.

		// Step 2. look-up the JMS queue object from JNDI
		Queue queue = null;
		try {
			queue = (Queue) initialContext.lookup("/queue/myqueue");
		} catch (NameNotFoundException e) {
		}
		assert queue != null;
		
		// Step 4. Create a JMS Connection
		Connection connection = cf.createConnection();

		// Step 5. Start the connection
		connection.start();

		// Step 5. Create a JMS Session
		Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		if (queue == null) {
			// queue = session.createTemporaryQueue();
			// queue = HornetQJMSClient.createQueue("/queue/myqueue");
			// initialContext.bind("/queue/myqueue", queue);

			ServerLocator serverLocator = HornetQClient
					.createServerLocatorWithoutHA(new TransportConfiguration(
							NettyConnectorFactory.class.getName()));
			ClientSessionFactory sf = serverLocator.createSessionFactory();
			ClientSession coreSession = sf.createSession(false, false, false);

			String queueName = "jms.queue.myqueue";
			coreSession.deleteQueue(queueName);
			coreSession.createQueue(queueName, queueName, false);

			System.out.println("绑定队列myqueue到JNDI");
		} else {
			System.out.println("JNDI中存在队列myqueue");
		}

		// Step 6. Create a JMS Message Producer
		MessageProducer producer = session.createProducer(queue);

		// Step 8. Prepare two selectors
		String redSelector = "color='red'";
		String greenSelector = "color='green'";

		// Step 9. Create a JMS Message Consumer that receives 'red' messages
		MessageConsumer redConsumer = session
				.createConsumer(queue, redSelector);
		redConsumer.setMessageListener(new SimpleMessageListener("red"));

		// Step 10. Create a second JMS message consumer that receives 'green'
		// messages
		MessageConsumer greenConsumer = session.createConsumer(queue,
				greenSelector);
		greenConsumer.setMessageListener(new SimpleMessageListener("green"));

		// Step 11. Create another JMS message consumer that receives any
		// messages.
		MessageConsumer anyConsumer = session.createConsumer(queue);
		anyConsumer.setMessageListener(new SimpleMessageListener("any"));

		// Step 12. Create three messages, each has a color property
		TextMessage redMessage = session.createTextMessage("Red");
		redMessage.setStringProperty("color", "red");
		TextMessage greenMessage = session.createTextMessage("Green");
		greenMessage.setStringProperty("color", "green");
		TextMessage blueMessage = session.createTextMessage("Blue");
		blueMessage.setStringProperty("color", "blue");

		// Step 13. Send the Messages
		producer.send(redMessage);
		System.out.println("发送消息: " + redMessage.getText());
		producer.send(greenMessage);
		System.out.println("发送消息: " + greenMessage.getText());
		producer.send(blueMessage);
		System.out.println("发送消息: " + blueMessage.getText());

		connection.close();
	}

	public class SimpleMessageListener implements MessageListener {

		private final String name;

		public SimpleMessageListener(final String listener) {
			name = listener;
		}

		public void onMessage(final Message msg) {
			TextMessage textMessage = (TextMessage) msg;
			try {
				String colorProp = msg.getStringProperty("color");
				System.out.println("Receiver " + name + " receives message ["
						+ textMessage.getText() + "] with color property: "
						+ colorProp);
				if (!name.equals("any")) {
					assert colorProp.equals(name);
				}
			} catch (JMSException e) {
				e.printStackTrace();
			}
		}

	}
}
