package com.szs.po;

public class Student {
    private static final long serialVersionUID = 1L;
    private  Integer stu_id;
    private  Integer stu_num;
    private  String  stu_name;
    private  String  stu_password;
    private  String  stu_sex;
    private  String stu_date;
    private  String  stu_phone;
    private  Integer class_id;
    private  Integer  dorm_id;
    private Integer old_dorm_id;//原宿舍ID
    private Dorm dorm;
    private Class class1;
	public Dorm getDorm() {
		return dorm;
	}
	public void setDorm(Dorm dorm) {
		this.dorm = dorm;
	}
	public Class getClass1() {
		return class1;
	}
	public void setClass1(Class class1) {
		this.class1 = class1;
	}
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}
	public Integer getStu_num() {
		return stu_num;
	}
	public void setStu_num(Integer stu_num) {
		this.stu_num = stu_num;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_password() {
		return stu_password;
	}
	public void setStu_password(String stu_password) {
		this.stu_password = stu_password;
	}
	public String getStu_sex() {
		return stu_sex;
	}
	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	public String getStu_date() {
		return stu_date;
	}
	public void setStu_date(String stu_date) {
		this.stu_date = stu_date;
	}
	
	public String getStu_phone() {
		return stu_phone;
	}
	public void setStu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}
	public Integer getClass_id() {
		return class_id;
	}
	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}
	public Integer getDorm_id() {
		return dorm_id;
	}
	public void setDorm_id(Integer dorm_id) {
		this.dorm_id = dorm_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getOld_dorm_id() {
		return old_dorm_id;
	}
	public void setOld_dorm_id(Integer old_dorm_id) {
		this.old_dorm_id = old_dorm_id;
	}
	@Override
	public String toString() {
		return "Student [stu_id=" + stu_id + ", stu_num=" + stu_num + ", stu_name=" + stu_name + ", stu_password="
				+ stu_password + ", stu_sex=" + stu_sex + ", stu_date=" + stu_date + ", stu_phone=" + stu_phone
				+ ", class_id=" + class_id + ", dorm_id=" + dorm_id + ", old_dorm_id=" + old_dorm_id + ", dorm=" + dorm
				+ ", class1=" + class1 + "]";
	}
    

   
}
