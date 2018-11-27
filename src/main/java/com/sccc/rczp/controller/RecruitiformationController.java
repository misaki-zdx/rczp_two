package com.sccc.rczp.controller;

import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.sccc.rczp.bean.po.Enterprise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sccc.rczp.bean.po.Recruitinformation;
import com.sccc.rczp.bean.po.User;
import com.sccc.rczp.service.RecruitinformationService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/recruit")
@Controller
public class RecruitiformationController {

	private RecruitinformationService recruitService;

	@Autowired
	public RecruitiformationController(RecruitinformationService recruitService) {
		this.recruitService = recruitService;
	}

	@RequestMapping
	public String getAllRecruitPage() {
		return "recruit/recruit";
	}

	// 查询所有
	@ResponseBody
	@RequestMapping("/selectAll")
	public PageInfo<Recruitinformation> getAllRecruit(@RequestParam(defaultValue = "1") Integer pageNum,
													  @RequestParam(defaultValue = "10") Integer pageSize)
			throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {

		PageInfo<Recruitinformation> pageInfo = recruitService.getAllAndPageInfo(Recruitinformation.class, pageNum, pageSize);

		return pageInfo;
	}

	// 跳转添加页面
	@RequestMapping("/add")
	public ModelAndView add() {
		return new ModelAndView("recruit/addRecruit");
	}

	// 添加
	@RequestMapping("/addRecruit")
	public void addRecruit(Recruitinformation recruit, HttpServletRequest request, HttpServletResponse response,Date rtime1) throws ParseException {
		recruitService.insert(recruit);
	}

//	//跳转list页面
//	@RequestMapping("/list")
//	public ModelAndView list(){
//		return  new ModelAndView("recruit/list");
//	}

	// 按主键查询
	@RequestMapping("/showID/{id}")
	public ModelAndView showAid(@PathVariable("id") int id) {
		Recruitinformation re = recruitService.selectByPrimaryKey(id);
		return new ModelAndView("recruit/editRecruit", "recruit", re);
	}

    //按名字模糊查询
	@ResponseBody
    @RequestMapping("/queryByWork/{work}")
    public  PageInfo<Recruitinformation> queryByWork(@PathVariable(name= "work") String work,@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "10")Integer pageSize){
        //需要先设置PageHelper的默认参数
        PageHelper.startPage(pageNum,pageSize);
        List<Recruitinformation> recruits = recruitService.selectByWork(work);
        return  PageInfo.of(recruits);
    }
	
	// 更新
	@RequestMapping("/updateRecruit")	//对于只访问的action需要加HttpServletRequest
	public void updateRecruit(Recruitinformation recruit,HttpServletRequest request,HttpServletResponse response) {
		recruitService.updateByPrimaryKey(recruit);
	}

	// 按主键删除
	@RequestMapping("/deleteID/{id}")
	public String deleteRecruit(@PathVariable("id") int id,HttpServletRequest request, HttpServletResponse response) {
		recruitService.deleteByPrimaryKey(id);
		return "redirect:/recruit";
	}

	//详情页面
	@RequestMapping("/selecRecruitinformationtAll")
	public ModelAndView selecRecruitinformationtAll(int rid){
		Recruitinformation recruitinformation = recruitService.selecRecruitinformationtAll(rid);
		return new ModelAndView("recruit/detail","recruitinformation", recruitinformation);
	}

	//批量删除
	@RequestMapping(value = "/deleteMoreById",method = {RequestMethod.POST})
	public void  deleteMoreById(@RequestBody int[] arr,HttpServletRequest request,HttpServletResponse response){
		System.out.println(Arrays.toString(arr));
		recruitService.deleteMoreById(arr);
	}

	//按工作和地区模糊查询
	@ResponseBody
	@RequestMapping("/searchWork")
	public  List<Recruitinformation> searchWork(String work,String path){
		System.out.println(work+";"+path);
		return  recruitService.searchWork(work, path);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

}
