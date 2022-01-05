package com.oracle.yduProject.dao;

import java.util.List;

import com.oracle.yduProject.model.C_Name_List_RVO;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.MemberInfo;
import com.oracle.yduProject.model.Pre_C_Info;
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
