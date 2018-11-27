package com.sccc.rczp.daoImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sccc.rczp.bean.po.User;
import com.sccc.rczp.dao.UserDao;
import com.sccc.rczp.mapper.UserMapper;

@Repository
public class UserDaoImp implements UserDao{
	@Autowired
	private UserMapper userMapper;

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public List<User> selectAll() {

		return userMapper.selectAll();
	}

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

}
