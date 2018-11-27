package com.sccc.rczp.service;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Type;
import com.sccc.rczp.common.api.SpringContextUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.sccc.rczp.common.service.CommonServicceI;
import org.springframework.stereotype.Service;

public interface TypeService extends CommonServicceI {

    List<Type> selectAll();
    int insert(Type type);
    Type selectByPrimaryKey(Integer tid);
    int updateByPrimaryKey(Type types);
    int deleteByPrimaryKey(Integer tid);

}
