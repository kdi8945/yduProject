package com.oracle.yduProject.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class B_Comment {
	private int c_num;
	private String c_content;
	private String id;
	private int b_num;
	private int b_type;
	private Date c_w_date;
	private String name;
	@Override
	public String toString() {
		return "B_Comment [c_num=" + c_num + ", c_content=" + c_content + ", id=" + id + ", b_num=" + b_num
				+ ", b_type=" + b_type + ", c_w_date=" + c_w_date + ", name=" + name + "]";
	}

	
	
	
}
