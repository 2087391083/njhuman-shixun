package com.hqyj.mymana.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hqyj.mymana.pojo.Transfer;

public interface TransferMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Transfer record);

    int insertSelective(Transfer record);

    Transfer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Transfer record);

    int updateByPrimaryKey(Transfer record);
    
    List<Transfer> select(@Param("start") int start,@Param("row")int row,@Param("job")String job);
    //查询总条数
int selectCount(@Param("job") String job);
}