package com.sccc.rczp.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Enterprise;
import com.sccc.rczp.mapper.EnterpriseMapper;
import com.sccc.rczp.service.EnterpriseService;

@Service
public class EnterpriseServiceImp implements EnterpriseService{
	
	@Autowired
	private EnterpriseMapper enterpriseMapper;


	@Override
	public int insert(Enterprise enterprise) {
		return enterpriseMapper.insert(enterprise);
	}

	@Override
	public Enterprise selectByPrimaryKey(Integer eid) {
		return enterpriseMapper.selectByPrimaryKey(eid);
	}

	@Override
	public int updateByPrimaryKey(Enterprise enterprises) {
		return enterpriseMapper.updateByPrimaryKey(enterprises);
	}

	@Override
	public int deleteByPrimaryKey(Integer eid) {
		return enterpriseMapper.deleteByPrimaryKey(eid);
	}

}
