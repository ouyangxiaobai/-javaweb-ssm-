package com.szs.controller;


import com.szs.po.Build;
import com.szs.po.Class;
import com.szs.po.Dorm;
import com.szs.po.PageInfo;
import com.szs.po.Student;
import com.szs.service.BuildService;
import com.szs.service.ClassService;
import com.szs.service.DormService;
import com.szs.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 学生控制器类
 */
@Controller
public class StudentController {
	// 依赖注入
	@Autowired
	private StudentService studentService;

	@Autowired
	private ClassService classService;
	
	@Autowired
	private BuildService buildService;
	
	@Autowired
	private DormService dormService;
	
	@Autowired
	private DormService dormService1;
	/**
	 * 分页查询
	 * pageIndex 当前页码
	 * pageSize  显示条数
	 */
	@RequestMapping(value = "/findStudent")
	public String findStudent(Integer stu_num,Integer class_id,Integer dorm_id,Integer pageIndex, Integer pageSize, Model model) {

	  PageInfo<Student> pi = studentService.findPageInfo(stu_num,class_id,dorm_id,pageIndex,pageSize);
	  model.addAttribute("pi",pi);
	  List<Class> cs=classService.getAll();
	  model.addAttribute("cs", cs);
	  return "student_list";
	}
	
	/**
	 * 查询未分配宿舍的学生
	 */
	@RequestMapping(value = "/findDormStudent")
	public String findDormStudent(Integer stu_num,Integer class_id,Integer dorm_id,Integer pageIndex, Integer pageSize, Model model) {
	  
	  PageInfo<Student> pi = studentService.findPageInfo(stu_num,class_id,dorm_id,pageIndex,pageSize);
	  model.addAttribute("pi",pi);
	  List<Class> cs=classService.getAll();
	  model.addAttribute("cs", cs);
	  return "dormStudent_list";
	}
	
	/**
	 * 查询已分配宿舍的学生
	 */
	@RequestMapping(value = "/findSwitchDormStudent")
	public String findSwitchDormStudent(Integer stu_num,Integer class_id,Integer dorm_id,Integer pageIndex, Integer pageSize, Model model) {
	  
	  PageInfo<Student> pi = studentService.findSwitchPageInfo(stu_num,class_id,dorm_id,pageIndex,pageSize);
	  model.addAttribute("pi",pi);
	  List<Class> cs=classService.getAll();
	  model.addAttribute("cs", cs);
	  List<Dorm> dm=dormService.getAll();
	  model.addAttribute("dm",dm);
	  return "switchDormStudent_list";
	}
	
	/**
	 * 删除学生信息
	 */
	@RequestMapping( "/deleteStudent")
	@ResponseBody
	public String deleteStudent(Integer stu_id) {
		studentService.deleteStudent(stu_id);
		return "student_list";
	}

	/**
	 * 添加学生信息
	 */
   @RequestMapping(value = "/addStudent" ,method = RequestMethod.POST)
   @ResponseBody
   public String addStudent(@RequestBody Student student) {
	   studentService.addStudent(student);
	    return "student_list";
    }

	/**
	 * 修改学生信息
	 */
	@RequestMapping(value = "/updateStudent" ,method = RequestMethod.POST)
	public String updateStudent(Student student) {
		studentService.updateStudent(student);
		return "redirect:/findStudent";
	}
	/**
	 * 为学生分配宿舍
	 */
	@RequestMapping(value = "/updateDormStudent" ,method = RequestMethod.POST )
	public String updateDormStudent(Student student,RedirectAttributesModelMap modelMap) {
		Dorm dorm_empty=dormService.findDormById(student.getDorm_id()); //判断宿舍是否已经住满
		if (dorm_empty.getDorm_empty()==0) {
			modelMap.addFlashAttribute("dormEmpty_msg", "该宿舍已住满，请选择其他宿舍!!!");
			return "redirect:/findDormStudentById?stu_id="+student.getStu_id();
		}else {
			studentService.updateStudent(student);
			dormService.updateEmptyDorm(student.getDorm_id());//更新宿舍空床数
			return "redirect:/findDormStudent?dorm_id=0";
		}
	}
	/**
	 * 调换宿舍时的更新操作
	 */
	@RequestMapping(value = "/updateSwitchDormStudent" ,method = RequestMethod.POST )
	public String updateSwitchDormStudent(Student student,RedirectAttributesModelMap modelMap) {
		Dorm dorm_empty=dormService.findDormById(student.getDorm_id()); //判断宿舍是否已经住满
		if (dorm_empty.getDorm_empty()==0) {
			modelMap.addFlashAttribute("dormEmpty_msg", "该宿舍已住满，请选择其他宿舍!!!");
			return "redirect:/findSwitchDormStudentById?stu_id="+student.getStu_id();
		}else {
			dormService1.updateOldEmptyDorm(student.getOld_dorm_id());//更改原宿舍空床数
			System.out.println("原宿舍id为："+student.getOld_dorm_id());
			studentService.updateStudent(student);
			dormService.updateEmptyDorm(student.getDorm_id());//更新宿舍空床数
			return "redirect:/findSwitchDormStudent";
		}
	}
	/**
	 * 移出宿舍
	 */
	@RequestMapping(value = "/removeDormStudent" ,method = RequestMethod.POST )
	public String removeDormStudent(Student student) {
		studentService.removeStudentForDorm(student.getStu_id());
		dormService1.updateOldEmptyDorm(student.getOld_dorm_id());
		return "redirect:/findSwitchDormStudent";
	}

    @RequestMapping( "/findStudentById")
    public String findStudentById(Integer stu_id,Model model,HttpSession session) {
    	List<Class> cList=classService.getAll();
    	model.addAttribute("cList",cList);
        Student s= studentService.findStudentById(stu_id);
        session.setAttribute("s",s);
        return "student_edit";
    }
    /**
     * 查看未分配宿舍学生
     */
    @RequestMapping( "/findDormStudentById")
    public String findDormStudentById(Integer stu_id,Model model,HttpSession session) {
    	List<Class> cList=classService.getAll();
    	model.addAttribute("cList",cList);
        Student s= studentService.findStudentById(stu_id);
        session.setAttribute("s",s);
        List<Build> builds=buildService.getAll();
        model.addAttribute("builds", builds);
        List<Dorm> dorms=dormService.getAll();
        model.addAttribute("dorms", dorms);
        return "dormStudent_edit";
    }
    
    /**
     * 查看已分配宿舍(调换宿舍)学生
     */
    @RequestMapping( "/findSwitchDormStudentById")
    public String findSwitchDormStudentById(Integer stu_id,Model model,HttpSession session) {
    	List<Class> cList=classService.getAll();
    	model.addAttribute("cList",cList);
        Student s= studentService.findOldDormStudentById(stu_id);
        System.out.println(s.toString());
        model.addAttribute("s", s);
        //session.setAttribute("s",s);
        List<Build> builds=buildService.getAll();
        model.addAttribute("builds", builds);
        List<Dorm> dorms=dormService.getAll();
        model.addAttribute("dorms", dorms);
        return "switchDormStudent_edit";
    }
    
    /**
     * 移出宿舍学生
     */
    @RequestMapping( "/findSwitchDormStudentByIdRemove")
    public String findSwitchDormStudentByIdRemove(Integer stu_id,Model model,HttpSession session) {
    	
    	List<Class> cList=classService.getAll();
    	model.addAttribute("cList",cList);
        Student s= studentService.findStudentById(stu_id);
        session.setAttribute("s",s);
        List<Build> builds=buildService.getAll();
        model.addAttribute("builds", builds);
        List<Dorm> dorms=dormService.getAll();
        model.addAttribute("dorms", dorms);
        return "removeDormStudent_edit";
    }
}
