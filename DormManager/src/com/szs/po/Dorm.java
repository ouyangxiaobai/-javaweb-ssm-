package com.szs.po;

public class Dorm {
	private Integer dorm_id;
	private Integer dorm_num;
	private Integer dorm_capacity;
	private Integer dorm_empty;
	private Integer build_id;
	private Build build;
	public Integer getDorm_id() {
		return dorm_id;
	}
	public void setDorm_id(Integer dorm_id) {
		this.dorm_id = dorm_id;
	}
	public Integer getDorm_num() {
		return dorm_num;
	}
	public void setDorm_num(Integer dorm_num) {
		this.dorm_num = dorm_num;
	}
	public Integer getDorm_capacity() {
		return dorm_capacity;
	}
	public void setDorm_capacity(Integer dorm_capacity) {
		this.dorm_capacity = dorm_capacity;
	}
	public Integer getDorm_empty() {
		return dorm_empty;
	}
	public void setDorm_empty(Integer dorm_empty) {
		this.dorm_empty = dorm_empty;
	}
	public Integer getBuild_id() {
		return build_id;
	}
	public void setBuild_id(Integer build_id) {
		this.build_id = build_id;
	}
	public Build getBuild() {
		return build;
	}
	public void setBuild(Build build) {
		this.build = build;
	}

	
}
