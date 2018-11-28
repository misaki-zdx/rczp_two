package Activity;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.TaskService;
import org.junit.Test;

public class MyWorkProcessApproval {
    ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();

    //审核过程
    @Test
    public void startProcessApproval() {
        TaskService taskService = processEngine.getTaskService();
        //taskId 就是查询任务中的 ID
        String taskId = "2504";
        //完成请假申请任务
        taskService.complete(taskId);
    }
}
