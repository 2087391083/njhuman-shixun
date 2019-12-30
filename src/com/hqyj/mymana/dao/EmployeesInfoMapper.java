package com.hqyj.mymana.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hqyj.mymana.pojo.EmployeesInfo;

public interface EmployeesInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EmployeesInfo record);

    int insertSelective(EmployeesInfo record);

    EmployeesInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmployeesInfo record);

    int updateByPrimaryKey(EmployeesInfo record);
    
    List<EmployeesInfo> select(@Param("start")int start,@Param("row")int row,@Param("ename") String ename);

    //查询总条数
    int selectCount(@Param("ename") String ename);
}