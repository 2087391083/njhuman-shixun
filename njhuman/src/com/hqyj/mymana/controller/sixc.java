package com.hqyj.mymana.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mymana.pojo.six;
import com.hqyj.mymana.serviceImpl.sixserviceimpl;

@Controller
public class sixc {
	@Autowired//ע��service
	sixserviceimpl service;
	
	//ҳ����ת����get��ʽ�������ü�д
	@RequestMapping("attendance.do")
	public String UserInfo(){
		return "attendance";
	}
	@RequestMapping("sixselect.do")
	@ResponseBody
	public HashMap<String,Object> select(int page,int rows,String type){
		int start=(page-1)*rows;
		return service.select(start,rows,type);
	}
	@RequestMapping(method=RequestMethod.GET,value="sixinsert.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String insert(six u){
		return service.insert(u);
	}
	@RequestMapping(method=RequestMethod.GET,value="sixupdate.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String update(six u){
		return service.update(u);
	}
	@RequestMapping(method=RequestMethod.GET,value="sixdel.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String del(int id){
		return service.del(id);
	}
}


/*
@Controller
public class sixc {
	@Autowired//ע��service
	sixserviceimpl service;
	
	//ҳ����ת����get��ʽ�������ü�д
	@RequestMapping("attendance.do")
	public String UserInfo(){
		return "attendance";
	}
	@RequestMapping("sixselect.do")
	@ResponseBody
	public HashMap<String,Object> select(int page,int rows,String type){
		int start=(page-1)*rows;
		return service.select(start,rows,type);
	}
	@RequestMapping(method=RequestMethod.GET,value="sixinsert.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String insert(six u){
		return service.insert(u);
	}
	@RequestMapping(method=RequestMethod.GET,value="sixupdate.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String update(six u){
		return service.update(u);
	}
	@RequestMapping(method=RequestMethod.GET,value="sixdel.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String del(int id){
		return service.del(id);
	}
	
}
*/