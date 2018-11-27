package com.sccc.rczp.daoImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sccc.rczp.bean.po.Type;
import com.sccc.rczp.dao.TypeDao;
import com.sccc.rczp.mapper.TypeMapper;

@Repository
public class TypeDaoImp implements TypeDao{
	@Autowired
	private TypeMapper typeMapper;

	public TypeMapper getTypeMapper() {
		return typeMapper;
	}

	public void setTypeMapper(TypeMapper typeMapper) {
		this.typeMapper = typeMapper;
	}

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
