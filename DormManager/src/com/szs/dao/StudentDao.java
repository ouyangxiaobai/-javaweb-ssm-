package com.szs.dao;
import org.apache.ibatis.annotations.Param;

import com.szs.po.Student;

import java.util.List;

/**
 * 学生DAO层接口
 */
public interface StudentDao {
	/**
	 * 进行分页查询
	 */

	 //获取总条数
     public Integer totalCount(@Param("stu_num")Integer stu_num,@Param("class_id")Integer class_id,@Param("dorm_id")Integer dorm_id);
     public Integer switchTotalCount(@Param("stu_num")Integer stu_num,@Param("class_id")Integer class_id,@Param("dorm_id")Integer dorm_id);
	 //获取学生列表
     public List<Student> getStudentList(@Param("stu_num")Integer stu_num,@Param("class_id")Integer class_id,@Param("dorm_id")Integer dorm_id,@Param("currentPage")Integer currentPage, @Param("pageSize")Integer pageSize);
     public List<Student> getSwitchStudentList(@Param("stu_num")Integer stu_num,@Param("class_id")Integer class_id,@Param("dorm_id")Integer dorm_id,@Param("currentPage")Integer currentPage, @Param("pageSize")Integer pageSize);
     //获取宿舍学生列表
     //public List<Student> getDormStudentList(@Param("stu_num")Integer stu_num,@Param("class_id")Integer class_id,@Param("currentPage")Integer currentPage, @Param("pageSize")Integer pageSize);
	 public int deleteStudent(Integer stu_id);   //删除学生信息
	 public int addStudent(Student student);   //添加学生信息
	 public int updateStudent(Student student); //修改学生信息
	 public int removeStudentForDorm(Integer stu_id);//将学生移除宿舍
	 public Student findStudentById(Integer stu_id);
	 public Student findOldDormStudentById(Integer stu_id);
	 public List<Student> getAll();
}
