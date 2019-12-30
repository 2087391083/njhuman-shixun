package com.hqyj.mymana.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mymana.dao.XinChouMapper;
import com.hqyj.mymana.pojo.XinChou;
import com.hqyj.mymana.service.XinChouService;
@Service
public class XinChouServiceImpl implements XinChouService{
	
	
	@Autowired
	XinChouMapper mapper;

	@Override
	public HashMap<String, Object> select(int start, int row,String userName) {
		/*List<XinChou> aa=mapper.select(start, row);*/
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		if (userName==null||userName.equals("")) {
			userName=null;
		}else{
			userName="%"+userName+"%";//因为sql语句是模糊查询,再执行下面的语句进行查询
		}
		map.put("total", mapper.selectCount(userName));//总条数
		map.put("rows", mapper.select(start, row,userName));
		
		return map;
	}

	@Override
	public String insert(XinChou xc) {
		int num=mapper.insertSelective(xc);
		if (num>0) {
			return "添加成功";
		}
		return "抱歉！未添加成功。";
	}

	@Override
	public String delete(int id) {
		int num=mapper.deleteByPrimaryKey(id);
		if (num>0) {
			return "已经删除。";
		}
		return "请重新删除。";
	}

	@Override
	public String update(XinChou xc) {
		int num=mapper.updateByPrimaryKeySelective(xc);
		if (num>0) {
			return "修改成功。";
		}
		return "修改失败。";
	}

	

	

}
