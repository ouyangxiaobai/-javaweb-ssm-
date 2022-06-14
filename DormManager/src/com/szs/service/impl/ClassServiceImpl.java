package com.szs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.szs.dao.ClassDao;
import com.szs.po.Class;
import com.szs.po.PageInfo;
import com.szs.service.ClassService;
/**
 * 用户service层接口实现类
 * @author ZS
 *
 */
@Service("classService")
@Transactional
public class ClassServiceImpl implements ClassService{

	//注入ClassDao
	@Autowired
	private ClassDao classDao;

	@Override
	public List<Class> getAll() {  
		List<Class> class1=classDao.getAll();
		return class1;
	}

	@Override
	public PageInfo<Class> findPageInfo(Integer pageIndex, Integer pageSize) {
		PageInfo<Class> pi = new PageInfo<Class>();
		pi.setPageIndex(pageIndex);
		pi.setPageSize(pageSize);
		//获取总条数
		Integer totalCount = classDao.totalCount();
		if (totalCount>0){
			pi.setTotalCount(totalCount);
			//每一页显示管理员信息数
			//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
			List<Class> classList =classDao.getClassList((pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
			pi.setList(classList);
		}
		return pi;
	}

	@Override
	public int addClass(Class class1) {
		return classDao.addClass(class1);
	}

	@Override
	public int deleteClass(Integer class_id) {
		return classDao.deleteClass(class_id);
	}

	@Override
	public int updateClass(Class class1) {
		return classDao.updateClass(class1);
	}

	@Override
	public Class findClassById(Integer class_id) {
		return classDao.findClassById(class_id);
	}

}
