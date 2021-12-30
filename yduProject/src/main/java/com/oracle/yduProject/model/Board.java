package com.oracle.yduProject.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Board {
	private int b_num;
	private String id;
	private int b_type;
	private String name;
	private String b_title;
	private String b_content;
	private Date b_w_date;
	private int b_view;
	private int start;
	private int end;
	private int bambooStart = 0;
	private int bambooEnd= 20;
	
	private String resultMsg; //bambooWrite 를 위한 메세지 선언(json 방식)

	@Override
	public String toString() {
		return "Board [b_num=" + b_num + ", id=" + id + ", b_type=" + b_type + ", name=" + name + ", b_title=" + b_title
				+ ", b_content=" + b_content + ", b_w_date=" + b_w_date + ", b_view=" + b_view + ", start=" + start
				+ ", end=" + end + ", bambooStart=" + bambooStart + ", bambooEnd=" + bambooEnd + ", resultMsg="
				+ resultMsg + "]";
	}
	
}
