package com.szs.service;
/**
 * 用户service层接口
 * @author ZS
 *
 */

import java.util.List;

import com.szs.po.PageInfo;
import com.szs.po.User;

public interface UserService {

	//通过账号、密码、权限查询用户
	public User findUser(String username,String password,String access);
	//找到所有所有数据
	public List<User> getAll();
	//分页查询
	public PageInfo<User> findPageInfo(Integer pageIndex, Integer pageSize);
	//添加管理员信息
	public int addUser(User user);
	//删除管理员信息
	public int deleteUser(Integer user_id); 
	//修改管理员信息
	public int updateUser(User user); 
	//根据ID查询管理员信息
	public User findUserById(Integer user_id);
}
