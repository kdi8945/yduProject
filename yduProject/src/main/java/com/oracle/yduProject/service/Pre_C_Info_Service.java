package com.oracle.yduProject.service;

import java.util.List;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Pre_C_Info_RVO;

public interface Pre_C_Info_Service {

	Pre_C_Info_RVO createClass(Pre_C_Info pre_C_Info);

	int classTot();

	List<Pre_C_Info> classList(Pre_C_Info pre_C_Info);

	Pre_C_Info classContent(int c_num);

	int applyStudentCnt(int c_num);

	Al_Status applyStudent(Al_Status al_Status);

	Pre_C_Info_RVO classSet(Pre_C_Info pre_C_Info, int set);

	Pre_C_Info_RVO classUpdate(Pre_C_Info pre_C_Info);

	String classDelete(Pre_C_Info pre_C_Info);

	String classFinish(Pre_C_Info pre_C_Info);

	List<Pre_C_Info> selectClassList(Pre_C_Info pre_C_Info);

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
