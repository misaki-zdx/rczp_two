package com.sccc.rczp.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Deliverrecord;
import com.sccc.rczp.common.api.SpringContextUtils;
import com.sccc.rczp.common.service.CommonServicceI;

public interface DeliverrecordService extends CommonServicceI {

	int insert(Deliverrecord deliverrecord);

	Deliverrecord selectByPrimaryKey(Integer did);

	int updateByPrimaryKey(Deliverrecord deliverrecords);

	int deleteByPrimaryKey(Integer did);

    List<Deliverrecord> selectByUid(int uid);

    void insertDeliverecord(int rid, Integer uid);
}
