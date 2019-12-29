package com.hqyj.mymana.service;

import java.util.HashMap;


import com.hqyj.mymana.pojo.Transfer;



public interface TransferService {
	HashMap<String, Object> select(int start,int row,String job);

	String insert(Transfer t);
	String update(Transfer t);
	String del(int id);

}
