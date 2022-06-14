package com.szs.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RestController;

import com.szs.po.Build;
import com.szs.po.PageInfo;
import com.szs.po.User;
import com.szs.service.BuildService;
import com.szs.service.UserService;
@Controller
public class BuildController {

	//依赖注入
	@Autowired
	private BuildService buildService;
	
	@Autowired
	private UserService userService;
	/**
	 * 分页查询
	 */
	@RequestMapping(value = "/findBuild")
	public String findBuild(Integer pageIndex,Integer pageSize, Model model) {
		PageInfo<Build> pi = buildService.findPageInfo(pageIndex,pageSize);
		model.addAttribute("pi",pi);
		List<User> users=userService.getAll();
		model.addAttribute("users", users);
		System.out.println(pi);
		return "build_list";
	}
	
	/**
	 * 添加公寓信息
	 */
	@RequestMapping(value = "/addBuild" ,method = RequestMethod.POST)
	@ResponseBody
	public String addBuild(@RequestBody Build build) {
		System.out.println(build.getBuild_name()+build.getUser_id());
		buildService.addBuild(build);
		return "build_list";
	}

	/**
	 * 删除公寓信息
	 */
	@RequestMapping( "/deleteBuild")
	@ResponseBody
	public String deleteBuild(Integer build_id) {
		buildService.deleteBuild(build_id);
		return "build_list";
	}

	/**
	 * 修改公寓信息
	 */
	@RequestMapping( value = "/updateBuild", method = RequestMethod.POST)
	public String updateBuild(Build build) {
		buildService.updateBuild(build);
		return "redirect:/findBuild";
	}

	/**
	 * 根据公寓Id搜索
	 */
	@RequestMapping( "/findBuildById")
	public String findBuildById( Integer build_id,Model model,HttpSession session) {
		List<User> users=userService.getAll();
		model.addAttribute("users", users);
		Build bl=buildService.findBuildById(build_id);
		session.setAttribute("b",bl);
		return "build_edit";
	}
	
/*	 *//**
	  * 用ajax获取所有楼宇所有寝室的信息
	  * @return
	  *//*
    @RequestMapping("/jilian")
    @ResponseBody
    public List<Build> findAllBuildAndDorm(){
        List<Build> allBuildAndDorm = buildService.findAllBuildAndDorm();
        return allBuildAndDorm;
    }*/
}
