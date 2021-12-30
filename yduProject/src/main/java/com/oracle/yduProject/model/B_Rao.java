package com.oracle.yduProject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class B_Rao {
	private int b_num;
	private String id;
	private int b_rao_status;
	private String name;
	@Override
	public String toString() {
		return "B_Rao [b_num=" + b_num + ", id=" + id + ", b_rao_status=" + b_rao_status + ", name=" + name + "]";
	}
	
	
}
