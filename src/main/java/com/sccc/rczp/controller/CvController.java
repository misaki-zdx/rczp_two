package com.sccc.rczp.controller;

import java.lang.reflect.InvocationTargetException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Cv;
import com.sccc.rczp.service.CvService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/cv")
@Controller
public class CvController {

    private CvService cvService;

    @Autowired
    public CvController(CvService cvService) {
        this.cvService = cvService;
    }

    @RequestMapping
    public String getAllCvPage() {
        return "cv/list";
    }

    // 查询所有
    @ResponseBody
    @RequestMapping("/selectAll")
    public  PageInfo<Cv>  getAllCv(@RequestParam(defaultValue = "1") Integer pageNum,
                                    @RequestParam(defaultValue = "10") Integer pageSize)
            throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        return cvService.getAllAndPageInfo(Cv.class, pageNum, pageSize);
    }

    //跳转list页面
    @RequestMapping("/list")
    public String list(){
        return "cv/list";
    }

    // 跳转添加页面
    @RequestMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("cv/add");
    }

    // 添加
    @RequestMapping("/addCv")
    public void addCv(Cv cv, HttpServletRequest request, HttpServletResponse response) {
        cvService.insert(cv);
    }

    // 按主键查询
    @RequestMapping("/showCid")
    public ModelAndView showCid(Cv cv) {
        Cv cvs = cvService.selectByPrimaryKey(cv.getCid());
        return new ModelAndView("cv/update", "cvs", cvs);
    }

    // 更新
    @RequestMapping("/update")
    public void updateCv(Cv cvs) {
        cvService.updateByPrimaryKey(cvs);
    }

    // 按主键删除
    @RequestMapping("/delete")
    public void deleteCv(Cv cv,HttpServletRequest request,HttpServletResponse response) {
        cvService.deleteByPrimaryKey(cv.getCid());
    }
}

