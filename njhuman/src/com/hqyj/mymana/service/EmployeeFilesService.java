package com.hqyj.mymana.service;

import java.util.HashMap;


import com.hqyj.mymana.pojo.EmployeeFiles;

public interface EmployeeFilesService {
	HashMap<String,Object> selectFile(int start,int row,String filesName);
	//增
		String insert(EmployeeFiles e);
		//修改
		String update(EmployeeFiles e);
		//删
		String del(int id);
}
