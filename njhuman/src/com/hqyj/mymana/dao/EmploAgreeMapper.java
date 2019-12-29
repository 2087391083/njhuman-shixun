package com.hqyj.mymana.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hqyj.mymana.pojo.EmploAgree;


public interface EmploAgreeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EmploAgree record);

    int insertSelective(EmploAgree record);

    EmploAgree selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmploAgree record);

    int updateByPrimaryKey(EmploAgree record);
    
    List<EmploAgree> select(@Param("start")int start,@Param("row")int row,@Param("employeeName")String employeeName);
    //查询总条数
    int selectCount(@Param("employeeName")String employeeName);
    
    
}