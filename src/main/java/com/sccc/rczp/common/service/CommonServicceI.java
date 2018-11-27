package com.sccc.rczp.common.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.common.api.SpringContextUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

public interface CommonServicceI {

    default Object getSimpleObject(Class<?> var) {

        String simpleName = var.getSimpleName();
        if (!Character.isLowerCase(simpleName.charAt(0))) {
            simpleName = Character.toLowerCase(simpleName.charAt(0)) + simpleName.substring(1);
        }
        return SpringContextUtils.getBean(simpleName + "Mapper");
    }

    @SuppressWarnings("unchecked")
   default  <T> List<T> getAll(Class<T> var, int pageNum, int pageSize)
            throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        PageHelper.offsetPage(pageNum, pageSize);
        Object o = getSimpleObject(var);
        Method method = o.getClass().getMethod("selectAll");
        Object invoke = method.invoke(o);
        return (List<T>) invoke;
    }

    default  <T> PageInfo<T> getAllAndPageInfo(Class<T> var, int pageNum, int pageSize)
            throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Object o = getSimpleObject(var);
        Method method = o.getClass().getMethod("selectAll");
        PageHelper.startPage(pageNum, pageSize);
        Object invoke = method.invoke(o);
        List<T> list = (List<T>) invoke;
        return PageInfo.of(list);
    }
}
