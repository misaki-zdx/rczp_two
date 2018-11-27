import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sccc.rczp.bean.po.Admin;
import com.sccc.rczp.mapper.AdminMapper;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class ApplicationTests {
	@Resource
	private SqlSessionFactory sqlSessionFactory;
    @Test
    public void contextLoads() throws IOException {
    	SqlSession openSession = sqlSessionFactory.openSession();
    	AdminMapper mapper = openSession.getMapper(AdminMapper.class);
    	List<Admin> selectAll = mapper.selectAll();
    	for(Admin a: selectAll)
    	System.out.println(a);
    	openSession.close();
    }
}