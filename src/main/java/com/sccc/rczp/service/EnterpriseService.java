package com.sccc.rczp.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Enterprise;
import com.sccc.rczp.common.api.SpringContextUtils;
import com.sccc.rczp.common.service.CommonServicceI;

public interface EnterpriseService extends CommonServicceI {

	int insert(Enterprise enterprise);

	Enterprise selectByPrimaryKey(Integer eid);

	int updateByPrimaryKey(Enterprise enterprises);

	int deleteByPrimaryKey(Integer eid);

}
