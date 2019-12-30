package com.hqyj.mymana.service;

import java.util.HashMap;

import com.hqyj.mymana.pojo.EmployeesInfo;


public interface EmployeesInfoService {

	HashMap<String,Object> select(int start,int row,String ename);
	String insert(EmployeesInfo e);
	String update(EmployeesInfo e);
	String del(int id);
}
