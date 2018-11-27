package com.sccc.rczp.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Admin;
import com.sccc.rczp.service.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/admin")
@Controller
public class AdminController {

    private AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping
    public String getAllAdminPage() {
        return "admin/list";
    }

    // 查询所有
    @ResponseBody
    @RequestMapping("/selectAll")
    public  PageInfo<Admin>  getAllAdmin(@RequestParam(defaultValue = "1") Integer pageNum,
                                    @RequestParam(defaultValue = "10") Integer pageSize)
            throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        return adminService.getAllAndPageInfo(Admin.class, pageNum, pageSize);
    }

    //跳转list页面
    @RequestMapping("/list")
    public String list(){
        return "admin/list";
    }

    // 跳转添加页面
    @RequestMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("admin/add");
    }

    // 添加
    @RequestMapping("/addAdmin")
    public void addAdmin(Admin admin, HttpServletRequest request, HttpServletResponse response) {
        adminService.insert(admin);
    }

    // 按主键查询
    @RequestMapping("/showAid")
    public ModelAndView showAid(Admin admin) {
        Admin admins = adminService.selectByPrimaryKey(admin.getAid());
        return new ModelAndView("admin/update", "admins", admins);
    }

    // 更新
    @RequestMapping("/update")
    public void updateAdmin(Admin admins) {
        adminService.updateByPrimaryKey(admins);
    }

    // 按主键删除
    @RequestMapping("/delete")
    public void deleteAdmin(Admin admin,HttpServletRequest request,HttpServletResponse response) {
        adminService.deleteByPrimaryKey(admin.getAid());
    }

    //详情页面
    @RequestMapping("/getAdminAndUserByAid")
    public ModelAndView getAdminAndUserByAid(int aid){
        List<Admin> adminAndUser = adminService.getAllAdmins(aid);
        return new ModelAndView("admin/detail","admins",adminAndUser);
    }

}
