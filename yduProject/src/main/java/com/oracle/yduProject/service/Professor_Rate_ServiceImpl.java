package com.oracle.yduProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.yduProject.dao.Professor_RateDao;
import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Professor_Rate;

@Service
public class Professor_Rate_ServiceImpl implements Professor_Rate_Service {
	
	@Autowired
	private Professor_RateDao prd;

	@Override
	public List<Pre_C_Info> professorRateList(Pre_C_Info pre_C_Info) {
		return prd.professorRateList(pre_C_Info);
	}

	@Override
	public List<Professor_Rate> profRateContList(Pre_C_Info pre_C_Info) {
		return prd.profRateContList(pre_C_Info);
	}

	@Override
	public Pre_C_Info getProfRateInfo(Pre_C_Info pre_C_Info) {
		return prd.getProfRateInfo(pre_C_Info);
	}

	@Override
	public Pre_C_Info professorRateForm(Pre_C_Info pre_C_Info) {
		return prd.professorRateForm(pre_C_Info);
	}

	@Override
	public Professor_Rate professorRate(Professor_Rate professor_Rate) {
		return prd.professorRate(professor_Rate);
	}

	@Override
	public Professor_Rate profRateUpdateForm(Al_Status al_Status) {
		return prd.profRateUpdateForm(al_Status);
	}

	@Override
	public Professor_Rate rateUpdate(Professor_Rate professor_Rate) {
		return prd.rateUpdate(professor_Rate);
	}

	@Override
	public List<Pre_C_Info> searchProfRate(Pre_C_Info pre_C_Info) {
		return prd.searchProfRate(pre_C_Info);
	}

	@Override
	public Professor_Rate professorRateDelete(Professor_Rate professor_Rate) {
		return prd.professorRateDelete(professor_Rate);
	}

 
}
