package com.sccc.rczp.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import com.sccc.rczp.mapper.TypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Type;
import com.sccc.rczp.dao.TypeDao;
import com.sccc.rczp.service.TypeService;

@Service
public class TypeServiceImp implements TypeService{

	private TypeMapper typeMapper;

	public TypeMapper getTypeMapper() {
		return typeMapper;
	}
	@Autowired
	public void setTypeMapper(TypeMapper typeMapper) {
		this.typeMapper = typeMapper;
	}

/*	@SuppressWarnings("unchecked")
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
	}*/

	@Override
	public List<Type> selectAll() {
		return typeMapper.selectAll();
	}

	@Override
	public int insert(Type type) {
		return typeMapper.insert(type);
	}

	@Override
	public Type selectByPrimaryKey(Integer tid) {
		return typeMapper.selectByPrimaryKey(tid);
	}

	@Override
	public int updateByPrimaryKey(Type types) {
		return typeMapper.updateByPrimaryKey(types);
	}

	@Override
	public int deleteByPrimaryKey(Integer tid) {
		return typeMapper.deleteByPrimaryKey(tid);
	}

}
