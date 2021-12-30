package com.oracle.yduProject.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Professor_Rate;
import com.oracle.yduProject.service.Professor_Rate_Service;

@Controller
public class Professor_Rate_Controller {
	@Autowired
	private Professor_Rate_Service prs;
	
	@RequestMapping("professorRateList")
	public String professorRateList(HttpServletRequest request, Pre_C_Info pre_C_Info, Model model) {
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			List<Pre_C_Info> professorRateList = prs.professorRateList(pre_C_Info);
			model.addAttribute("listSize", professorRateList.size());
			if(professorRateList.size() > 0) {
				model.addAttribute("professorRateList", professorRateList);
			}
			
			return "professorRateList";
		} catch (Exception e) {
			return "sessionIsNull";
		}
	}
	
	@RequestMapping("professorRateContent")
	public String professorRateContent(HttpServletRequest request, Pre_C_Info pre_C_Info, Model model) {
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			if(pre_C_Info.getC_num() == 0) {
				return "wrongPath";
			}
			Pre_C_Info getProfRateInfo = prs.getProfRateInfo(pre_C_Info);
			List<Professor_Rate> profRateContList = prs.profRateContList(pre_C_Info);
			model.addAttribute("cInfo", getProfRateInfo);
			model.addAttribute("profRateContList",profRateContList);
			return "professorRateContent";
		} catch (Exception e) {
			return "sessionIsNull";
		}
	}
	@RequestMapping("professorRateForm")
	public String professorRateForm(HttpServletRequest request,Pre_C_Info pre_C_Info, Model model) {
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			if(pre_C_Info.getC_num() == 0 || autority !=1) {
				return "wrongPath";
			}
			Pre_C_Info professorRateForm = prs.professorRateForm(pre_C_Info);
			model.addAttribute("professorRateForm", professorRateForm);
			return "professorRateForm";
		} catch (Exception e) {
			return "sessionIsNull";
		}
	}
	@RequestMapping("professorRate")
	@ResponseBody
	public Professor_Rate professorRate(Professor_Rate professor_Rate) {
		System.out.println(professor_Rate);
		Professor_Rate rateResult = prs.professorRate(professor_Rate);
		
		return rateResult;
		
	}
	@RequestMapping("professorRateUpdateForm")
	public String professorRateUpdateForm(HttpServletRequest request,Al_Status al_Status, Model model) {
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			if(al_Status.getC_num() == 0 || autority !=1) {
				return "wrongPath";
			}
			Professor_Rate profRateUpdateForm = prs.profRateUpdateForm(al_Status);
			model.addAttribute("profRateUpdateForm",profRateUpdateForm);
			return "professorRateUpdateForm";
		} catch (Exception e) {
			return "sessionIsNull";
		}
	}
	@RequestMapping("rateUpdate")
	@ResponseBody
	public Professor_Rate rateUpdate(Professor_Rate professor_Rate) {
		Professor_Rate rateUpdate = prs.rateUpdate(professor_Rate);
		
		return rateUpdate;
	}
	@RequestMapping("searchProfRate")
	@ResponseBody
	public List<Pre_C_Info> searchProfRate(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> searchProfRate = prs.searchProfRate(pre_C_Info);
		return searchProfRate;
	}
	@RequestMapping("professorRateDelete")
	@ResponseBody
	public Professor_Rate professorRateDelete(Professor_Rate professor_Rate) {
		Professor_Rate professorRateDelete = prs.professorRateDelete(professor_Rate);
		
		return professorRateDelete;
		
	}
}
