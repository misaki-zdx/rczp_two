package com.sccc.rczp.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Audit;
import com.sccc.rczp.common.api.SpringContextUtils;
import com.sccc.rczp.common.service.CommonServicceI;

public interface AuditService extends CommonServicceI {

	int insert(Audit audit);

	Audit selectByPrimaryKey(Integer auid);

	int updateByPrimaryKey(Audit audits);

	int deleteByPrimaryKey(Integer auid);

}
