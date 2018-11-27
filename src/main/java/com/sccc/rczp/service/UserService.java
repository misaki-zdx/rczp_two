package com.sccc.rczp.service;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.User;
import com.sccc.rczp.common.api.SpringContextUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.sccc.rczp.common.service.CommonServicceI;
import org.springframework.stereotype.Service;

public interface UserService extends CommonServicceI {

    int insert(User user);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKey(User users);

    int deleteByPrimaryKey(Integer uid);

    User selectUserAll(int uid);

    void updateUserSpecial(User user);

    List<User> selectByGeneralName(String name);

	User login(int rid, String upassword);

    User selectUserAll2(int uid);
}
