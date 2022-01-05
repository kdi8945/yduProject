package com.oracle.yduProject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberInfo {
	private String id;
	private String pw;
	private String name;
	private String email;
	private int yducode;
	private int autority;
	private int mem_status;
	private String t_numArr;
	private String t_necessaryArr;
	private String t_numArrs;
	private String t_necessaryArrs;
	
	private String resultMsg;
	private String subResultMsg;
	private int resultCode;
	
	private int start;
	private int end;
	
	private int c_num;
	
	private String keyword;
	private int ms1Keyword;
	private int ms2Keyword;
	private int arKeyWord;
	
	private int preAutority;
	private int preMem_status;
	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", yducode=" + yducode
				+ ", autority=" + autority + ", mem_status=" + mem_status + ", t_numArr=" + t_numArr
				+ ", t_necessaryArr=" + t_necessaryArr + ", t_numArrs=" + t_numArrs + ", t_necessaryArrs="
				+ t_necessaryArrs + ", resultMsg=" + resultMsg + ", subResultMsg=" + subResultMsg + ", resultCode="
				+ resultCode + ", start=" + start + ", end=" + end + ", c_num=" + c_num + ", keyword=" + keyword
				+ ", ms1Keyword=" + ms1Keyword + ", ms2Keyword=" + ms2Keyword + ", arKeyWord=" + arKeyWord
				+ ", preAutority=" + preAutority + ", preMem_status=" + preMem_status + "]";
	}
	
}