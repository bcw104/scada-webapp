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
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NameNotFoundException;
import javax.naming.NamingException;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

public class JMSTest {
	
	private static Context initialContext;
	private static ConnectionFactory cf;

	@BeforeClass
	public static void init() throws NamingException {
		Properties prop = new Properties();
		prop.put(javax.naming.Context.INITIAL_CONTEXT_FACTORY,
				"org.jnp.interfaces.NamingContextFactory");
		prop.put(javax.naming.Context.PROVIDER_URL,
				"org.jboss.naming:org.jnp.interfaces");
		prop.put(javax.naming.Context.PROVIDER_URL, "jnp://localhost:1099");

		initialContext = new InitialContext(prop);
		cf = (ConnectionFactory) initialContext
				.lookup("/ConnectionFactory");
	}
	
	@AfterClass
	public static void destroy() throws NamingException {
		if (initialContext != null) {
			initialContext.close();
		}
	}

	@Test
	public void testLastValueQueue() throws Exception {

		// Step 2. Perfom a lookup on the queue
		Queue queue = null;
		try {
			queue = (Queue) initialContext.lookup("/queue/DLQ");
		} catch (NameNotFoundException e) {
		}


		// Step 4.Create a JMS Connection, session and producer on the queue
		Connection connection = cf.createConnection();
		Session session = connection.createSession(false,
				Session.AUTO_ACKNOWLEDGE);

		if (queue == null) {
			queue = session.createTemporaryQueue();
		}
		MessageProducer producer = session.createProducer(queue);

		// Step 5. Create and send a text message with the Last-Value header set
		TextMessage message = session
				.createTextMessage("1st message with Last-Value property set");
		message.setStringProperty("_HQ_LVQ_NAME", "STOCK_NAME");
		producer.send(message);
		System.out.format("Sent message: %s\n", message.getText());

		// Step 6. Create and send a second text message with the Last-Value
		// header set
		message = session
				.createTextMessage("2nd message with Last-Value property set");
		message.setStringProperty("_HQ_LVQ_NAME", "STOCK_NAME");
		producer.send(message);
		System.out.format("Sent message: %s\n", message.getText());

		// Step 7. Create and send a third text message with the Last-Value
		// header set
		message = session
				.createTextMessage("3rd message with Last-Value property set");
		message.setStringProperty("_HQ_LVQ_NAME", "STOCK_NAME");
		producer.send(message);
		System.out.format("Sent message: %s\n", message.getText());

		// Step 8. Browse the queue. There is only 1 message in it, the last
		// sent
		QueueBrowser browser = session.createBrowser(queue);
		Enumeration enumeration = browser.getEnumeration();
		while (enumeration.hasMoreElements()) {
			TextMessage messageInTheQueue = (TextMessage) enumeration
					.nextElement();
			System.out.format("Message in the queue: %s\n",
					messageInTheQueue.getText());
		}
		browser.close();

		// Step 9. Create a JMS Message Consumer for the queue
		MessageConsumer messageConsumer = session.createConsumer(queue);

		// Step 10. Start the Connection
		connection.start();

		// Step 11. Trying to receive a message. Since the queue is configured
		// to keep only the
		// last message with the Last-Value header set, the message received is
		// the last sent
		TextMessage messageReceived = (TextMessage) messageConsumer
				.receive(1000);
		assert messageReceived != null;
		System.out.format("Received message: %s\n", messageReceived.getText());

		// Step 12. Trying to receive another message but there will be none.
		// The 1st message was discarded when the 2nd was sent to the queue.
		// The 2nd message was in turn discarded when the 3trd was sent to the
		// queue
		messageReceived = (TextMessage) messageConsumer.receive(1000);
		System.out.format("Received message: %s\n", messageReceived);
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
			queue = (Queue) initialContext.lookup("/queue/exampleQueue");
		} catch (NameNotFoundException e) {
		}

        // Step 3. look-up the JMS connection factory object from JNDI
        ConnectionFactory cf = (ConnectionFactory)initialContext.lookup("/ConnectionFactory");

        // Step 4. Create a JMS Connection
        Connection connection = cf.createConnection();

        // Step 5. Start the connection
        connection.start();

        // Step 5. Create a JMS Session
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		if (queue == null) {
			queue = session.createTemporaryQueue();
		}

        // Step 6. Create a JMS Message Producer
        MessageProducer producer = session.createProducer(queue);

        // Step 8. Prepare two selectors
        String redSelector = "color='red'";
        String greenSelector = "color='green'";

        // Step 9. Create a JMS Message Consumer that receives 'red' messages
        MessageConsumer redConsumer = session.createConsumer(queue, redSelector);
        redConsumer.setMessageListener(new SimpleMessageListener("red"));

        // Step 10. Create a second JMS message consumer that receives 'green' messages
        MessageConsumer greenConsumer = session.createConsumer(queue, greenSelector);
        greenConsumer.setMessageListener(new SimpleMessageListener("green"));

        // Step 11. Create another JMS message consumer that receives any messages.
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
        System.out.println("Message sent: " + redMessage.getText());
        producer.send(greenMessage);
        System.out.println("Message sent: " + greenMessage.getText());
        producer.send(blueMessage);
        System.out.println("Message sent: " + blueMessage.getText());
        
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
