package com.sccc.rczp.mapper;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface TempletMapper {
    List<Map> select(String sql);
}
