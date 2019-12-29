package com.hqyj.mymana.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mymana.dao.EmploAgreeMapper;
import com.hqyj.mymana.pojo.EmploAgree;
import com.hqyj.mymana.service.EmploAgreeService;

@Service
public class EmploAgreeServiceImpl implements EmploAgreeService{
	@Autowired
	EmploAgreeMapper mapper;
	@Override
	public HashMap<String,Object> select(int start,int row,String employeeName) {
		
		HashMap<String,Object> map=new HashMap<String,Object>();
		if(employeeName==null||employeeName.equals("")){
			employeeName=null;
		}else{
			employeeName="%"+employeeName+"%";
		}
		map.put("total", mapper.selectCount(employeeName));
		map.put("rows", mapper.select(start,row,employeeName));
		return map;
	}
	@Override
	public String insert(EmploAgree e) {
		int num=mapper.insertSelective(e);
		if(num>0){
			return "新增成功";
		}
		return "新增失败";
	}
	@Override
	public String update(EmploAgree e) {
		int num=mapper.updateByPrimaryKeySelective(e);
		if(num>0){
			return "修改成功";
		}
		return "修改失败";
	}
	@Override
	public String del(int id) {
		int num=mapper.deleteByPrimaryKey(id);
		if(num>0){
			return "删除成功";
		}
		return "删除失败";
	}
}