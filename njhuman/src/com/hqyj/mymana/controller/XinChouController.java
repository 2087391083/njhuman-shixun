package com.hqyj.mymana.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.hqyj.mymana.pojo.XinChou;
import com.hqyj.mymana.service.XinChouService;

@Controller
public class XinChouController {
	
	@Autowired
	XinChouService service;
	
	@RequestMapping("xinchou.do")
	public String xinChou() {
		return "xinchou";
	}
	@RequestMapping("selectXinchou.do")
	@ResponseBody//只有ajax才需要
	public HashMap<String, Object> select(int page,int rows,String userName) {
		int start=rows*(page-1);//计算起始位置
		return service.select(start,rows,userName);
		
	}
	
	@RequestMapping(method=RequestMethod.GET,value="update.do",produces={"text/html; charset=UTF-8"})
	@ResponseBody
	public String update(XinChou xc) {
		return service.update(xc);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delete.do",produces={"text/html; charset=UTF-8"})
	@ResponseBody
	public String delete(int id) {
		return service.delete(id);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="insert.do",produces={"text/html; charset=UTF-8"})
	@ResponseBody
	public String insert(XinChou xc) {
		return service.insert(xc);
	}

}
