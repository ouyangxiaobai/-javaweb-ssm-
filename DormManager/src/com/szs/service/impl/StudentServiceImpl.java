package com.szs.service.impl;


import com.szs.dao.StudentDao;
import com.szs.po.PageInfo;
import com.szs.po.Student;
import com.szs.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 学生Service接口实现类
 */
@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
	// 注入studentDao
	@Autowired
	private StudentDao studentDao;


	//分页查询
	@Override
	public PageInfo<Student> findPageInfo(Integer stu_num,Integer class_id,Integer dorm_id,Integer pageIndex,Integer pageSize) {
		PageInfo<Student> pi = new PageInfo<Student>();
		pi.setPageIndex(pageIndex);
		pi.setPageSize(pageSize);
		//获取总条数
		Integer totalCount = studentDao.totalCount(stu_num,class_id,dorm_id);
		if (totalCount>0){
			pi.setTotalCount(totalCount);
			//每一页显示学生信息数
			//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
		List<Student> studentList =	studentDao.getStudentList(stu_num,class_id,dorm_id,
				     (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
		  pi.setList(studentList);
		}
		return pi;
	}

	//分页查询
		@Override
		public PageInfo<Student> findSwitchPageInfo(Integer stu_num,Integer class_id,Integer dorm_id,Integer pageIndex,Integer pageSize) {
			PageInfo<Student> pi = new PageInfo<Student>();
			pi.setPageIndex(pageIndex);
			pi.setPageSize(pageSize);
			//获取总条数
			Integer totalCount = studentDao.switchTotalCount(stu_num,class_id,dorm_id);
			if (totalCount>0){
				pi.setTotalCount(totalCount);
				//每一页显示学生信息数
				//currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
			List<Student> studentList =	studentDao.getSwitchStudentList(stu_num,class_id,dorm_id,
					     (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
			  pi.setList(studentList);
			}
			return pi;
		}
	
	@Override
	public List<Student> getAll(){
		List<Student> studentList = studentDao.getAll();
		return studentList;
	}

	//通过id删除学生信息
	@Override
	public int deleteStudent(Integer stu_id) {
		return studentDao.deleteStudent(stu_id);
	}
    //添加学生信息
	@Override
	public  int addStudent(Student student) {
		return studentDao.addStudent(student);
	}
	//修改学生信息
	@Override
	public int updateStudent(Student student) { return studentDao.updateStudent(student); }
	
	//将学生移除宿舍
	@Override
	public int removeStudentForDorm(Integer stu_id) {
		return studentDao.removeStudentForDorm(stu_id);
	}

	@Override
	public Student findStudentById (Integer stu_id){
		Student s = studentDao.findStudentById(stu_id);
         return  s;
	}

	@Override
	public Student findOldDormStudentById (Integer stu_id){
		Student s = studentDao.findOldDormStudentById(stu_id);
         return  s;
	}
}
