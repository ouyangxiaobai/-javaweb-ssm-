package com.szs.service;
import org.apache.ibatis.annotations.Param;

import com.szs.po.PageInfo;
import com.szs.po.Student;

import java.util.List;

/**
 * 学生Service层接口
 */
public interface StudentService {

	//分页查询
	public PageInfo<Student> findPageInfo(Integer stu_num,Integer class_id,Integer dorm_id,Integer pageIndex, Integer pageSize);
	public PageInfo<Student> findSwitchPageInfo(Integer stu_num,Integer class_id,Integer dorm_id,Integer pageIndex, Integer pageSize);
	//public PageInfo<Student> findPageInfo(Integer stu_num,Integer class_id,Integer pageIndex, Integer pageSize);
	public int deleteStudent(Integer stu_id);   //通过id删除学生信息
	public int addStudent(Student student);   //添加学生信息
	public int updateStudent(Student student); //修改学生信息
	public int removeStudentForDorm(Integer stu_id);//将学生移除宿舍
	public Student findStudentById(Integer stu_id);
	public Student findOldDormStudentById(Integer stu_id);
	public List<Student> getAll();

}
