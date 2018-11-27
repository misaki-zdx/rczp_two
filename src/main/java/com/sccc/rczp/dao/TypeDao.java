package com.sccc.rczp.dao;

import java.util.List;

import com.sccc.rczp.bean.po.Type;

public interface TypeDao {

	List<Type> selectAll();

	int insert(Type type);

	Type selectByPrimaryKey(Integer tid);
	int updateByPrimaryKey(Type types);
	int deleteByPrimaryKey(Integer tid);
}
