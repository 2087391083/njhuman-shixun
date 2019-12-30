package com.hqyj.mymana.service;

import java.util.HashMap;

import com.hqyj.mymana.pojo.EmploAgree;


public interface EmploAgreeService {
	HashMap<String,Object> select(int start,int row,String employeeName);
	   
	   String insert(EmploAgree e);
	   String update(EmploAgree e);
	   String del(int id);
}
