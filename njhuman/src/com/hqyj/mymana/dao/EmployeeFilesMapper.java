package com.hqyj.mymana.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hqyj.mymana.pojo.EmployeeFiles;

public interface EmployeeFilesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeFiles record);

    int insertSelective(EmployeeFiles record);

    EmployeeFiles selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EmployeeFiles record);

    int updateByPrimaryKey(EmployeeFiles record);
    List<EmployeeFiles> selectFile(@Param("start")int start,@Param("row") int row,@Param("filesName") String filesName);
    //查询有条件的总条数
    int selectFileCount(@Param("filesName") String filesName);
}