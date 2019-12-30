package com.hqyj.mymana.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.hqyj.mymana.pojo.EmployeesInfo;
import com.hqyj.mymana.service.EmployeesInfoService;

@Controller
public class EmployeesInfoController {

	//注入service
	@Autowired
	EmployeesInfoService service;
	
	//访问employeesInfo.jsp页面
	@RequestMapping("employeesInfo.do")
	public String employeesInfo(){
		return "employeesInfo";
	}
	
	//ajax请求要用@ResponseBody注解
	@RequestMapping("selecteight.do")
	@ResponseBody
	public HashMap<String,Object> select(int page,int rows,String ename){
		//计算起始位置
		int start=rows*(page-1);
		return service.select(start,rows,ename);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="inserteight.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String insert(EmployeesInfo e){
		return service.insert(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updateeight.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String update(EmployeesInfo e){
		return service.update(e);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="deleight.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String del(int id){
		return service.del(id);
	}
}
