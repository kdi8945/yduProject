package com.oracle.yduProject.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class C_Stu_Info {
	private int c_stu_num;
	private String stu_id;
	private int c_num;
	private String e_time;
	private String co_time;
	private String attendstatus;
	private Date attendance;
	private String name;
	private int todayAttendChk;
	
	// 출결체크용
	private String hour;
	private String min;
	
	// 메세지용
	private String resultMsg;
	
	// 출결정보 확인용
	private String attendChk;
	private String ehour;
	private String emin;
	private String cohour;
	private String comin;
	@Override
	public String toString() {
		return "C_Stu_Info [c_stu_num=" + c_stu_num + ", stu_id=" + stu_id + ", c_num=" + c_num + ", e_time=" + e_time
				+ ", co_time=" + co_time + ", attendstatus=" + attendstatus + ", attendance=" + attendance + ", name="
				+ name + ", todayAttendChk=" + todayAttendChk + ", hour=" + hour + ", min=" + min + ", resultMsg="
				+ resultMsg + ", attendChk=" + attendChk + ", ehour=" + ehour + ", emin=" + emin + ", cohour=" + cohour
				+ ", comin=" + comin + "]";
	}



	
}
