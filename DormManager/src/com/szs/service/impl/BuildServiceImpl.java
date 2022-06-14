package com.szs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.szs.dao.BuildDao;
import com.szs.po.Build;
import com.szs.po.PageInfo;
import com.szs.service.BuildService;
/**
 * 用户service层接口实现类
 * @author ZS
 *
 */
@Service("buildService")
@Transactional
public class BuildServiceImpl implements BuildService{

	//注入BuildDao
	@Autowired
	private BuildDao buildDao;

	@Override
	public List<Build> getAll() {
		List<Build> builds=buildDao.getAll();
		return builds;
	}

	@Override
	public PageInfo<Build> findPageInfo(Integer pageIndex, Integer pageSize) {
		PageInfo<Build> pi = new PageInfo<Build>();
		pi.setPageIndex(pageIndex);
		pi.setPageSize(pageSize);
		//获取总条数
		Integer totalCount = buildDao.totalCount();
		if (totalCount>0){
			pi.setTotalCount(totalCount);
			//每一页显示管理员信息数
			//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
			List<Build> buildList =buildDao.getBuildList((pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
			pi.setList(buildList);
		}
		return pi;
	}

	@Override
	public int addBuild(Build build) {
		return buildDao.addBuild(build);
	}

	@Override
	public int deleteBuild(Integer build_id) {
		return buildDao.deleteBuild(build_id);
	}

	@Override
	public int updateBuild(Build build) {
		return buildDao.updateBuild(build);
	}

	@Override
	public Build findBuildById(Integer build_id) {
		return buildDao.findBuildById(build_id);
	}
	
//	@Override
//	public List<Build> findAllBuildAndDorm(){
//		List<Build> allBuildAndDorm=buildDao.findAllBuildAndDorm();
//		return allBuildAndDorm;
//	}

}
