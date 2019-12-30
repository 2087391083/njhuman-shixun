package com.hqyj.mymana.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.mymana.dao.EmployeeFilesMapper;
import com.hqyj.mymana.pojo.EmployeeFiles;
import com.hqyj.mymana.service.EmployeeFilesService;
@Service
public class EmployeeFilesServiceImpl implements EmployeeFilesService{
   @Autowired
    EmployeeFilesMapper mapper;
	@Override
	public HashMap<String, Object> selectFile(int start, int row, String filesName) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		   if (filesName==null||filesName.equals("")) {
			   
			   filesName=null;
			
		  }else{
			  
			  filesName="%"+filesName+"%";
		  }
		   map.put("total", mapper.selectFileCount(filesName));//总条数
		   map.put("rows", mapper.selectFile(start, row, filesName));//查询出来的集合
			return map;
	}
	@Override
	public String insert(EmployeeFiles e) {
		// 新增
    	int num=mapper.insertSelective(e);
    	if (num>0){
    		return "新增成功";
			
		}
	      return "新增失败";
	}
	@Override
	public String update(EmployeeFiles e) {
		int num=mapper.updateByPrimaryKeySelective(e);
    	if (num>0){
    		return "修改成功";
			
		}
	      return "修改失败";
	}
	@Override
	public String del(int id) {
		int num=mapper.deleteByPrimaryKey(id);
		if (num>0){
	   		return "删除成功";
				
			}
		      return "删除失败";
	}


}
