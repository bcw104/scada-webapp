package com.ht.scada.web.mvc;

import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

public class NewTest {
	
  @DataProvider
  public Object[][] dp1() {
    return new Object[][] {
      new Object[] { 1, "a" },
      new Object[] { 2, "b" },
    };
  }
  
  @Test(dataProvider="dp1")
  private void test(int i, String s) {
	  System.out.println(s);
  }
  
  @Test(dataProvider="dp1")
  private void test2(int i, String s) {
	  System.out.println(s);
  }
}
