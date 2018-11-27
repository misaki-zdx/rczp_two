package com.sccc.rczp.controller;

import java.lang.reflect.InvocationTargetException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Audit;
import com.sccc.rczp.service.AuditService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/audit")
@Controller
public class AuditController {

    private AuditService auditService;

    @Autowired
    public AuditController(AuditService auditService) {
        this.auditService = auditService;
    }

    @RequestMapping
    public String getAllAuditPage() {
        return "audit/list";
    }

    // 查询所有
    @ResponseBody
    @RequestMapping("/selectAll")
    public  PageInfo<Audit>  getAllAudit(@RequestParam(defaultValue = "1") Integer pageNum,
                                    @RequestParam(defaultValue = "10") Integer pageSize)
            throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        return auditService.getAllAndPageInfo(Audit.class, pageNum, pageSize);
    }

    //跳转list页面
    @RequestMapping("/list")
    public String list(){
        return "audit/list";
    }

    // 跳转添加页面
    @RequestMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("audit/add");
    }

    // 添加
    @RequestMapping("/addAudit")
    public void addAudit(Audit audit, HttpServletRequest request, HttpServletResponse response) {
        auditService.insert(audit);
    }

    // 按主键查询
    @RequestMapping("/showAid")
    public ModelAndView showAid(Audit audit) {
        Audit audits = auditService.selectByPrimaryKey(audit.getAuid());
        return new ModelAndView("audit/update", "audits", audits);
    }

    // 更新
    @RequestMapping("/update")
    public void updateAudit(Audit audits) {
        auditService.updateByPrimaryKey(audits);
    }

    // 按主键删除
    @RequestMapping("/delete")
    public void deleteAudit(Audit audit,HttpServletRequest request,HttpServletResponse response) {
        auditService.deleteByPrimaryKey(audit.getAuid());
    }
}
