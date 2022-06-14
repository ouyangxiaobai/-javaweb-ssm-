package com.szs.service.impl;

import com.szs.dao.DormDao;
import com.szs.po.Dorm;
import com.szs.po.PageInfo;
import com.szs.service.DormService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 宿舍Service接口实现类
 */
@Service("dormService")
@Transactional
public class DormServiceImpl implements DormService {
	// 注入DormDao
	@Autowired
	private DormDao dormDao;

	@Override
	public List<Dorm> getAll(){

		List<Dorm> dormList = dormDao.getAll();
		return dormList;
    }

	@Override
	public PageInfo<Dorm> findPageInfo(Integer dorm_num,Integer dorm_empty,Integer build_id,Integer pageIndex, Integer pageSize) {
		PageInfo<Dorm> pi = new PageInfo<Dorm>();
		pi.setPageIndex(pageIndex);
		pi.setPageSize(pageSize);
		//获取总条数
		Integer totalCount = dormDao.totalCount(dorm_num,dorm_empty,build_id);
		if (totalCount>0){
			pi.setTotalCount(totalCount);
			//每一页显示宿舍信息数
			//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
			List<Dorm> dormList =	dormDao.getDormList(dorm_num,dorm_empty,build_id,
					(pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
			pi.setList(dormList);
		}
		return pi;
	}

	//添加宿舍信息
	@Override
	public int addDorm(Dorm dorm) {
		return dormDao.addDorm(dorm);
	}

	//通过id删除宿舍信息
	@Override
	public int deleteDorm(Integer dorm_id) {
		return dormDao.deleteDorm(dorm_id);
	}

	//修改宿舍信息
	@Override
	public int updateDorm(Dorm dorm) {
		return dormDao.updateDorm(dorm);
	}
	
	//修改宿舍空床信息
	@Override
	public int updateEmptyDorm(Integer dorm_id) {
		return dormDao.updateEmptyDorm(dorm_id);
	}
	
	//修改原宿舍空床信息
	@Override
	public int updateOldEmptyDorm(Integer dorm_id) {
		return dormDao.updateOldEmptyDorm(dorm_id);
	}
	
	@Override
	public Dorm findDormById (Integer dorm_id){
		Dorm d = dormDao.findDormById(dorm_id);
		return  d;
	}
}
