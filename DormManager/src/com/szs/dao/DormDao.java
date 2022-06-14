package com.szs.dao;
/**
 * 宿舍DAO层接口
 * @author ZS
 *
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szs.po.Build;
import com.szs.po.Dorm;

public interface DormDao {
	
	
	//获取总条数
	public Integer totalCount(@Param("dorm_num") Integer dorm_num,@Param("dorm_empty") Integer dorm_empty,@Param("build_id") Integer build_id);
	//获取宿舍列表
	public List<Dorm> getDormList(@Param("dorm_num") Integer dorm_num,@Param("dorm_empty") Integer dorm_empty,@Param("build_id") Integer build_id, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
	//查询所有
	public List<Dorm> getAll();
	//添加宿舍
	public int addDorm(Dorm dorm);
	//删除宿舍
	public int deleteDorm(Integer dorm_id); 
	//修改宿舍信息
	public int updateDorm(Dorm dorm); 
	//修改宿舍空床信息
	public int updateEmptyDorm(Integer dorm_id);
	//修改宿舍原空床信息
	public int updateOldEmptyDorm(Integer dorm_id);
	//根据ID查询宿舍信息
	public Dorm findDormById(Integer dorm_id);
}
