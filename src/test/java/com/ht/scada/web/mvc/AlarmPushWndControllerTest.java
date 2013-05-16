package com.ht.scada.web.mvc;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ht.scada.security.AbstractShiroTest;
import com.ht.scada.security.service.UserService;
import org.apache.shiro.subject.Subject;
import org.easymock.EasyMock;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.util.Arrays;
import java.util.List;

import static org.easymock.EasyMock.anyObject;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

public class AlarmPushWndControllerTest extends AbstractShiroTest {

	private MockMvc mockMvc;
	private UserService userService;
	private ObjectMapper objectMapper;
	private MainController mainController;

	@BeforeTest
	public void beforeTest() {
		//1.  Create a mock authenticated Subject instance for the test to run:
        Subject subjectUnderTest = EasyMock.createNiceMock(Subject.class);
        EasyMock.expect(subjectUnderTest.isPermitted("alarm:push")).andReturn(true);

        //2. Bind the subject to the current thread:
        setSubject(subjectUnderTest);

        //perform test logic here.  Any call to 
        //SecurityUtils.getSubject() directly (or nested in the 
        //call stack) will work properly.
        
	}
	
	@BeforeMethod
	public void beforeMethod() {
		this.userService = EasyMock.createMock(UserService.class);
		this.objectMapper = EasyMock.createMock(ObjectMapper.class);
		//this.mockMvc = MockMvcBuilders.standaloneSetup(new AlarmPushWndController(jmsService, objectMapper)).build();
		
		mainController = new MainController();
		mainController.setUserService(userService);
		this.mockMvc = MockMvcBuilders.standaloneSetup(mainController).build();
	}

	//@Test
	public void getAlarmMessages() throws Exception {
		
		List<String> messages = Arrays.asList("a", "b", "c");
//		EasyMock.expect(this.jmsService.getLatestAlarmInfo(anyObject(String.class))).andReturn(messages);
//		EasyMock.replay(this.jmsService);
		
		EasyMock.expect(this.objectMapper.writeValueAsString(anyObject())).andReturn("abc");
		EasyMock.replay(this.objectMapper);
		
		this.mockMvc.perform(get("/alarm/listening").param("username", "一矿"))
				.andExpect(MockMvcResultMatchers.status().isOk())
				.andExpect(MockMvcResultMatchers.request().asyncResult("abc"));

		//EasyMock.verify(this.jmsService);
	}
	
//	@Test
	public void getAlarmMessagesStartAsync() throws Exception {
		
		EasyMock.expect(this.objectMapper.writeValueAsString(anyObject())).andReturn("abc");
		EasyMock.replay(this.objectMapper);

		this.mockMvc.perform(get("/alarm/listening").param("area", "一矿"))
				.andExpect(request().asyncStarted());

		//verify(this.jmsService);
	}
	
	@Test
	public void testJmss() throws Exception {
		
		//EasyMock.expect(this.jmsService.test((String)anyObject())).andReturn("123");
		//EasyMock.replay(this.jmsService);
		//System.out.println(jmsService.test("bc"));
		
		
		//assert this.mainController.main().equals("main/index");
		
		this.mockMvc.perform(get("/main").sessionAttr("username", "admin"))
		.andExpect(MockMvcResultMatchers.status().isOk())
		.andExpect(MockMvcResultMatchers.request().sessionAttribute("a", "B"))
		.andExpect(MockMvcResultMatchers.model().attribute("username", "admin"))
		.andExpect(MockMvcResultMatchers.forwardedUrl("main/index")) ;
	}
	
	
	@AfterTest
    public void tearDownSubject() {
        //3. Unbind the subject from the current thread:
        clearSubject();
    }
}
