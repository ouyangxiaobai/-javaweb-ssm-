package com.szs.dao;
/**
 * 用户DAO层接口
 * @author ZS
 *
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szs.po.User;

public interface UserDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser(@Param("username")String username,@Param("password")String password,@Param("access")String access);
	
	//获取总条数
	public Integer totalCount();
	//获取管理员列表
	public List<User> getUserList(@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
	//查询所有管理员
	public List<User> getAll();
	//添加管理员信息
	public int addUser(User user);
	//删除管理员信息
	public int deleteUser(Integer user_id); 
	//修改管理员信息
	public int updateUser(User user); 
	//根据ID查询管理员信息
	public User findUserById(Integer user_id);
}
