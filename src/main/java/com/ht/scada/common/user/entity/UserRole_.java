package com.ht.scada.common.user.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-02-01T19:02:49.825+0800")
@StaticMetamodel(UserRole.class)
public class UserRole_ {
	public static volatile SingularAttribute<UserRole, String> name;
	public static volatile SingularAttribute<UserRole, String> description;
	public static volatile SetAttribute<UserRole, String> permissions;
}
