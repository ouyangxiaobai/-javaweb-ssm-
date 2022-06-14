package com.szs.service;
/**
 * 宿舍service层接口
 * @author ZS
 *
 */

import java.util.List;

import com.szs.po.Dorm;
import com.szs.po.PageInfo;

public interface DormService {

	//找到所有所有数据
	public List<Dorm> getAll();
	//分页查询
	public PageInfo<Dorm> findPageInfo(Integer dorm_num,Integer dorm_empty,Integer build_id,Integer pageIndex, Integer pageSize);
	//添加宿舍信息
	public int addDorm(Dorm dorm);
	//删除宿舍信息
	public int deleteDorm(Integer dorm_id); 
	//修改宿舍信息
	public int updateDorm(Dorm dorm); 
	//修改宿舍空床信息
	public int updateEmptyDorm(Integer dorm_id); 
	//修改原宿舍空床信息
	public int updateOldEmptyDorm(Integer dorm_id); 
	//根据ID查询宿舍信息
	public Dorm findDormById(Integer dorm_id);
}
