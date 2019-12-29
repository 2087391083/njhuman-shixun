package com.hqyj.mymana.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mymana.dao.TransferMapper;
import com.hqyj.mymana.pojo.Transfer;
import com.hqyj.mymana.service.TransferService;

@Service
public class TransferServiceImpl implements TransferService{
	
	@Autowired
	TransferMapper mapper;

	@Override
	public HashMap<String, Object> select(int start, int row, String job) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		if (job==null||job.equals("")) {
			job=null;
		}else{
			job="%"+job+"%";
		}
		map.put("total",mapper.selectCount(job));
		map.put("rows", mapper.select(start, row,job));
		
		return map;
	
	}

	@Override
	public String insert(Transfer t) {
		//新增，修改，删除均返回的是受影响的行数
				int num=mapper.insertSelective(t);
				if (num>0) {
					return "新增成功";
				}
				return "新增失败";
			}
	

	@Override
	public String update(Transfer t) {
		int num=mapper.updateByPrimaryKeySelective(t);
		if (num>0) {
			return "修改成功";
		}
		return "修改失败";
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
