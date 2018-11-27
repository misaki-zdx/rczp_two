package com.sccc.rczp.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Admin;
import com.sccc.rczp.mapper.AdminMapper;
import com.sccc.rczp.service.AdminService;

@Service
public class AdminServiceImp implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;

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
	public int insert(Admin admin) {
		return adminMapper.insert(admin);
	}

	@Override
	public Admin selectByPrimaryKey(Integer aid) {
		return adminMapper.selectByPrimaryKey(aid);
	}

	@Override
	public int updateByPrimaryKey(Admin admins) {
		return adminMapper.updateByPrimaryKey(admins);
	}

	@Override
	public int deleteByPrimaryKey(Integer aid) {
		return adminMapper.deleteByPrimaryKey(aid);
	}

	@Override
	public List<Admin> getAllAdmins(int aid) {
		return adminMapper.getAllAdmins(aid);
	}

}
