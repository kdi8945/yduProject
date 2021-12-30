package com.oracle.yduProject.dao;

import java.util.List;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Info;
import com.oracle.yduProject.model.Pre_C_Info;

public interface C_Info_Dao {

	C_Info cNums(Pre_C_Info pre_C_Info);

	List<C_Info> classStudentInfoList(Pre_C_Info pre_C_Info);

	Pre_C_Info getMyClassInfo(Pre_C_Info pre_C_Info);

	C_Info scoreUpdate(C_Info c_Info);

	List<C_Info> myApplyClassList(Al_Status al_Status);

	List<C_Info> myClassInfoList(Pre_C_Info pre_C_Info);



}
