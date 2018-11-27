package com.sccc.rczp.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.User;
import com.sccc.rczp.daoImp.TempleteDaoImp;
import com.sccc.rczp.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    private static String relativePath = "upload/";
    private TempleteDaoImp td;
@Autowired
    public void setTd(TempleteDaoImp td) {
        this.td = td;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/selectAll")
    @ResponseBody
    public PageInfo<User> getAllUser(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        PageInfo<User> allAndPageInfo = userService.getAllAndPageInfo(User.class, pageNum, pageSize);
        //System.out.println(allAndPageInfo.getList());
        return allAndPageInfo;
    }

    /*@RequestMapping(value = "/addUser")
    public ModelAndView add() {
        return new ModelAndView("user/addUser");
    }
*/
    @RequestMapping(value = "/add")
    public ModelAndView add() {
        return new ModelAndView("user/addUser");
    }


    @RequestMapping(value = "/loginUser")
    public void addUser(User user, HttpServletRequest request) {
        userService.insert(user);
    }

    @RequestMapping(value = "/showID/{uid}")
    public ModelAndView showUid(@PathVariable("uid") int uid) throws ParseException {
        User users = userService.selectByPrimaryKey(uid);
        return new ModelAndView("user/editUser", "users", users);
    }

    //跳转list页面
    @RequestMapping
    public ModelAndView list() {
        return new ModelAndView("user/user");
    }


    @RequestMapping(value = "/update")
    public String updateUser(@RequestParam(required = false) CommonsMultipartFile file, User users, HttpServletRequest request) {
        if (file != null) {
            String s = copyFile(file, request, relativePath);
            users.setUimage(s);
            userService.updateByPrimaryKey(users);
        }else {
            userService.updateUserSpecial(users);
        }
        return "redirect:/user";
    }

    @RequestMapping(value = "/deleteUser")
    public void deleteUser(User user, HttpServletRequest request) {
        userService.deleteByPrimaryKey(user.getUid());

    }

    // index显示内容
    @RequestMapping("/indexContent")
    @ResponseBody
    public Map<String,Object> generateIndexContent(HttpServletResponse response,HttpServletRequest request){
       Map<String,Object> resultMap =  new HashMap<>();
        //需要添加的内容有 1.推荐招聘(6)  2.最新招聘(6) 3.按工作位置分类的 职位个数(招聘数) 4.紧急招聘的职位数(4) 5.上周发布职位数
       //因为现有资源 以及字段的限制 推荐招聘和最新招聘为同一组
        User login = (User)request.getSession().getAttribute("login");
        if(login != null){
        int  uid = login.getUid();
            String sql = "SELECT r.rid,r.job,r.path,r.`benefit`,r.`title`,r.`salaryMax`,r.`salaryMin`,r.`jobdes`,r.rtime FROM recruitinformation r INNER JOIN USER u ON r.`job` = u.`intention` WHERE u.uid = " +uid;
            List<Map> recommend = td.select3(sql);
            resultMap.put("recommend",recommend);
        }
        List<Map> preWeekCount = td.select3("SELECT COUNT(rid) count FROM recruitinformation WHERE DATEDIFF(CURDATE(),rtime)<=7");
        List<Map> newTime = td.select3("SELECT * FROM recruitinformation ORDER BY rtime DESC limit 0,5");
        List<Map> groupByJob = td.select3("SELECT job,COUNT(rid) COUNT FROM recruitinformation GROUP BY job");
        resultMap.put("preWeekCount",preWeekCount.get(0).get("count"));
        resultMap.put("newTime",newTime);
        resultMap.put("groupByJob",groupByJob);
        //request.setAttribute("newTime",newTime);
        return resultMap;
    }

    public String copyFile(CommonsMultipartFile file, HttpServletRequest request, String relativePath) {

        String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
        String filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
        String completeRelativePath = relativePath + filename;
        String path = request.getSession().getServletContext()
                .getRealPath(completeRelativePath);// 存放位置
        System.out.println("上传地址:" + path);
        File destFile = new File(path);
        try {
            // FileUtils.copyInputStreamToFile()这个方法里对IO进行了自动操作，不需要额外的再去关闭IO流
            FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);// 复制临时文件到指定目录下
        } catch (IOException e) {
            e.printStackTrace();
        }
        return completeRelativePath;
    }

    @RequestMapping("/upload")
    public ModelAndView insertUser(@RequestParam(name = "file", required = false) CommonsMultipartFile file, User user, HttpServletRequest request) throws IOException {
        // MultipartFile是对当前上传的文件的封装，当要同时上传多个文件时，可以给定多个MultipartFile参数(数组)
        if (file != null) {
            String completePath = copyFile(file, request, relativePath);
            user.setUimage(completePath);
        }
        //暂时设置一个临时固定管理员
        user.setAid(23);
        userService.insert(user);
        return  new ModelAndView("redirect:/user");
    }
    //按名字模糊查询
    @RequestMapping("/queryByGeneralName/{queryName}")
    @ResponseBody
    public  PageInfo<User> queryByGeneralName(@PathVariable(required =false ,name= "queryName") String queryName,@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "10")Integer pageSize){
        //需要先设置PageHelper的默认参数
        PageHelper.startPage(pageNum,pageSize);
        List<User> users = userService.selectByGeneralName(queryName);
        return  PageInfo.of(users);
    }

    /*@RequestMapping("selectData1")
    public*/

    @RequestMapping("/test")
public List<Map> testRedirect(){
        List<Map> select = td.select();
        //ModelAndView modelAndView = new ModelAndView();
       //JSONArray.fromObject
        //modelAndView.addObject(select);
       // modelAndView.setViewName("redirect:/");

        System.out.println(select);
        return select;
}

    @RequestMapping("/tes2")
    public List<Map> select2(){
        List<Map> select = td.select2();
        System.out.println(select);
        return select;
    }
    
    //Echart页面 各部门人员分布映射
    @RequestMapping("/EchartOne")
    public ModelAndView echartOne(){
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("/Echart/temp");
    	return modelAndView;
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                dateFormat, true));
    }

}
