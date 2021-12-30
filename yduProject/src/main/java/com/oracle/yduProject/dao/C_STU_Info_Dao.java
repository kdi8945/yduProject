package com.oracle.yduProject.dao;

import java.util.List;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.Pre_C_Info;

public interface C_STU_Info_Dao {

	C_Stu_Info cStuInfo(Al_Status al_Status);

	C_Stu_Info enterTime(C_Stu_Info c_Stu_Info);

	C_Stu_Info todayMyTime(C_Stu_Info c_Stu_Info);

	C_Stu_Info checkOutTime(C_Stu_Info c_Stu_Info);

	List<C_Stu_Info> myCStuInfo(C_Stu_Info c_Stu_Info);

	Pre_C_Info applyClassInfo(C_Stu_Info c_Stu_Info);

}
