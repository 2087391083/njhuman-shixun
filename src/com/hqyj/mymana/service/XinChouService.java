package com.hqyj.mymana.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.hqyj.mymana.pojo.XinChou;


public interface XinChouService {
	HashMap<String, Object> select(int start,int row,String userName);
	
	String insert(XinChou xc);//增加对象的
	 
	 String delete(int id);
	 
	 String update(XinChou xc);
}
