package com.ht.scada.web.test;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.ht.scada.common.user.entity.User;
import com.ht.scada.common.user.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"classpath:test-context.xml", "classpath:/META-INF/spring/applicationContext.xml"})
@ContextConfiguration(locations={"classpath:/META-INF/applicationContext.xml"})
@Transactional
@TransactionConfiguration(defaultRollback=true)
public class UserServiceTest {
    @Autowired
    private UserService userService;

    @Test
    public void testFindById() {
        Assert.assertNotNull(userService);
        return;
    }

}
