package com.hqyj.mymana.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.hqyj.mymana.pojo.EmployeeFiles;
import com.hqyj.mymana.service.EmployeeFilesService;

@Controller
public class EmployeeFilesController {
 @Autowired
 EmployeeFilesService service;
 @RequestMapping("employeeFiles.do")
 public String employeeFiles(){
	 return "employeeFiles";
 }
 @RequestMapping("selectFile.do")
 @ResponseBody
 public  HashMap<String,Object> select(int page,int rows,String filesName){
	//计算起始位置
	int start=rows*(page-1);
	 
	return service.selectFile(start, rows,filesName);
}
	@RequestMapping(method=RequestMethod.GET,value="twoinsert.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String insert(EmployeeFiles e){
		
		return service.insert(e);
	}
	//修改
	@RequestMapping(method=RequestMethod.GET,value="twoupdate.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String update(EmployeeFiles e){
		
		return service.update(e);
	}
	//删除
	@RequestMapping(method=RequestMethod.GET,value="twodel.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String del(int id){
		
		return service.del(id);
	}
	
}
