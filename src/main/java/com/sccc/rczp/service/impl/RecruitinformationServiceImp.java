package com.sccc.rczp.service.impl;

import com.sccc.rczp.bean.po.Enterprise;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sccc.rczp.bean.po.Recruitinformation;
import com.sccc.rczp.mapper.RecruitinformationMapper;
import com.sccc.rczp.service.RecruitinformationService;

@Service
public class RecruitinformationServiceImp implements RecruitinformationService {

    @Autowired
    private RecruitinformationMapper recruitiformationMapper;

	/*@SuppressWarnings("unchecked")
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
    public int insert(Recruitinformation var) {
        return recruitiformationMapper.insert(var);
    }

    @Override
    public Recruitinformation selectByPrimaryKey(Integer var) {
        return recruitiformationMapper.selectByPrimaryKey(var);
    }

    @Override
    public int updateByPrimaryKey(Recruitinformation var) {
        return recruitiformationMapper.updateByPrimaryKeySelective(var);
    }

    @Override
    public int deleteByPrimaryKey(Integer var) {
        return recruitiformationMapper.deleteByPrimaryKey(var);
    }

    @Override
    public Recruitinformation selecRecruitinformationtAll(int rid) {
        return recruitiformationMapper.selecRecruitinformationtAll(rid);
    }

    @Override
    public int deleteMoreById(int[] arr) {
        return recruitiformationMapper.deleteMoreById(arr);
    }

	@Override
	public List<Recruitinformation> selectByWork(String work) {
		return recruitiformationMapper.selectByWork(work);
	}

    @Override
    public List<Recruitinformation> searchWork(String work, String path) {
        return recruitiformationMapper.searchWork(work,path);
    }
}
