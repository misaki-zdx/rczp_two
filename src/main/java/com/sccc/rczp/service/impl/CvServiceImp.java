package com.sccc.rczp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sccc.rczp.bean.po.Cv;
import com.sccc.rczp.mapper.CvMapper;
import com.sccc.rczp.service.CvService;
@Service
public class CvServiceImp implements CvService{
	@Autowired
	private CvMapper cvMapper;

	@Override
	public int insert(Cv cv) {
		return cvMapper.insert(cv);
	}

	@Override
	public Cv selectByPrimaryKey(Integer cid) {
		// TODO Auto-generated method stub
		return cvMapper.selectByPrimaryKey(cid);
	}

	@Override
	public int updateByPrimaryKey(Cv cvs) {
		// TODO Auto-generated method stub
		return cvMapper.updateByPrimaryKey(cvs);
	}

	@Override
	public int deleteByPrimaryKey(Integer cid) {
		// TODO Auto-generated method stub
		return cvMapper.deleteByPrimaryKey(cid);
	}

}
