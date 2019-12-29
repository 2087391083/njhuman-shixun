package com.hqyj.mymana.service;

import java.util.HashMap;

import com.hqyj.mymana.pojo.six;



public interface sixservice {
	HashMap<String,Object> select(int start,int row,String type);
	
	String insert(six u);
	String update(six u);
	String del(int id);
}
