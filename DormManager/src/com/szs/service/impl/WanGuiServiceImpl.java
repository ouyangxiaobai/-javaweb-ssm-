package com.szs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.szs.dao.WanGuiDao;
import com.szs.po.PageInfo;
import com.szs.po.WanGui;
import com.szs.service.WanGuiService;
/**
 * 晚归记录service层接口实现类
 * @author ZS
 *
 */
@Service("wanguiService")
@Transactional
public class WanGuiServiceImpl implements WanGuiService{

	//注入WanGuiDao
	@Autowired
	private WanGuiDao wanguiDao;

	@Override
	public List<WanGui> getAll() {
		List<WanGui> wanGuis=wanguiDao.getAll();
		return wanGuis;
	}

	@Override
	public PageInfo<WanGui> findPageInfo(Integer dorm_id,Integer stu_id,Integer pageIndex, Integer pageSize) {
		PageInfo<WanGui> pi = new PageInfo<WanGui>();
		pi.setPageIndex(pageIndex);
		pi.setPageSize(pageSize);
		//获取总条数
		Integer totalCount = wanguiDao.totalCount(dorm_id,stu_id);
		if (totalCount>0){
			pi.setTotalCount(totalCount);
			//每一页显示管理员信息数
			//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
			List<WanGui> wanguiList =wanguiDao.getWanGuiList(dorm_id,stu_id,(pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
			pi.setList(wanguiList);
		}
		return pi;
	}

	@Override
	public int addWanGui(WanGui wanGui) {
		return wanguiDao.addWanGui(wanGui);
	}

	@Override
	public int deleteWanGui(Integer wg_id) {
		return wanguiDao.deleteWanGui(wg_id);
	}

	@Override
	public int updateWanGui(WanGui wanGui) {
		return wanguiDao.updateWanGui(wanGui);
	}

	@Override
	public WanGui findWanGuiById(Integer wg_id) {
		return wanguiDao.findWanGuiById(wg_id);
	}

}
