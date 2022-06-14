package com.szs.service;
/**
 * 用户service层接口
 * @author ZS
 *
 */

import java.util.List;

import com.szs.po.Build;
import com.szs.po.PageInfo;
import com.szs.po.User;

public interface BuildService {

	//找到所有所有数据
	public List<Build> getAll();
	//分页查询
	public PageInfo<Build> findPageInfo(Integer pageIndex, Integer pageSize);
	//添加公寓信息
	public int addBuild(Build build);
	//删除公寓信息
	public int deleteBuild(Integer build_id); 
	//修改公寓信息
	public int updateBuild(Build build); 
	//根据ID查询公寓信息
	public Build findBuildById(Integer build_id);
	
//	public List<Build> findAllBuildAndDorm();
}
