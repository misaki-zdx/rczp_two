package com.sccc.rczp.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.sccc.rczp.bean.po.Type;
import com.sccc.rczp.service.TypeService;


@RestController
@RequestMapping("/Type")
public class TypeController {
	
	private TypeService typeService;
	public TypeController(TypeService typeService) {
		super();
		this.typeService = typeService;
	}

    
	@ResponseBody
	@RequestMapping(value="/selectAllType")
	public PageInfo<Type>  getAllType(@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "1") Integer pageSize) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
		return typeService.getAllAndPageInfo(Type.class,pageNum,pageSize);
	}
	
	@RequestMapping(value = "/addType")
	public ModelAndView add() {
		return new ModelAndView("type/addType");
	}

	@RequestMapping(value = "/insertType")
	public void addType(Type type, HttpServletRequest request) {
		System.out.print(type.getTypename());
		typeService.insert(type);


	}
	@RequestMapping(value = "/showTid")
	public ModelAndView showTid(Type type) {
		Type types=typeService.selectByPrimaryKey(type.getTid());
		return new ModelAndView("type/updateType","types", types);
	}

	//跳转list页面
	@RequestMapping("/list")
	public ModelAndView list(){
		return new ModelAndView("type/listType");
	}


	@RequestMapping(value = "/updateType")
	public void updateType(Type types, HttpServletRequest request) {
		System.out.println(types);
		System.out.println(types.getTypename());
			typeService.updateByPrimaryKey(types);
	}

	@RequestMapping(value = "/deleteType")
	public void deleteType(Type type, HttpServletRequest request) {
		typeService.deleteByPrimaryKey(type.getTid());

	}
//    @RequestMapping("/test")
//    public String execute(@RequestParam(defaultValue = "0") Integer pageNum, @RequestParam(defaultValue = "1") Integer pageSize)
//            throws JsonProcessingException, NoSuchMethodException, InvocationTargetException, IllegalAccessException {
//
//        List<Admin> list = testService.getAll(Admin.class, pageNum, pageSize);
//
//        return new ObjectMapper().writeValueAsString(list);
//
//    }
//
//    @ResponseBody
//    @RequestMapping
//    public String home() {
//
//        return "红火火恍恍惚惚";
//
//    }

}
