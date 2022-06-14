package com.szs.service;
/**
 * 晚归记录service层接口
 * @author ZS
 *
 */

import java.util.List;

import com.szs.po.PageInfo;
import com.szs.po.WanGui;

public interface WanGuiService {

	//找到所有所有数据
	public List<WanGui> getAll();
	//分页查询
	public PageInfo<WanGui> findPageInfo(Integer dorm_id,Integer stu_id,Integer pageIndex, Integer pageSize);
	//添加晚归记录信息
	public int addWanGui(WanGui wanGui);
	//删除晚归记录信息
	public int deleteWanGui(Integer wg_id); 
	//修改晚归记录信息
	public int updateWanGui(WanGui wanGui); 
	//根据ID查询晚归记录信息
	public WanGui findWanGuiById(Integer wg_id);
}
