package Activity;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.junit.Test;

import java.util.List;

public class MyWorkQueryProcess {
    ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();

    //查询流程定义明细
    @Test
    public void queryProcdef(){
        RepositoryService repositoryService = processEngine.getRepositoryService();
        //创建查询对象
        ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        //添加查询条件

        processDefinitionQuery.processDefinitionKey("myProcess_1");  //通过key查询
        List<ProcessDefinition> list = processDefinitionQuery.list();
        for (ProcessDefinition pd : list){
            System.out.println("ID:"+pd.getId()+",NAME:"+pd.getName()+",KEY:"+pd.getKey()+",VERSION:"+pd.getVersion()+",RESOURCE_NAME:"+pd.getResourceName()+",DGRM_RESOURCE_NAME:"+pd.getDiagramResourceName());
        }
    }
}
