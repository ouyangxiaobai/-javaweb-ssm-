package com.szs.controller;

import com.szs.po.Build;
import com.szs.po.Dorm;
import com.szs.po.PageInfo;
import com.szs.service.BuildService;
import com.szs.service.DormService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 宿舍控制器类
 */
@Controller
public class DormController {
	// 依赖注入
	@Autowired
	private DormService dormService;
	
	@Autowired
	private BuildService buildService;
	/**
	 * 分页查询
	 */
	@RequestMapping(value = "/findDorm")
	public String findDorm(Integer dorm_num,Integer dorm_empty,Integer build_id,Integer pageIndex,Integer pageSize, Model model) {
		PageInfo<Dorm> pi = dormService.findPageInfo(dorm_num,dorm_empty,build_id,pageIndex,pageSize);
		model.addAttribute("pi",pi);
		List<Build> bd=buildService.getAll();
		model.addAttribute("bd",bd);
		return "dorm_list";
	}

	
	/**
	 * 添加宿舍信息
	 */
	@RequestMapping(value = "/addDorm" ,method = RequestMethod.POST)
	@ResponseBody
	public String addDorm( @RequestBody Dorm dorm) {
		dormService.addDorm(dorm);
		return "dorm_list";
	}

	/**
	 * 删除宿舍信息
	 */
	@RequestMapping( "/deleteDorm")
	@ResponseBody
	public String deleteDorm(Integer dorm_id) {
		dormService.deleteDorm(dorm_id);
		return "dorm_list";
	}

	/**
	 * 修改宿舍信息
	 */
	@RequestMapping( value = "/updateDorm", method = RequestMethod.POST)
	public String updateDorm(Dorm dorm) {
		dormService.updateDorm(dorm);
		return "redirect:/findDorm";
	}


	/**
	 * 根据宿舍Id搜索
	 */
	@RequestMapping( "/findDormById")
	public String findDormById(Integer dorm_id,Model model,HttpSession session) {
		List<Build> builds=buildService.getAll();
		model.addAttribute("builds", builds);
		Dorm d= dormService.findDormById(dorm_id);
		session.setAttribute("d",d);
		return "dorm_edit";
	}

}
