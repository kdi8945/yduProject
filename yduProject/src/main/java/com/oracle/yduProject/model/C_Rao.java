package com.oracle.yduProject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class C_Rao {
	private int c_num;
	private String id;
	private int c_rao_status;
	private String name;
	@Override
	public String toString() {
		return "C_Rao [c_num=" + c_num + ", id=" + id + ", c_rao_status=" + c_rao_status + ", name=" + name + "]";
	}
	
}
