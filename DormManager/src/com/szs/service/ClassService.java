package com.szs.service;
/**
 * 班级service层接口
 * @author ZS
 *
 */

import java.util.List;

import com.szs.po.Class;
import com.szs.po.PageInfo;

public interface ClassService {

	//找到所有所有数据
	public List<Class> getAll();
	//分页查询
	public PageInfo<Class> findPageInfo(Integer pageIndex, Integer pageSize);
	//添加班级信息
	public int addClass(Class class1);
	//删除班级信息
	public int deleteClass(Integer class_id); 
	//修改班级信息
	public int updateClass(Class class1); 
	//根据ID查询班级信息
	public Class findClassById(Integer class_id);
}
