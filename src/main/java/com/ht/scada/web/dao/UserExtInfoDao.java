package com.ht.scada.web.dao;

import com.ht.scada.web.entity.UserExtInfo;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.data.jpa.repository.Query;

/**
 * 用户信息Dao
 * 
 * @author Administrator
 */
public interface UserExtInfoDao extends JpaRepository<UserExtInfo, Integer> {
    
    /**
     * 依据用户真实名获得用户
     * @param realName
     * @return 
     */
	public UserExtInfo findByRealName(String realName);
    
    /**
     * 依据用户id名获得用户
     * @param id
     * @return 
     */
	@Query("select u from UserExtInfo u where u.user.id=?1")
	public UserExtInfo findByUserID(int id);
    
    /**
     * 依据用户名获得用户
     * @param userName
     * @return 
     */
    @Query("select u from UserExtInfo u where u.user.username=?1")
	public UserExtInfo findByUserName(String userName);
    
    /**
     * 依据井id名获得用户
     * @param endTagID
     * @return 
     */
    //@Query("select u from UserExtInfo u where ?1 in u.endTagID")
    //SELECT DISTINCT a FROM A a INNER JOIN a.bList b WHERE b.p1 = 1
    @Query("select distinct u from UserExtInfo u join u.endTagID endid where endid =?1")
    public List<UserExtInfo> findByEndTagId(int endTagID);

}