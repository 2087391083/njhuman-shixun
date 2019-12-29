package com.hqyj.mymana.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hqyj.mymana.pojo.six;

public interface sixMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(six record);

    int insertSelective(six record);

    six selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(six record);

    int updateByPrimaryKey(six record);
    List<six> select(@Param("start")int start,@Param("row")int row,@Param("type")String type);
    //��ѯ������
    int selectCount(@Param("type") String type);
}