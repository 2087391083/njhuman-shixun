package com.hqyj.mymana.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mymana.pojo.EmployeeMsg;
import com.hqyj.mymana.service.EmployeeMsgService;

@Controller
public class EmployeeMsgController {
	@Autowired
	EmployeeMsgService service;
	
	@RequestMapping("index.do")
	public String index(){
		return "index";
	}

	@RequestMapping("login.do")
	public String login(){
		return "login";
	}
	
	@RequestMapping("employer.do")
	public String userInfo(){
		return "employer";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="loginSubmit.do")
	public String  loginSubmit(EmployeeMsg user,ModelMap map){
		//(String username,String userpwd将前台发送的用户名和密码分别复值给username和userpwd两个变量)也可以被替换为（Admin user,ModelMap map）
		return service.login(user, map);
	}
	
	//ajax璇锋眰
		@RequestMapping("select.do")
		@ResponseBody
		public HashMap<String, Object> select(int page,int rows,String name){
			int start=rows*(page-1);
			/*System.out.println(page);
			System.out.println(rows);*/
			
			return service.select(start,rows,name);
		}
		
		@RequestMapping(method=RequestMethod.GET,value="insertly.do",produces={"text/html;charset=utf-8"})
		@ResponseBody
		public String insert(EmployeeMsg u){
			return service.insertly(u);
		}
		
		@RequestMapping(method=RequestMethod.GET,value="updately.do",produces={"text/html;charset=utf-8"})
		@ResponseBody
		public String update(EmployeeMsg u){
			return service.updately(u);
		}
		
		@RequestMapping(method=RequestMethod.GET,value="del.do",produces={"text/html;charset=utf-8"})
		@ResponseBody
		public String del(int id){
			return service.del(id);
		}
}
