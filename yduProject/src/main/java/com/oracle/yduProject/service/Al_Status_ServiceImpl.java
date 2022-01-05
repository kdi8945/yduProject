package com.oracle.yduProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.yduProject.dao.Al_Status_Dao;
import com.oracle.yduProject.model.Al_Status;

@Service
public class Al_Status_ServiceImpl implements Al_Status_Service {
	@Autowired
	private Al_Status_Dao asd;

	@Override
	public String applyClass(Al_Status al_Status) {
		String str = null;
		int applyClass = asd.applyClass(al_Status);
		if(applyClass == 1) {
			str = "applyOk";
		} else if(applyClass == 4) {
			str = "applyAndCreateOk";
		} else if(applyClass == 5) {
			str = "Duplicate";
		} else {
			str = "applyError";
		}
		return str;
	}

	@Override
	public String applyCancel(Al_Status al_Status) {
		String str = null;
		int applyCancel = asd.applyCancel(al_Status);
		if(applyCancel > 0) {
			str = "cancelOk";
		} else {
			str = "cancelError";
		}
		return str;
	}

	@Override
	public String classWaiver(Al_Status al_Status) {
		String str = null;
		int classWaiver = asd.classWaiver(al_Status);
		if(classWaiver > 0) {
			str = "classWaiverOk";
		} else {
			str = "classWaiverError";
		}
		return str;
	}

	@Override
	public Al_Status updateAstatus(Al_Status al_Status) {
		return asd.updateAstatus(al_Status);
	}
}
