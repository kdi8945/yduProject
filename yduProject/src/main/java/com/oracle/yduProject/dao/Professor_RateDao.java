package com.oracle.yduProject.dao;

import java.util.List;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Professor_Rate;

public interface Professor_RateDao {

	List<Pre_C_Info> professorRateList(Pre_C_Info pre_C_Info);

	List<Professor_Rate> profRateContList(Pre_C_Info pre_C_Info);

	Pre_C_Info getProfRateInfo(Pre_C_Info pre_C_Info);

	Pre_C_Info professorRateForm(Pre_C_Info pre_C_Info);

	Professor_Rate professorRate(Professor_Rate professor_Rate);

	Professor_Rate profRateUpdateForm(Al_Status al_Status);

	Professor_Rate rateUpdate(Professor_Rate professor_Rate);

	List<Pre_C_Info> searchProfRate(Pre_C_Info pre_C_Info);

	Professor_Rate professorRateDelete(Professor_Rate professor_Rate);


}
