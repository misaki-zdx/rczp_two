package com.sccc.rczp.mapper;

import com.sccc.rczp.bean.po.User;
import com.sccc.rczp.common.mapper.CommonMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface UserMapper extends CommonMapper<User> {
    User selectUserAll(int uid);

    void updateUserSpecial(User user);

    List<User> selectByGeneralName(String name);
    
    User login(@Param("rid") int rid, @Param("password") String password);

    User selectUserAll2(int uid);
}