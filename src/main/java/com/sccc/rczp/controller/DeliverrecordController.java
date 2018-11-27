package com.sccc.rczp.controller;

import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Deliverrecord;
import com.sccc.rczp.service.DeliverrecordService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/deliverrecord")
@Controller
public class DeliverrecordController {

    private DeliverrecordService deliverrecordService;

    @Autowired
    public DeliverrecordController(DeliverrecordService deliverrecordService) {
        this.deliverrecordService = deliverrecordService;
    }

    @RequestMapping
    public String getAllDeliverrecordPage() {
        return "deliverrecord/list";
    }

    // 查询所有
    @ResponseBody
    @RequestMapping("/selectAll")
    public  PageInfo<Deliverrecord>  getAllDeliverrecord(@RequestParam(defaultValue = "1") Integer pageNum,
                                    @RequestParam(defaultValue = "10") Integer pageSize)
            throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        return deliverrecordService.getAllAndPageInfo(Deliverrecord.class, pageNum, pageSize);
    }

    //跳转list页面
    @RequestMapping("/list")
    public String list(){
        return "deliverrecord/list";
    }

    // 跳转添加页面
    @RequestMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("deliverrecord/add");
    }

    // 添加
    @RequestMapping("/addDeliverrecord")
    public void addDeliverrecord(Deliverrecord deliverrecord, HttpServletRequest request, HttpServletResponse response) {
        deliverrecordService.insert(deliverrecord);
    }

    // 按主键查询
    @RequestMapping("/showAid")
    public ModelAndView showAid(Deliverrecord deliverrecord) {
        Deliverrecord deliverrecords = deliverrecordService.selectByPrimaryKey(deliverrecord.getDid());
        return new ModelAndView("deliverrecord/update", "deliverrecords", deliverrecords);
    }

    // 更新
    @RequestMapping("/update")
    public void updateDeliverrecord(Deliverrecord deliverrecords) {
        deliverrecordService.updateByPrimaryKey(deliverrecords);
    }

    // 按主键删除
    @RequestMapping("/delete")
    public void deleteDeliverrecord(Deliverrecord deliverrecord,HttpServletRequest request,HttpServletResponse response) {
        deliverrecordService.deleteByPrimaryKey(deliverrecord.getDid());
    }
    @InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}
}
