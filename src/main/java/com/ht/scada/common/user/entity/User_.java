package com.ht.scada.common.user.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-02-01T19:02:49.825+0800")
@StaticMetamodel(User.class)
public class User_ {
	public static volatile SingularAttribute<User, String> username;
	public static volatile SingularAttribute<User, String> password;
	public static volatile SingularAttribute<User, String> name;
	public static volatile SingularAttribute<User, UserExtInfo> extInfo;
	public static volatile SingularAttribute<User, UserRole> userRole;
}
