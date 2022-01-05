package com.oracle.yduProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oracle.yduProject.model.C_Name_List_RVO;
import com.oracle.yduProject.model.MemberInfo;
import com.oracle.yduProject.model.Pre_C_Info;
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

	int widrawStudentTot(MemberInfo memberInfo);

	List<Pre_C_Info> widrawStudentInfo(MemberInfo memberInfo);

	int professorTot(MemberInfo memberInfo);

	List<Pre_C_Info> professorInfo(MemberInfo memberInfo);

	int studentInfoTot(MemberInfo memberInfo);

	List<Pre_C_Info> studentInfo(MemberInfo memberInfo);

	MemberInfo widrawPwChk(MemberInfo memberInfo);

	MemberInfo widrawStuResult(MemberInfo memberInfo);

	MemberInfo widrawProResult(MemberInfo memberInfo);

	List<MemberInfo> selectView(MemberInfo memberInfo);

	List<MemberInfo> searchMember(MemberInfo memberInfo);

	MemberInfo changeAutority(MemberInfo memberInfo);

	MemberInfo changeMemstatus(MemberInfo memberInfo);

}
