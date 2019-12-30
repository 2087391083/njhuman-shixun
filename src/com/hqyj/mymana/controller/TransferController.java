package com.hqyj.mymana.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hqyj.mymana.pojo.Transfer;

import com.hqyj.mymana.service.TransferService;

@Controller
public class TransferController {
	
	@Autowired
	TransferService service;
	
	@RequestMapping("transfer.do")
	public String Transfer() {
		return "transfer";
		
	}
	
	
	@RequestMapping("selectfour.do")
	@ResponseBody
    public HashMap<String, Object> select(int page,int rows,String job) {
    	//计算起始位置
		int start=rows*(page-1);
		
    	return service.select(start, rows,job);
		
	}
	
	@RequestMapping(method=RequestMethod.GET,value="insertfour.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String insert(Transfer t) {
		return service.insert(t);
		
	}
	
	@RequestMapping(method=RequestMethod.GET,value="updatefour.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String update(Transfer t) {
		return service.update(t);
		
	}
	
	@RequestMapping(method=RequestMethod.GET,value="delfour.do",produces={"text/html; charset=utf-8"})
	@ResponseBody
	public String insert(int id) {
		return service.del(id);
		
	}

}
