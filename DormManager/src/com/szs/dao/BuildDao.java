package com.szs.dao;
/**
 * 公寓DAO层接口
 * @author ZS
 *
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szs.po.Build;

public interface BuildDao {
	
	
	//获取总条数
	public Integer totalCount();
	//获取公寓列表
	public List<Build> getBuildList(@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
	//查询所有公寓
	public List<Build> getAll();
	//添加公寓
	public int addBuild(Build build);
	//删除公寓
	public int deleteBuild(Integer build_id); 
	//修改公寓信息
	public int updateBuild(Build build); 
	//根据ID查询公寓信息
	public Build findBuildById(Integer build_id);
	
	//public List<Build> findAllBuildAndDorm();
}
