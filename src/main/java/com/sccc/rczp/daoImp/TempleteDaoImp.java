package com.sccc.rczp.daoImp;

import com.sccc.rczp.dao.TempleteDao;
import com.sccc.rczp.mapper.TempletMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class TempleteDaoImp implements TempleteDao {


    @Autowired
    private TempletMapper templetMapper;

/*    public void setTempletMapper(TempletMapper templetMapper) {
        this.templetMapper = templetMapper;
    }*/

    @Override
    public List<Map> select() {
        String sql ="SELECT intention name ,COUNT(uid) value FROM USER WHERE uid IN(SELECT uid FROM USER WHERE LENGTH(uname)<10) GROUP BY intention;\n";
        List<Map> select = new ArrayList<>();
          select = templetMapper.select(sql);
        return select;
    }

    @Override
    public List<Map> select2() {
        String sql = "SELECT CONCAT(FLOOR(DATEDIFF(CURDATE(),birthday)/365/10)*10,'-',FLOOR(DATEDIFF(CURDATE(),birthday)/365/10)*10+10) age,sex,intention,COUNT(*) COUNT FROM USER WHERE LENGTH(uname)<10 GROUP BY sex,intention,FLOOR(DATEDIFF(CURDATE(),birthday)/365/10)*10";
        return templetMapper.select(sql);
    }

    @Override
    public List<Map> select3(String sql) {
        return templetMapper.select(sql);
    }

}
