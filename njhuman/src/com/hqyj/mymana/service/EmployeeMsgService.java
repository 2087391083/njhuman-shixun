package com.hqyj.mymana.service;

import java.util.HashMap;

import org.springframework.ui.ModelMap;

import com.hqyj.mymana.pojo.EmployeeMsg;

public interface EmployeeMsgService {
	HashMap<String,Object> select(int start,int row,String name);
	String insertly(EmployeeMsg u);
	String updately(EmployeeMsg u);
	String del(int id);
	String login(EmployeeMsg user,ModelMap map);/*request作用范围域中的modelMap对象*/
}
