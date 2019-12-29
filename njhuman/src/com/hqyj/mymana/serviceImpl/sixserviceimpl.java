package com.hqyj.mymana.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mymana.dao.sixMapper;
import com.hqyj.mymana.pojo.six;
import com.hqyj.mymana.service.sixservice;

@Service
public class sixserviceimpl implements sixservice{
	@Autowired
	sixMapper mapper;
	@Override
public HashMap<String,Object> select(int start,int row,String userName){
		HashMap<String,Object> map=new HashMap<String, Object>();
		if(userName==null||userName.equals(""))
			userName=null;
		else
			userName="%"+userName+"%";
		map.put("total", mapper.selectCount(userName));
		map.put("rows", mapper.select(start,row,userName));		
		return map;
	}
	@Override
	public String insert(six u) {
		int num=mapper.insertSelective(u);
		if(num>0){
			return "新增成功！";
		}
		return "新增失败!";
	}
	@Override
	public String update(six u) {
		int num=mapper.updateByPrimaryKeySelective(u);
		if(num>0){
			return "修改成功";
		}
		return "修改失败";
	}
	@Override
	public String del(int id) {
		if(mapper.deleteByPrimaryKey(id)>0){
			return "删除成功！";
		}
		return "删除失败！";
	}
}