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
import com.oracle.yduProject.model.C_Info;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.service.C_Info_Service;

@Controller
public class C_Info_Controller {
	@Autowired
	private C_Info_Service cis;

	@RequestMapping("stuCInfo")
	public String stuCInfo(HttpServletRequest request, Al_Status al_Status, Model model) {
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority != 1) {
				return "wrongPath";
			}
			List<C_Info> myApplyClassList = cis.myApplyClassList(al_Status);
			if(myApplyClassList.size() > 0) {
				model.addAttribute("myApplyClassList", myApplyClassList);
				model.addAttribute("myApplyClassSize", myApplyClassList.size());
				model.addAttribute("myAstatus", al_Status.getA_status());
			} else {
				model.addAttribute("myApplyClassSize",myApplyClassList.size());
			}
			return "stuCInfo";
		} catch (Exception e) {
			return "sessionIsNull";
		}
	}
	@RequestMapping("profCInfo")
	public String profCInfo(HttpServletRequest request, Pre_C_Info pre_C_Info, Model model) {
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority != 2) {
				return "wrongPath";
			}
			C_Info cNums = cis.cNums(pre_C_Info); // 수업여부체크, 페이지네이션용
			if(cNums.getC_num() > 0) {
				pre_C_Info.setC_num(cNums.getC_num()); // 현재cnum (0일 경우 maxCnum값) 다시 넣어줌
				List<C_Info> classStudentInfoList = cis.classStudentInfoList(pre_C_Info);
				Pre_C_Info getMyClassInfo = cis.getMyClassInfo(pre_C_Info); 
				int csilSize = classStudentInfoList.size();
				List<C_Info> myClassInfoList = cis.myClassInfoList(pre_C_Info);
				
				model.addAttribute("csilSize",csilSize);
				model.addAttribute("cNums",cNums);
				model.addAttribute("preClassInfo", getMyClassInfo);
				model.addAttribute("classInfo", classStudentInfoList);
				model.addAttribute("myClassInfoList", myClassInfoList);
			} else { // 수업정보 없는경우
				model.addAttribute("cNums",cNums);
			}
			return "profCInfo";
		} catch (Exception e) {
			return "sessionIsNull";
		}
	}
	@RequestMapping("scoreUpdate")
	@ResponseBody
	public C_Info scoreUpdate(C_Info c_Info) {
		System.out.println("scoreUpdate c_Info :::: "+c_Info);
		C_Info scoreUpdate = cis.scoreUpdate(c_Info);
		
		return scoreUpdate;
	}
}
