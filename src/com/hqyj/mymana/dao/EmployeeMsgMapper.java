package com.hqyj.mymana.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hqyj.mymana.pojo.EmployeeMsg;
import com.hqyj.mymana.pojo.EmployeeMsgKey;


public interface EmployeeMsgMapper {
    int deleteByPrimaryKey(int id);

    int insert(EmployeeMsg record);

    int insertSelective(EmployeeMsg record);

    EmployeeMsg selectByPrimaryKey(EmployeeMsgKey key);

    int updateByPrimaryKeySelective(EmployeeMsg record);

    int updateByPrimaryKey(EmployeeMsg record);
    
    int login(EmployeeMsg user);
    
    List<EmployeeMsg> select(@Param("start") int start,@Param("row") int row,@Param("name") String name);//查询 
    
    int selectCount(@Param("name") String name);//查询总条数
}