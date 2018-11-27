package com.sccc.rczp.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Audit;
import com.sccc.rczp.mapper.AuditMapper;
import com.sccc.rczp.service.AuditService;

@Service
public class AuditServiceImp implements AuditService{
	
	@Autowired
	private AuditMapper auditMapper;

/*
	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> getAll(Class<T> var, int pageNum, int pageSize)
			throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
		PageHelper.offsetPage(pageNum, pageSize);
		Object o = getSimpleObject(var);
		Method method = o.getClass().getMethod("selectAll");
		Object invoke = method.invoke(o);
		return (List<T>) invoke;
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> PageInfo<T> getAllAndPageInfo(Class<T> var, int pageNum, int pageSize)
			throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
		Object o = getSimpleObject(var);
		Method method = o.getClass().getMethod("selectAll");

		PageHelper.startPage(pageNum, pageSize);
		Object invoke = method.invoke(o);

		List<T> list = (List<T>) invoke;
		return PageInfo.of(list);
	}
*/

	@Override
	public int insert(Audit audit) {
		return auditMapper.insert(audit);
	}

	@Override
	public Audit selectByPrimaryKey(Integer auid) {
		return auditMapper.selectByPrimaryKey(auid);
	}

	@Override
	public int updateByPrimaryKey(Audit audits) {
		return auditMapper.updateByPrimaryKey(audits);
	}

	@Override
	public int deleteByPrimaryKey(Integer auid) {
		return auditMapper.deleteByPrimaryKey(auid);
	}

}
