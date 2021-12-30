package com.oracle.yduProject.service;

import com.oracle.yduProject.model.Al_Status;

public interface Al_Status_Service {

	String applyClass(Al_Status al_Status);

	String applyCancel(Al_Status al_Status);

	String classWaiver(Al_Status al_Status);

}
