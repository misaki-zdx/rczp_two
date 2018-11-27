package com.sccc.rczp.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import com.sccc.rczp.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.User;
import com.sccc.rczp.dao.UserDao;
import com.sccc.rczp.service.UserService;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserMapper userMapper;

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

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
	public int insert(User user) {
		return userMapper.insert(user);
	}

	@Override
	public User selectByPrimaryKey(Integer uid) {
		return userMapper.selectByPrimaryKey(uid);
	}

	@Override
	public int updateByPrimaryKey(User users) {
		return userMapper.updateByPrimaryKey(users);
	}

	@Override
	public int deleteByPrimaryKey(Integer uid) {
		return userMapper.deleteByPrimaryKey(uid);
	}

	@Override
	public User selectUserAll(int uid) {
		return userMapper.selectUserAll(uid);
	}

	@Override
	public void updateUserSpecial(User user) {
		userMapper.updateUserSpecial(user);
	}

	@Override
	public List<User> selectByGeneralName(String name) {
		return userMapper.selectByGeneralName(name);
	}

	@Override
	public User login(int rid, String password) {
		User login = userMapper.login(rid, password);
		return login;
	}

	@Override
	public User selectUserAll2(int uid) {
		return userMapper.selectUserAll2(uid);
	}

}
