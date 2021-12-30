package com.oracle.yduProject.dao;

import java.util.List;

import com.oracle.yduProject.model.C_Name_List_RVO;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.MemberInfo;
import com.oracle.yduProject.model.Terms;

public interface MemberInfoDao {

	List<Terms> TermsList();
	
	String confirmId(String id);

	int loginChk(MemberInfo memberInfo);

	int joinMember(MemberInfo memberInfo);

	MemberInfo bringMemberInfo(MemberInfo memberInfo);

	int joinTerms(MemberInfo memberInfo);

	void createCStuInfo(C_Name_List_RVO rVO, String id);

	int memberInfoTot();

	List<MemberInfo> memberInfoList(MemberInfo memberInfo);


}
