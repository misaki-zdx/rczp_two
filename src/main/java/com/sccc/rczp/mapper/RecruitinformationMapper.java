package com.sccc.rczp.mapper;

import com.sccc.rczp.bean.po.Recruitinformation;
import com.sccc.rczp.common.mapper.CommonMapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface RecruitinformationMapper extends CommonMapper<Recruitinformation> {
	
	Recruitinformation selecRecruitinformationtAll(int rid);

	int deleteMoreById(int[] arr);

	List<Recruitinformation> selectByWork(String work);

	List<Recruitinformation> searchWork(@Param("work") String work,@Param("path") String path);
}