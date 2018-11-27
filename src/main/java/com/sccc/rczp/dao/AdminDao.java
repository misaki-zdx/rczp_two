package com.sccc.rczp.dao;

import java.util.List;

import com.sccc.rczp.bean.po.Admin;


public interface AdminDao {

	List<Admin> selectAll();

	int insert(Admin admin);

	Admin selectByPrimaryKey(Integer aid);
	int updateByPrimaryKey(Admin admins);
	int deleteByPrimaryKey(Integer aid);
}
