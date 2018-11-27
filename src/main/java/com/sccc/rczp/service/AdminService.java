package com.sccc.rczp.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Admin;
import com.sccc.rczp.common.api.SpringContextUtils;
import com.sccc.rczp.common.service.CommonServicceI;

public interface AdminService extends CommonServicceI {

	int insert(Admin admin);

	Admin selectByPrimaryKey(Integer aid);

	int updateByPrimaryKey(Admin admins);

	int deleteByPrimaryKey(Integer aid);

	public List<Admin> getAllAdmins(int aid);
}
