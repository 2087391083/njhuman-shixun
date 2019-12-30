package com.hqyj.mymana.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hqyj.mymana.pojo.XinChou;

public interface XinChouMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(XinChou record);

    int insertSelective(XinChou record);

    XinChou selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(XinChou record);

    int updateByPrimaryKey(XinChou record);
    
    List<XinChou> select(@Param("start")int start,@Param("row")int row,@Param("userName")String userName);
    
    int selectCount(@Param("userName")String userName);//查询总条数
    
    
}