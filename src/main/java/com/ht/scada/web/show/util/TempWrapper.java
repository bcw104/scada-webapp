package com.ht.scada.web.show.util;

import java.util.ArrayList;
import java.util.List;

public class TempWrapper {
	private String varGroupValue;
	private List<Temp> tempYcList = new ArrayList<>();
	private List<Temp> tempYmList = new ArrayList<>();
	private List<Temp> tempYxList = new ArrayList<>();
	private List<Temp> tempQtList = new ArrayList<>();
	
	public String getVarGroupValue() {
		return varGroupValue;
	}
	public void setVarGroupValue(String varGroupValue) {
		this.varGroupValue = varGroupValue;
	}
	public List<Temp> getTempYcList() {
		return tempYcList;
	}
	public void setTempYcList(List<Temp> tempYcList) {
		this.tempYcList = tempYcList;
	}
	public List<Temp> getTempYmList() {
		return tempYmList;
	}
	public void setTempYmList(List<Temp> tempYmList) {
		this.tempYmList = tempYmList;
	}
	public List<Temp> getTempYxList() {
		return tempYxList;
	}
	public void setTempYxList(List<Temp> tempYxList) {
		this.tempYxList = tempYxList;
	}
	public TempWrapper(String varGroupValue, List<Temp> tempYcList, List<Temp> tempYmList, List<Temp> tempYxList, List<Temp> tempQtList) {
		this.varGroupValue = varGroupValue;
		this.tempYcList = tempYcList;
		this.tempYmList = tempYmList;
		this.tempYxList = tempYxList;
		this.tempQtList = tempQtList;
	}
	public List<Temp> getTempQtList() {
		return tempQtList;
	}
	public void setTempQtList(List<Temp> tempQtList) {
		this.tempQtList = tempQtList;
	}
}
