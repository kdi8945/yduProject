package com.oracle.yduProject.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Al_Status {
	private int al_num;
	private int c_num;
	private String stu_id;
	private int a_status;
	private String name;
	private int todayAttendChk;
	
	// 수업일정 체크용
	private Date c_s_date;
	private Date c_e_date;
	private String c_e_time;
	private String c_co_time;
	
	private int resultCode;
	private String resultMsg;
	
	@Override
	public String toString() {
		return "Al_Status [al_num=" + al_num + ", c_num=" + c_num + ", stu_id=" + stu_id + ", a_status=" + a_status
				+ ", name=" + name + ", todayAttendChk=" + todayAttendChk + ", c_s_date=" + c_s_date + ", c_e_date="
				+ c_e_date + ", c_e_time=" + c_e_time + ", c_co_time=" + c_co_time + ", resultCode=" + resultCode
				+ ", resultMsg=" + resultMsg + "]";
	}
}
