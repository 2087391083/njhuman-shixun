package com.hqyj.mymana.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mymana.dao.EmployeesInfoMapper;
import com.hqyj.mymana.pojo.EmployeesInfo;
import com.hqyj.mymana.service.EmployeesInfoService;

@Service
public class EmployeesInfoServiceImpl implements EmployeesInfoService{
	
	//注入数据访问层dao层
	@Autowired
	EmployeesInfoMapper mapper;
	
	@Override
	public HashMap<String, Object> select(int start, int row, String ename) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		if (ename==null||ename.equals("")) {
			ename=null;
		}else{
			ename="%"+ename+"%";
		}
		map.put("total", mapper.selectCount(ename));
		map.put("rows", mapper.select(start, row, ename));
		return map;
	}

	@Override
	public String insert(EmployeesInfo e) {
		int num=mapper.insertSelective(e);
		if (num>0) {
			return "新增成功";
		}
		return "新增失败";
	}

	@Override
	public String update(EmployeesInfo e) {
		int num=mapper.updateByPrimaryKeySelective(e);
		if (num>0) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public String del(int id) {
		int num=mapper.deleteByPrimaryKey(id);
		if (num>0) {
			return "删除成功";
		}
		return "删除失败";
	}

}
