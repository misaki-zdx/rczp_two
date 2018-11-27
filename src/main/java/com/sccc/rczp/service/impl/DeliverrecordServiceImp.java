package com.sccc.rczp.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Deliverrecord;
import com.sccc.rczp.mapper.DeliverrecordMapper;
import com.sccc.rczp.service.DeliverrecordService;

@Service
public class DeliverrecordServiceImp implements DeliverrecordService{
	
	@Autowired
	private DeliverrecordMapper deliverrecordMapper;

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
	public int insert(Deliverrecord deliverrecord) {
		return deliverrecordMapper.insert(deliverrecord);
	}

	@Override
	public Deliverrecord selectByPrimaryKey(Integer did) {
		return deliverrecordMapper.selectByPrimaryKey(did);
	}

	@Override
	public int updateByPrimaryKey(Deliverrecord deliverrecords) {
		return deliverrecordMapper.updateByPrimaryKey(deliverrecords);
	}

	@Override
	public int deleteByPrimaryKey(Integer did) {
		return deliverrecordMapper.deleteByPrimaryKey(did);
	}

	@Override
	public List<Deliverrecord> selectByUid(int uid) {
		return deliverrecordMapper.selectByUid( uid);
	}

	@Override
	public void insertDeliverecord(int rid, Integer uid) {
		deliverrecordMapper.insertDeliverecord(rid,uid);
	}

}
