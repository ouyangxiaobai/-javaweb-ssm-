package com.szs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.szs.dao.UserDao;
import com.szs.po.PageInfo;
import com.szs.po.User;
import com.szs.service.UserService;
/**
 * 用户service层接口实现类
 * @author ZS
 *
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	//注入UserDao
	@Autowired
	private UserDao userDao;
	
	@Override
	public User findUser(String username, String password, String access) {
		User user=this.userDao.findUser(username, password, access);
		return user;
	}

	@Override
	public List<User> getAll() {
		List<User> users=userDao.getAll();
		return users;
	}

	@Override
	public PageInfo<User> findPageInfo(Integer pageIndex, Integer pageSize) {
		PageInfo<User> pi = new PageInfo<User>();
		pi.setPageIndex(pageIndex);
		pi.setPageSize(pageSize);
		//获取总条数
		Integer totalCount = userDao.totalCount();
		if (totalCount>0){
			pi.setTotalCount(totalCount);
			//每一页显示管理员信息数
			//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
			List<User> userList =userDao.getUserList((pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
			pi.setList(userList);
		}
		return pi;
	}

	@Override
	public int addUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	public int deleteUser(Integer user_id) {
		return userDao.deleteUser(user_id);
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public User findUserById(Integer user_id) {
		User user=userDao.findUserById(user_id);
		return user;
	}

}
