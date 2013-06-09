/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ht.scada.web.service;

import com.ht.scada.web.entity.UserExtInfo;
import java.util.List;

/**
 *
 * @author admin
 */
public interface UserExtInfoService {

    List<UserExtInfo> getAllUserExtInfo();

    void saveUserExtInfo(UserExtInfo newUser);
    
    UserExtInfo findUserExtInfoByUserID(int id);
    
    /**
     * 根据用户名获得用户
     * @param userName 用户名
     * @return 用户信息
     * 2013-05-25 赵玮 追加
     */
    UserExtInfo findUserExtInfoByUserName(String userName);
    
    /**
     * 删除用户
     * @param userId 
     * 2013-05-25 赵玮 追加
     */
    void deleteUser(int userId);

    List<UserExtInfo> getUserExtInfoByEndTag(int endTagId);
}
