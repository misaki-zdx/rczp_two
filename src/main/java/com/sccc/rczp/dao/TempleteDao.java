package com.sccc.rczp.dao;

import java.util.List;
import java.util.Map;

public interface TempleteDao {
    List<Map> select();

    List<Map> select2();

    List<Map> select3(String sql);

}
