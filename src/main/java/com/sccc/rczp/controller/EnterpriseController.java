package com.sccc.rczp.controller;

import java.lang.reflect.InvocationTargetException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Enterprise;
import com.sccc.rczp.service.EnterpriseService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/enterprise")
@Controller
public class EnterpriseController {

    private EnterpriseService enterpriseService;

    @Autowired
    public EnterpriseController(EnterpriseService enterpriseService) {
        this.enterpriseService = enterpriseService;
    }

    @RequestMapping
    public String getAllEnterprisePage() {
        return "enterprise/list";
    }

    // 查询所有
    @ResponseBody
    @RequestMapping("/selectAll")
    public  PageInfo<Enterprise>  getAllEnterprise(@RequestParam(defaultValue = "1") Integer pageNum,
                                    @RequestParam(defaultValue = "10") Integer pageSize)
            throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        return enterpriseService.getAllAndPageInfo(Enterprise.class, pageNum, pageSize);
    }

    //跳转list页面
    @RequestMapping("/list")
    public String list(){
        return "enterprise/list";
    }

    // 跳转添加页面
    @RequestMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("enterprise/add");
    }

    // 添加
    @RequestMapping("/addEnterprise")
    public void addEnterprise(Enterprise enterprise, HttpServletRequest request, HttpServletResponse response) {
        enterpriseService.insert(enterprise);
    }

    // 按主键查询
    @RequestMapping("/showEid")
    public ModelAndView showEid(Enterprise enterprise) {
        Enterprise enterprises = enterpriseService.selectByPrimaryKey(enterprise.getEid());
        return new ModelAndView("enterprise/update", "enterprises", enterprises);
    }

    // 更新
    @RequestMapping("/update")
    public void updateEnterprise(Enterprise enterprises) {
        enterpriseService.updateByPrimaryKey(enterprises);
    }

    // 按主键删除
    @RequestMapping("/delete")
    public void deleteEnterprise(Enterprise enterprise,HttpServletRequest request,HttpServletResponse response) {
        enterpriseService.deleteByPrimaryKey(enterprise.getEid());
    }
}
