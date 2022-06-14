package com.szs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
/**
 * 用户控制器类
 * @author ZS
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.szs.po.PageInfo;
import com.szs.po.Class;
import com.szs.service.ClassService;
@Controller
public class ClassController {

	//依赖注入
	@Autowired
	private ClassService classService;
		
	/**
	 * 分页查询
	 */
	@RequestMapping(value = "/findClass")
	public String findClass(Integer pageIndex,Integer pageSize, Model model) {
		PageInfo<Class> pic = classService.findPageInfo(pageIndex,pageSize);
		model.addAttribute("pic",pic);
		return "class_list";
	}
	
	/**
	 * 添加班级信息
	 */
	@RequestMapping(value = "/addClass" ,method = RequestMethod.POST)
	@ResponseBody
	public String addClass( @RequestBody Class class1) {
		classService.addClass(class1);
		return "class_list";
	}

	/**
	 * 删除班级信息
	 */
	@RequestMapping( "/deleteClass")
	@ResponseBody
	public String deleteClass(Integer class_id) {
		classService.deleteClass(class_id);
		return "class_list";
	}

	/**
	 * 修改班级信息
	 */
	@RequestMapping( value = "/updateClass")
	public String updateClass(Class class1,HttpServletRequest request) {
		classService.updateClass(class1);
		return "redirect:/findClass";
	}

	/**
	 * 根据班级id搜索
	 */
	@RequestMapping( "/findClassById")
	public String findClassById( Integer class_id,HttpSession session) {
		Class c=classService.findClassById(class_id);
		session.setAttribute("c",c);
		return "class_edit";
	}
}
