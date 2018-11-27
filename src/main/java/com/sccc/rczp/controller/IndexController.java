package com.sccc.rczp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sccc.rczp.bean.po.Deliverrecord;
import com.sccc.rczp.bean.po.Recruitinformation;
import com.sccc.rczp.daoImp.TempleteDaoImp;
import com.sccc.rczp.service.DeliverrecordService;
import com.sccc.rczp.service.RecruitinformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sccc.rczp.bean.po.User;
import com.sccc.rczp.service.UserService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/index")
public class IndexController {

    private UserService userService;
    private DeliverrecordService deliverrecordService;
    private RecruitinformationService recruitinformationService;
    private TempleteDaoImp td;
    //@Autowired   /*从Spring Framework 4.3开始，@Autowired如果目标bean只定义了一个开头的构造函数，则不再需要对这样的构造函数进行注释。但是，如果有几个构造器可用，则必须注释至少一个构造器以教导容器使用哪一个*/
    public IndexController(UserService userService, DeliverrecordService deliverrecordService, RecruitinformationService recruitinformationService,TempleteDaoImp td) {
        this.userService = userService;
        this.deliverrecordService = deliverrecordService;
        this.recruitinformationService = recruitinformationService;
        this.td = td;
    }

    @RequestMapping
    public ModelAndView list() {
        return new ModelAndView("index2");
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        return new ModelAndView("login");
    }

    @RequestMapping("/loginx")
    @ResponseBody
    public String loginx(int rid, String upassword,int enterpriseORuser, HttpServletRequest request) {
        Object login ="";
        if(enterpriseORuser == 1) {
             login = userService.login(rid, upassword);
        }
        if (login != null) {
            request.getSession().setAttribute("login", login);
            return "0";
        } else {
            return "1";
        }
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) {
        request.getSession().removeAttribute("login");
        return new ModelAndView("redirect:/index");
    }

    /*	@RequestMapping("/detailJob/{rid}")
        @ResponseBody
        public ModelAndView detailJob(@PathVariable("rid") int rid){
            Recruitinformation recruitinformation = recruitinformationService.selectByPrimaryKey(rid);
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("recruit",recruitinformation);
            modelAndView.setViewName("me");
            return modelAndView;
        }*/
    @RequestMapping("/me")
    public ModelAndView me() {
        return new ModelAndView("me");
    }

    @RequestMapping("/meDetail/{uid}")
    @ResponseBody
    public ModelAndView detail(@PathVariable("uid") int uid) {
        ModelAndView modelAndView = new ModelAndView();
        User users = userService.selectUserAll2(uid);
        //users.getDeliverrecord()
        //System.out.println(users);
        modelAndView.addObject("user", users);
        modelAndView.setViewName("forward:/index/me");
        return modelAndView;
        //return users;
    }

    @RequestMapping("/applyJob")
    public ModelAndView applyJob(int rid, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("login");
        if (user == null) {
            return new ModelAndView("redirect:/index/login");
        }
        if (rid != 0) {
            String sql = "SELECT * FROM deliverrecord WHERE rid = "+rid+" uid = "+user.getUid();
            List<Map> maps = td.select3(sql);
            System.out.println(maps);
            if(maps != null){
                return new ModelAndView("deliverFail");
            }else {
                deliverrecordService.insertDeliverecord(rid, user.getUid());
                return new ModelAndView("redirect:/index");
            }
        }
        return new ModelAndView("deliverSuccess");
    }
}
