package com.ssm.dao;

import com.ssm.domain.Emp;

import java.util.Map;

public interface EmpDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);

    Emp selectByNameAndPass(Map<String, String> map);
}