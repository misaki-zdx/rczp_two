package com.sccc.rczp.daoImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sccc.rczp.bean.po.Admin;
import com.sccc.rczp.dao.AdminDao;
import com.sccc.rczp.mapper.AdminMapper;

@Repository
public class AdminDaoImp implements AdminDao {
	@Autowired
	private AdminMapper adminMapper;

	public AdminMapper getAdminMapper() {
		return adminMapper;
	}

	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}

	@Override
	public List<Admin> selectAll() {
		return adminMapper.selectAll();
	}

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

}
