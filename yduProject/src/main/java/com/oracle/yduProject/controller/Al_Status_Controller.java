package com.oracle.yduProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.service.Al_Status_Service;

@Controller
public class Al_Status_Controller {
	@Autowired
	private Al_Status_Service ass;
	
	@RequestMapping("applyClass")
	@ResponseBody
	public String applyClass(Al_Status al_Status) {
		System.out.println("apply al_Status ::: "+al_Status.toString());
		String str = ass.applyClass(al_Status);
		return str;
	}
	
	@RequestMapping("applyCancel")
	@ResponseBody
	public String applyCancel(Al_Status al_Status) {
		System.out.println("cancel al_Status ::: " + al_Status.toString());
		String str = ass.applyCancel(al_Status);
		return str;
	}
	
	@RequestMapping("classWaiver")
	@ResponseBody
	public String classWaiver(Al_Status al_Status) {
		String str = ass.classWaiver(al_Status);
		return str;
	}

}
