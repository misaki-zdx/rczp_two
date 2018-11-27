package com.sccc.rczp.mapper;

import com.sccc.rczp.bean.po.Admin;
import com.sccc.rczp.common.mapper.CommonMapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface AdminMapper extends CommonMapper<Admin> {

    public List<Admin> getAllAdmins(int aid);
}