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

import com.szs.po.Build;
import com.szs.po.Dorm;
import com.szs.po.PageInfo;
import com.szs.po.Student;
import com.szs.po.WanGui;
import com.szs.service.BuildService;
import com.szs.service.DormService;
import com.szs.service.StudentService;
import com.szs.service.WanGuiService;
@Controller
public class WanGuiController {

	//依赖注入
	@Autowired
	private WanGuiService wanguiService;
	@Autowired
	private DormService dormservice;
	@Autowired
	private StudentService studentservice;
	@Autowired
	private BuildService buildservice;
	/**
	 * 分页查询
	 */
	@RequestMapping(value = "/findWanGui")
	public String findWanGui(Integer dorm_id,Integer stu_id,Integer pageIndex,Integer pageSize, Model model) {
		PageInfo<WanGui> pi = wanguiService.findPageInfo(dorm_id,stu_id,pageIndex,pageSize);
		model.addAttribute("pi",pi);
		List<Build> builds=buildservice.getAll();
		model.addAttribute("builds", builds);
		List<Dorm> dorms=dormservice.getAll();
		model.addAttribute("dorms", dorms);
		List<Student> students=studentservice.getAll();
		model.addAttribute("students", students);
		System.out.println(pi);
		return "wangui_list";
	}
	
	/**
	 * 添加晚归记录信息
	 */
	@RequestMapping(value = "/addWanGui" ,method = RequestMethod.POST)
	@ResponseBody
	public String addWanGui(@RequestBody WanGui wanGui) {
		wanguiService.addWanGui(wanGui);
		return "wangui_list";
	}

	/**
	 * 删除晚归记录信息
	 */
	@RequestMapping( "/deleteWanGui")
	@ResponseBody
	public String deleteWanGui(Integer wg_id) {
		wanguiService.deleteWanGui(wg_id);
		return "wangui_list";
	}

	/**
	 * 修改晚归记录信息
	 */
	@RequestMapping( value = "/updateWanGui", method = RequestMethod.POST)
	public String updateWanGui(WanGui wanGui) {
		wanguiService.updateWanGui(wanGui);
		return "redirect:/findWanGui";
	}

	/**
	 * 根据晚归记录Id搜索
	 */
	@RequestMapping( "/findWanGuiById")
	public String findWanGuiById( Integer wg_id,Model model,HttpSession session) {
		WanGui bl=wanguiService.findWanGuiById(wg_id);
		session.setAttribute("b",bl);
		return "wangui_edit";
	}
}
