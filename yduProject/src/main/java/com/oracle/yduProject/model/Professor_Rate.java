package com.oracle.yduProject.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Professor_Rate{
	private int prof_rate_num; //교수평가일련번호
	private int c_num;//수업번호
	private String stu_id;//학생아이디
	private double prof_rates;//교수평점
	private String rate_content; //교수평가내용
	private String name;//이름
	
	// 리스트 조회용
	private String pro_id;
	
	private String resultMsg;
	private int errorCode;
	
	// 수정폼 호출용
	private String c_name;
	private String c_overview;
	private Date c_s_date;
	private Date c_e_date;
	@Override
	public String toString() {
		return "Professor_Rate [prof_rate_num=" + prof_rate_num + ", c_num=" + c_num + ", stu_id=" + stu_id
				+ ", prof_rates=" + prof_rates + ", rate_content=" + rate_content + ", name=" + name + ", pro_id="
				+ pro_id + ", resultMsg=" + resultMsg + ", errorCode=" + errorCode + ", c_name=" + c_name
				+ ", c_overview=" + c_overview + ", c_s_date=" + c_s_date + ", c_e_date=" + c_e_date + "]";
	}
	
	
	
}
