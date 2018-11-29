import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.service.AdminService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sccc.rczp.bean.po.Admin;
import com.sccc.rczp.mapper.AdminMapper;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
public class ApplicationTests2 {
	@Resource
	private SqlSessionFactory sqlSessionFactory;

	@Resource(name = "adminService")
	private AdminService adminService;
    @Test
    public void contextLoads() throws IOException {
    	SqlSession openSession = sqlSessionFactory.openSession();
    	AdminMapper mapper = openSession.getMapper(AdminMapper.class);
		PageHelper.offsetPage(0,1);
    	List<Admin> selectAll = mapper.selectAll();
    	for(Admin a: selectAll)
    	System.out.println(a);
    	openSession.close();
    }

	@Test
    public void testGetAllAndPageInfo(){
		PageInfo<Admin> allAndPageInfo = null;
		try {
			allAndPageInfo = adminService.getAllAndPageInfo(Admin.class, 1, 2);
		} catch (NoSuchMethodException | InvocationTargetException | IllegalAccessException e) {
			e.printStackTrace();
		}
		System.out.println(allAndPageInfo);
	}
}