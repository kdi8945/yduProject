package com.oracle.yduProject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.service.C_Stu_Info_Service;

@Controller
public class C_Stu_Info_Controller {
	@Autowired
	private C_Stu_Info_Service csis;
	
	@RequestMapping("enterTime")
	@ResponseBody
	public C_Stu_Info enterTime(C_Stu_Info c_Stu_Info) {
		C_Stu_Info enterTime = csis.enterTime(c_Stu_Info);
		return enterTime;
	}
	
	@RequestMapping("checkOutTime")
	@ResponseBody
	public C_Stu_Info checkOutTime(C_Stu_Info c_Stu_Info) {
		C_Stu_Info checkOutTime = csis.checkOutTime(c_Stu_Info);
		return checkOutTime;
	}
	
	@RequestMapping("myCStuInfo")
	public String myCStuInfo(HttpServletRequest request, C_Stu_Info c_Stu_Info, Model model) {
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			if(c_Stu_Info.getC_num() == 0 || autority != 1) {
				return "wrongPath";
			}
			List<C_Stu_Info> myCStuInfo = csis.myCStuInfo(c_Stu_Info);
			Pre_C_Info applyClassInfo = csis.applyClassInfo(c_Stu_Info);
			model.addAttribute("myCStuInfoSize",myCStuInfo.size());
			model.addAttribute("myCStuInfo", myCStuInfo);
			model.addAttribute("applyClassInfo", applyClassInfo);
		} catch (Exception e) {
			return "sessionIsNull";
		}
		return "myCStuInfo";
	}
}
