package com.sccc.rczp.mapper;

import com.sccc.rczp.bean.po.Deliverrecord;
import com.sccc.rczp.common.mapper.CommonMapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface DeliverrecordMapper extends CommonMapper<Deliverrecord> {
    List<Deliverrecord> selectByUid(int uid);

    void insertDeliverecord(int rid, Integer uid);
}