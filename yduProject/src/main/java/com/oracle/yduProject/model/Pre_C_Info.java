package com.oracle.yduProject.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pre_C_Info {
	private int c_num;
	private String pro_id;
	private String c_name;
	private String c_overview;
	private Date c_re_date;
	private Date c_s_date;
	private Date c_e_date;
	private String c_e_time;
	private String c_co_time;
	private int s_closed;
	private int c_status;
	
	// 조회용
	private int start;
	private int end;
	private String name;
	
	// 시간 노출용
	private String eHour;
	private String eMin;
	private String coHour;
	private String coMin;
	
	// 교수자평가용
	private double prof_rates;

	// 검색용
	private String searchContent;
	private int resultCode;
	
	// 관리자페이지용
	private int a_status;
	private String id;
	private String pro_name;
	private String resultMsg;
	
	// 학생 마이페이지용
	private String stu_id;

	@Override
	public String toString() {
		return "Pre_C_Info [c_num=" + c_num + ", pro_id=" + pro_id + ", c_name=" + c_name + ", c_overview=" + c_overview
				+ ", c_re_date=" + c_re_date + ", c_s_date=" + c_s_date + ", c_e_date=" + c_e_date + ", c_e_time="
				+ c_e_time + ", c_co_time=" + c_co_time + ", s_closed=" + s_closed + ", c_status=" + c_status
				+ ", start=" + start + ", end=" + end + ", name=" + name + ", eHour=" + eHour + ", eMin=" + eMin
				+ ", coHour=" + coHour + ", coMin=" + coMin + ", prof_rates=" + prof_rates + ", searchContent="
				+ searchContent + ", resultCode=" + resultCode + ", a_status=" + a_status + ", id=" + id + ", pro_name="
				+ pro_name + ", resultMsg=" + resultMsg + ", stu_id=" + stu_id + "]";
	}
	
}
