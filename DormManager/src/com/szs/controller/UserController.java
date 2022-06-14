package com.szs.controller;

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
import com.szs.po.User;
import com.szs.service.UserService;
@Controller
public class UserController {

	//依赖注入
	@Autowired
	private UserService userService;
	
	/**
	 * 用户登录
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String username,String password,String access,Model model,HttpSession session) {
		//通过账号、密码、权限查询用户
		User user=userService.findUser(username, password, access);
		if (user!=null) {
			//将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			model.addAttribute("msg", user.getUser_access());
			//跳转到主页面
			return "homepage";
		}else if (access==null) {
			model.addAttribute("msg", "请选择用户类型！");
			return "login";
		}else {
			model.addAttribute("msg", "账号或密码错误，请重新输入！");
			return "login";
		}	
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value="/loginOut")
	public String logout(HttpSession session) {
		//清除session
		session.invalidate();
		//重定向到登录页面的跳转方法
		return "redirect:/login";
	}
	
	/**
	 * 向用户登录页面跳转
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	/**
	 * 分页查询
	 */
	@RequestMapping(value = "/findUser")
	public String findUser(Integer pageIndex,Integer pageSize, Model model) {
		PageInfo<User> pi = userService.findPageInfo(pageIndex,pageSize);
		model.addAttribute("pi",pi);
		return "admin_list";
	}
	
	@RequestMapping(value = "/findUser1")
	public String findUser1(Integer pageIndex,Integer pageSize, Model model) {
		PageInfo<User> pi1 = userService.findPageInfo(pageIndex,pageSize);
		model.addAttribute("pi1",pi1);
		return "build_add";
	}
	
	
	/**
	 * 添加管理员信息
	 */
	@RequestMapping(value = "/addUser" ,method = RequestMethod.POST)
	@ResponseBody
	public String addUser( @RequestBody User user) {
		userService.addUser(user);
		System.out.println("dsada"+user.toString());
		return "admin_list";
	}

	/**
	 * 删除管理员信息
	 */
	@RequestMapping( "/deleteUser")
	@ResponseBody
	public String deleteUser(Integer user_id) {
		userService.deleteUser(user_id);
		return "admin_list";
	}

	/**
	 * 修改管理员信息
	 */
	@RequestMapping( value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(User user) {
		userService.updateUser(user);
		return "redirect:/findUser";
	}

	/**
	 * 根据管理员Id搜索
	 */
	@RequestMapping( "/findUserById")
	public String findUserById( Integer user_id,HttpSession session) {
		User u=userService.findUserById(user_id);
		session.setAttribute("u",u);
		return "admin_edit";
	}
}
