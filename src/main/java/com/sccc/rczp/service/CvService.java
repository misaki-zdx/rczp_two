package com.sccc.rczp.service;


import com.sccc.rczp.bean.po.Cv;
import com.sccc.rczp.common.service.CommonServicceI;

public interface CvService extends CommonServicceI {

	int insert(Cv cv);

	Cv selectByPrimaryKey(Integer cid);

	int updateByPrimaryKey(Cv cvs);

	int deleteByPrimaryKey(Integer cid);

}
