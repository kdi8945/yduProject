package com.oracle.yduProject.dao;

import java.util.List;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Pre_C_Info_RVO;

public interface Pre_C_Info_Dao {

	int classTot();

	List<Pre_C_Info> classList(Pre_C_Info pre_C_Info);

	Pre_C_Info classContent(int c_num);

	int applyStudentCnt(int c_num);

	Al_Status applyStudent(Al_Status al_Status);

	int classFixed(Pre_C_Info pre_C_Info);

	int classClosed(Pre_C_Info pre_C_Info);

	int classUpdate(Pre_C_Info pre_C_Info);

	int classDelete(Pre_C_Info pre_C_Info);

	int classFinish(Pre_C_Info pre_C_Info);

	int createClass(Pre_C_Info pre_C_Info);

	List<Pre_C_Info> selectClassList(Pre_C_Info pre_C_Info);

	Pre_C_Info_RVO createCInfo(Pre_C_Info pre_C_Info);

	Pre_C_Info myClassTime(C_Stu_Info c_Stu_Info);

	int myRateChk(Al_Status al_Status);

	List<Pre_C_Info> myCreateClassList(Pre_C_Info pre_C_Info);

	int myClassTot(Pre_C_Info pre_C_Info);

	List<Pre_C_Info> searchClass(Pre_C_Info pre_C_Info);

	List<Pre_C_Info> searchMyClass(Pre_C_Info pre_C_Info);

	Pre_C_Info updateCstatus(Pre_C_Info pre_C_Info);

	int myApplyTot(Pre_C_Info pre_C_Info);

	List<Pre_C_Info> myApplyList(Pre_C_Info pre_C_Info);

	List<Pre_C_Info> searchMyApplyClass(Pre_C_Info pre_C_Info);

}
