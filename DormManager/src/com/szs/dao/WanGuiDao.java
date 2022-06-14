package com.szs.dao;
/**
 * 晚归DAO层接口
 * @author ZS
 *
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szs.po.WanGui;

public interface WanGuiDao {
	
	
	//获取总条数
	public Integer totalCount(@Param("dorm_id") Integer dorm_id,@Param("stu_id") Integer stu_id);
	//获取晚归列表
	public List<WanGui> getWanGuiList(@Param("dorm_id") Integer dorm_id,@Param("stu_id") Integer stu_id,@Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
	//查询所有晚归
	public List<WanGui> getAll();
	//添加晚归
	public int addWanGui(WanGui wanGui);
	//删除晚归
	public int deleteWanGui(Integer wg_id); 
	//修改晚归信息
	public int updateWanGui(WanGui wanGui); 
	//根据ID查询晚归信息
	public WanGui findWanGuiById(Integer wg_id);
}
