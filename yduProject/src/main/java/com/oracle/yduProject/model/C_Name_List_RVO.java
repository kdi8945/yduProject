package com.oracle.yduProject.model;

import lombok.Data;

@Data
public class C_Name_List_RVO {
	private String result;
	private int errorCode;
	private String errorMsg;
	private String createCStuInfoMsg;
	
	@Override
	public String toString() {
		return "C_Name_List_RVO [result=" + result + ", errorCode=" + errorCode + ", errorMsg=" + errorMsg
				+ ", createCStuInfoMsg=" + createCStuInfoMsg + "]";
	}
}
