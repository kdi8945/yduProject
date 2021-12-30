package com.oracle.yduProject.dao;

import com.oracle.yduProject.model.Al_Status;

public interface Al_Status_Dao {

	int applyClass(Al_Status al_Status);

	int applyCancel(Al_Status al_Status);

	int classWaiver(Al_Status al_Status);

}
