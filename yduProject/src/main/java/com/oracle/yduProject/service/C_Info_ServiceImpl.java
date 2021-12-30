package com.oracle.yduProject.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.yduProject.dao.C_Info_Dao;
import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Info;
import com.oracle.yduProject.model.Pre_C_Info;

@Service
public class C_Info_ServiceImpl implements C_Info_Service {
	@Autowired
	private C_Info_Dao cid;

	@Override
	public C_Info cNums(Pre_C_Info pre_C_Info) {
		return cid.cNums(pre_C_Info);
	}

	@Override
	public List<C_Info> classStudentInfoList(Pre_C_Info pre_C_Info) {
		return cid.classStudentInfoList(pre_C_Info);
	}

	@Override
	public Pre_C_Info getMyClassInfo(Pre_C_Info pre_C_Info) {
		return cid.getMyClassInfo(pre_C_Info);
	}

	@Override
	public C_Info scoreUpdate(C_Info c_Info) {
		return cid.scoreUpdate(c_Info);
	}

	@Override
	public List<C_Info> myApplyClassList(Al_Status al_Status) {
		return cid.myApplyClassList(al_Status);
	}

	@Override
	public List<C_Info> myClassInfoList(Pre_C_Info pre_C_Info) {
		return cid.myClassInfoList(pre_C_Info);
	}


}
