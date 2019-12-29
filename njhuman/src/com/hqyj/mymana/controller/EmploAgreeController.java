package com.hqyj.mymana.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.mymana.service.EmploAgreeService;
import com.hqyj.mymana.pojo.EmploAgree;

@Controller
public class EmploAgreeController {
	@Autowired
	EmploAgreeService service;
	@RequestMapping("EmploAgree.do")
	public String EmploAgree(){
		return "EmploAgree";
	}
	@RequestMapping("selectAgree.do")
	@ResponseBody
	public HashMap<String,Object> select(int page,int rows,String employeeName){
		
		//计算起始位置
		int start=rows*(page-1);
		
		return service.select(start,rows,employeeName);
	}
	@RequestMapping(method=RequestMethod.GET,value="threeinsert.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String insert(EmploAgree e){
		return service.insert(e);
	}
	@RequestMapping(method=RequestMethod.GET,value="threeupdate.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String update(EmploAgree e){
		return service.update(e);
	}
	@RequestMapping(method=RequestMethod.GET,value="threedel.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String del(int id){
		return service.del(id);
	}

}
