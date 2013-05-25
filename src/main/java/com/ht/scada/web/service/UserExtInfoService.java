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

    UserExtInfo findUserExtInfoByUserID(int id);

    List<UserExtInfo> getAllUserExtInfo();

    void saveUserExtInfo(UserExtInfo newUser);
}
