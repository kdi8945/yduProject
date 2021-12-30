package com.oracle.yduProject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Terms {
	private int t_num;
	private String t_content;
	private String t_necessary;
	@Override
	public String toString() {
		return "Terms [t_num=" + t_num + ", t_content=" + t_content + ", t_necessary=" + t_necessary + "]";
	}
	
	
	
}
