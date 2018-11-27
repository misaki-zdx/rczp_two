package com.sccc.rczp.dao;

import java.util.List;

import com.sccc.rczp.bean.po.User;

public interface UserDao {

	List<User> selectAll();

	int insert(User user);

	User selectByPrimaryKey(Integer uid);
	int updateByPrimaryKey(User users);
	int deleteByPrimaryKey(Integer uid);
}
