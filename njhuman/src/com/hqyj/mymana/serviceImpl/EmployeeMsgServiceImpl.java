package com.hqyj.mymana.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;


import com.hqyj.mymana.dao.EmployeeMsgMapper;
import com.hqyj.mymana.pojo.EmployeeMsg;
import com.hqyj.mymana.service.EmployeeMsgService;


@Service
public class EmployeeMsgServiceImpl implements EmployeeMsgService {
	@Autowired
	EmployeeMsgMapper mapper;

	@Override
	public HashMap<String, Object> select(int start,int row,String name) {
		HashMap<String, Object> map=new HashMap<String,Object>();
		if(name==null||name.equals("")){
			name=null;
		}else{
			name="%"+name+"%";//模糊查询
		}
		map.put("total", mapper.selectCount(name));//total不能修改，由前端页面定义好的
		map.put("rows", mapper.select(start,row,name));//查询出来的集合
		return map;
	}

	@Override
	public String insertly(EmployeeMsg u) {
		int num=mapper.insertSelective(u);
		if(num>0){
			return "新增成功！";
		}
		return "新增失败！";
	}

	@Override
	public String updately(EmployeeMsg u) {
		int num=mapper.updateByPrimaryKeySelective(u);
		if(num>0){
			return "修改成功！";
		}
		return "修改失败！";
	}




	@Override
	public String del(int id) {
		int  num=mapper.deleteByPrimaryKey(id);
		if(num>0){
			return "删除成功！";
		}
		return "删除失败！";
	}
	
	
	@Override
	public String login(EmployeeMsg user,ModelMap map) {
		//如果登陆成功跳转到index.jsp页面，如果失败跳转到login.jsp页面
		int num=mapper.login(user);
	
		if(num>0){
			return "index";
		}else{
			map.addAttribute("info","用户登录失败");//
			return "login";
		}
	}
	
}
