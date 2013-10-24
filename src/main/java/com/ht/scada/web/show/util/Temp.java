package com.ht.scada.web.show.util;

/**
 * 变量分组、变量类型、变量名称、变量值
 * 
 * @author 陈志强
 * 
 */
public class Temp {
	// 变量分组
	private String varGroupName;
	// 变量类型
	private String varGroupType;
	// 变量名称
	private String varName;
	// 变量值
	private String varValue;

	public Temp(String varGroupName, String varGroupType, String varName, String varValue) {
		this.varGroupName = varGroupName;
		this.varGroupType = varGroupType;
		this.varName = varName;
		this.varValue = varValue;
	}

	public String getVarGroupName() {
		return varGroupName;
	}

	public void setVarGroupName(String varGroupName) {
		this.varGroupName = varGroupName;
	}

	public String getVarGroupType() {
		return varGroupType;
	}

	public void setVarGroupType(String varGroupType) {
		this.varGroupType = varGroupType;
	}

	public String getVarName() {
		return varName;
	}

	public void setVarName(String varName) {
		this.varName = varName;
	}

	public String getVarValue() {
		return varValue;
	}

	public void setVarValue(String varValue) {
		this.varValue = varValue;
	}
}
