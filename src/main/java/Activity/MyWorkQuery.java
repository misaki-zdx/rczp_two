package Activity;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.junit.Test;

import java.util.List;

public class MyWorkQuery {
    ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();

    //查询流程
    @Test
    public void queryTask() {
        TaskService taskService = processEngine.getTaskService();
        //根据assignee（节点接收人,代理人） 查询任务
        String assignee = "经理";
        List<Task> tasks = taskService.createTaskQuery().taskAssignee(assignee).list();
        int size = tasks.size();
        for (Task task : tasks) {
            System.out.println("taskId=" + "流程任务节点信息ID：" + task.getId() +
                    ",taskName:" + "流程任务节点名称ID：" + task.getName() +
                    ",assignee:" + "流程任务节点接受人：" + task.getAssignee() +
                    ",createTime:" + "流程任务节点创建时间：" + task.getCreateTime());
        }
    }
}
