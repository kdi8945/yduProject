package com.oracle.yduProject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pre_C_Info_RVO {
	private String resultMsg;
	private String subResultMsg;
	private int createChk;
	private int resultCode;
	
	@Override
	public String toString() {
		return "Pre_C_Info_RVO [resultMsg=" + resultMsg + ", subResultMsg=" + subResultMsg + ", createChk=" + createChk
				+ ", resultCode=" + resultCode + "]";
	}
}
