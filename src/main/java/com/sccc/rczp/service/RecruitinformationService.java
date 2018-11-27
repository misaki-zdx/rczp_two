package com.sccc.rczp.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Enterprise;
import com.sccc.rczp.bean.po.Recruitinformation;
import com.sccc.rczp.common.api.SpringContextUtils;
import com.sccc.rczp.common.service.CommonServicceI;

public interface RecruitinformationService extends CommonServicceI {

	/*default Object getSimpleObject(Class<?> var) {

		String simpleName = var.getSimpleName();
		if (!Character.isLowerCase(simpleName.charAt(0))) {
			simpleName = Character.toLowerCase(simpleName.charAt(0)) + simpleName.substring(1);
		}
		return SpringContextUtils.getBean(simpleName + "Mapper");
	}

	<T> List<T> getAll(Class<T> var, int pageNum, int pageSize)
			throws NoSuchMethodException, InvocationTargetException, IllegalAccessException;
	
	<T> PageInfo<T> getAllAndPageInfo(Class<T> var, int pageNum, int pageSize)
			throws NoSuchMethodException, InvocationTargetException, IllegalAccessException;*/

    int insert(Recruitinformation var);

    Recruitinformation selectByPrimaryKey(Integer var);

    int updateByPrimaryKey(Recruitinformation var);

    int deleteByPrimaryKey(Integer var);

    Recruitinformation selecRecruitinformationtAll(int rid);

    int deleteMoreById(int[] arr);

    List<Recruitinformation> selectByWork(String work);

    List<Recruitinformation> searchWork(String work,String path);
}
