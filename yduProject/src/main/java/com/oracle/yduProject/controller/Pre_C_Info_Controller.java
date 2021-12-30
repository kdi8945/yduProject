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
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Pre_C_Info_RVO;
import com.oracle.yduProject.service.C_Stu_Info_Service;
import com.oracle.yduProject.service.Paging;
import com.oracle.yduProject.service.Pre_C_Info_Service;
import com.oracle.yduProject.util.StringUtil;

@Controller
public class Pre_C_Info_Controller {
	@Autowired
	private Pre_C_Info_Service pcis;
	@Autowired
	private C_Stu_Info_Service csis;
	
	@RequestMapping("classList")
	public String classList(HttpServletRequest request, String currentPage, Model model) {
		String str = null;
		System.out.println("classList Controller start");
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			System.out.println("classList mem_status ::::" + mem_status);
			System.out.println("classList autority ::::" + autority);
			int total = pcis.classTot();
			Paging page = null;
			if(mem_status==1) {
				Pre_C_Info pre_C_Info = new Pre_C_Info();
				page = new Paging(total, currentPage);
				pre_C_Info.setStart(page.getStart());
				pre_C_Info.setEnd(page.getEnd());
				if(autority==2) {
					pre_C_Info.setPro_id((String)session.getAttribute("sessionId"));
				}
				List<Pre_C_Info> classList = pcis.classList(pre_C_Info);
				System.out.println("classList :::: "+classList.toString());
				model.addAttribute("classListSize", classList.size());
				model.addAttribute("classList", classList);
				model.addAttribute("page", page);
				str= "classList";
			
			}
		} catch(Exception e) {
			str= "sessionIsNull";
			System.out.println("세션값 없음");
		}
		return str;
	}
	@RequestMapping("createClassForm")
	public String createClassForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			return "createClassForm";
		} catch(Exception e) {
			System.out.println("세션값 없음");
			return "sessionIsNull";
		}
	}
	@RequestMapping("createClass")
	@ResponseBody
	public Pre_C_Info_RVO createClass(Pre_C_Info pre_C_Info) {
		System.out.println("pre_C_Info.toString()::::"+pre_C_Info.toString());
		Pre_C_Info_RVO rVO = pcis. createClass(pre_C_Info);
		System.out.println("pre_C_Info.toString()::::"+pre_C_Info);
		System.out.println("Pre_C_Info rVO :::: " + rVO);
		return rVO;
	}
	@RequestMapping("classContent")
	public String classContent(HttpServletRequest request, Al_Status al_Status, Model model) {
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			System.out.println("c_num ::::"+al_Status.getC_num());
			if(al_Status.getC_num() == 0) {
				return "wrongPath";
			}
			// 신청한 학생정보 구해오기
			System.out.println("al_Status id :::: "+al_Status.getStu_id());
			if(al_Status.getStu_id() != null) {
				int myRateChk = pcis.myRateChk(al_Status);
				// 평가 작성한거 있는지 체크 -1이면 수업종료안함, 0이면 작성한거 없음, 1이면 작성한거 있음 
				System.out.println("myRateChk :::: "+myRateChk);
				model.addAttribute("myRateChk", myRateChk);
				
				Al_Status applyStudent = pcis.applyStudent(al_Status);
				model.addAttribute("applyStudent", applyStudent);
				System.out.println("applyStudent ::: " + applyStudent);
				if(applyStudent != null && applyStudent.getA_status() == 2) {
					C_Stu_Info cStuInfo = csis.cStuInfo(al_Status);
					System.out.println("null포인트 직전 cStuInfo ::: "+cStuInfo);
					if(cStuInfo == null) {
						cStuInfo = new C_Stu_Info();
					} else if (!StringUtil.isNullOrEmpty(cStuInfo.getE_time())) {
						String e_time = cStuInfo.getE_time();
						System.out.println(e_time);
						String eHour = e_time.substring(0,2);
						String eMin = e_time.substring(2,4);
						model.addAttribute("eHour", eHour);
						model.addAttribute("eMin", eMin);
						if(!StringUtil.isNullOrEmpty(cStuInfo.getCo_time())) {
							model.addAttribute("coHour", cStuInfo.getCo_time().substring(0,2));
							model.addAttribute("coMin", cStuInfo.getCo_time().substring(2,4));
							String attendstatus = cStuInfo.getAttendstatus();
							if(attendstatus.equals("absent")) {
								attendstatus = "결석";
							} else if(attendstatus.equals("lateearly")) {
								attendstatus = "지각&조퇴";
							} else if(attendstatus.equals("late")) {
								attendstatus = "지각";
							} else if(attendstatus.equals("early")) {
								attendstatus = "조퇴";
							} else if(attendstatus.equals("attend")) {
								attendstatus = "출석";
							}
							model.addAttribute("attendstatus", attendstatus);
						}
					}
					System.out.println("cStuInfo ::: " + cStuInfo);
					model.addAttribute("cStuInfo", cStuInfo);
				}
			}
			
			// 신청한 학생수 구해오기
			int applyStudentCnt = pcis.applyStudentCnt(al_Status.getC_num());
			System.out.println("applyStudentCnt :::: "+applyStudentCnt);
			// 해당 글 정보 구해오기
			Pre_C_Info classContent = pcis.classContent(al_Status.getC_num());
			System.out.println("classContent :::: "+classContent.toString());
			model.addAttribute("applyStudentCnt", applyStudentCnt);
			model.addAttribute("classContent", classContent);
			return "classContent";
		} catch (Exception e) {
			return "sessionIsNull";
		}
	}
	@RequestMapping("classSet")
	@ResponseBody
	public Pre_C_Info_RVO classSet(HttpServletRequest request, Pre_C_Info pre_C_Info) { //throws Exception{
		
//		String id = (String) request.getSession().getAttribute("id");
//		if(StringUtil.isNullOrEmpty(id)) {
//			throw new Exception("세숀이 없는데요");
//		}
		
		System.out.println("classSet pre_C_Info ::: " + pre_C_Info);
		int set = Integer.parseInt(request.getParameter("set"));
		System.out.println("classSet set ::: " + set );
		Pre_C_Info_RVO rVO = pcis.classSet(pre_C_Info, set);
		return rVO;
	}
	@RequestMapping("classUpdateForm")
	public String classUpdateForm(HttpServletRequest request, Pre_C_Info pre_C_Info, Model model) {
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			Pre_C_Info classContent = pcis.classContent(pre_C_Info.getC_num());
			model.addAttribute("classContent", classContent);
			return "classUpdateForm";
		} catch (Exception e) {
			return "sessionIsNull";
		}
	}
	@RequestMapping("classUpdate")
	@ResponseBody
	public Pre_C_Info_RVO classUpdate(Pre_C_Info pre_C_Info) {
		System.out.println("classUpdate pre_C_Info :::: " + pre_C_Info);
		Pre_C_Info_RVO rVO = pcis.classUpdate(pre_C_Info);
		System.out.println("classUpdate rVO ::: "+ rVO);
		return rVO;
	}
	@RequestMapping("classDelete")
	@ResponseBody
	public String classDelete(Pre_C_Info pre_C_Info) {
		String str = pcis.classDelete(pre_C_Info);
		return str;
	}
	@RequestMapping("classFinish")
	@ResponseBody
	public String classFinish(Pre_C_Info pre_C_Info) {
		String str = pcis.classFinish(pre_C_Info);
		return str;
	}
	@RequestMapping("selectClassList")
	@ResponseBody
	public List<Pre_C_Info> selectClassList(Pre_C_Info pre_C_Info, Model model) {
		List<Pre_C_Info> selectClassList = pcis.selectClassList(pre_C_Info);
		
		System.out.println("selectClassList selectClassList ::: " + selectClassList);
		return selectClassList;
		
	}
	@RequestMapping("myCreateClassList")
	public String myCreateClassList(HttpServletRequest request, Pre_C_Info pre_C_Info, String currentPage, Model model) {
		String str = null;
		System.out.println("classList Controller start");
		HttpSession session = request.getSession();
		try {
			int mem_status = (int) session.getAttribute("sessionMem_status");
			int autority = (int) session.getAttribute("sessionAutority");
			String id = (String) session.getAttribute("sessionId");
			if(autority != 2 || !id.equals(pre_C_Info.getPro_id())) {
				str="wrongPath";
			} else {
				int total = pcis.myClassTot(pre_C_Info);
				Paging page = new Paging(total, currentPage);
				pre_C_Info.setStart(page.getStart());
				pre_C_Info.setEnd(page.getEnd());
				List<Pre_C_Info> myCreateClassList = pcis.myCreateClassList(pre_C_Info);
				System.out.println("myClassList :::: "+myCreateClassList);
				model.addAttribute("myClassListSize", myCreateClassList.size());
				model.addAttribute("myClassList", myCreateClassList);
				model.addAttribute("c_status", pre_C_Info.getC_status());
				model.addAttribute("page", page);
				str= "myCreateClassList";
			}
		} catch(Exception e) {
			str= "sessionIsNull";
			System.out.println("세션값 없음");
		}
		return str;
	}
	@RequestMapping("searchClass")
	@ResponseBody
	public List<Pre_C_Info> searchClass(Pre_C_Info pre_C_Info){
		List<Pre_C_Info> searchClass = pcis.searchClass(pre_C_Info);
		return searchClass;
	}
	@RequestMapping("searchMyClass")
	@ResponseBody
	public List<Pre_C_Info> searchMyClass(Pre_C_Info pre_C_Info){
		List<Pre_C_Info> searchMyClass = pcis.searchMyClass(pre_C_Info);
		return searchMyClass;
	}
}
