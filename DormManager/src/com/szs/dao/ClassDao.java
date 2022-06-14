package com.szs.dao;
/**
 * 班级DAO层接口
 * @author ZS
 *
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.szs.po.Class;

public interface ClassDao {
	
	
	//获取总条数
	public Integer totalCount();
	//获取班级列表
	public List<Class> getClassList(@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
	//查询所有班级
	public List<Class> getAll();
	//添加班级
	public int addClass(Class class1);
	//删除班级
	public int deleteClass(Integer class_id); 
	//修改班级信息
	public int updateClass(Class class1); 
	//根据ID查询班级信息
	public Class findClassById(Integer class_id);
}
