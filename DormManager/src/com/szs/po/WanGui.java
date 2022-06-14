package com.szs.po;

public class WanGui {

	private Integer wg_id;
	private Integer dorm_id;
	private Integer stu_id;
	private String wg_cause;
	private String wg_date;
	private Dorm dorm;
	private Student student;
	public Integer getWg_id() {
		return wg_id;
	}
	public void setWg_id(Integer wg_id) {
		this.wg_id = wg_id;
	}
	public Integer getDorm_id() {
		return dorm_id;
	}
	public void setDorm_id(Integer dorm_id) {
		this.dorm_id = dorm_id;
	}
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}
	public String getWg_cause() {
		return wg_cause;
	}
	public void setWg_cause(String wg_cause) {
		this.wg_cause = wg_cause;
	}
	public String getWg_date() {
		return wg_date;
	}
	public void setWg_date(String wg_date) {
		this.wg_date = wg_date;
	}
	public Dorm getDorm() {
		return dorm;
	}
	public void setDorm(Dorm dorm) {
		this.dorm = dorm;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
}
