package com.oracle.yduProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oracle.yduProject.model.C_Name_List_RVO;
import com.oracle.yduProject.model.MemberInfo;
import com.oracle.yduProject.model.Terms;

public interface MemberInfoService {

//	List<Terms> necessaryTermsList();
//
//	List<Terms> selectTermsList();
	
	List<Terms> TermsList();

	String confirmId(String id);


	C_Name_List_RVO loginChk(HttpServletRequest request, MemberInfo memberInfo);

	MemberInfo join(MemberInfo memberInfo);

	int memberInfoTot();

	List<MemberInfo> memberInfoList(MemberInfo memberInfo);

}
