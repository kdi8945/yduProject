package com.oracle.yduProject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.yduProject.model.C_Name_List_RVO;
import com.oracle.yduProject.model.MemberInfo;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Terms;
import com.oracle.yduProject.service.MemberInfoService;
import com.oracle.yduProject.service.Paging;
import com.oracle.yduProject.util.StringUtil;

@Controller
public class MemberInfoController {
	@Autowired
	private MemberInfoService mis;
	
	@RequestMapping("logout")
	public String testLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionId");
		if(StringUtil.isNullOrEmpty(id)) {
			return "sessionIsNull";
		} else {
			session.invalidate();
			return "logout";
		}
	}
	
	@RequestMapping("joinForm")
	public String joinForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		if(!StringUtil.isNullOrEmpty(id)) {
			return "wrongPath";
		} else {
			List<Terms> TermsList = mis.TermsList();
			model.addAttribute("TermsList",TermsList);
			return "joinForm";
		}
	}
	
	@RequestMapping("idConfirm")
	@ResponseBody
	public String idConfirm(String id) {
		String confirmResult = mis.confirmId(id);
		System.out.println("confirmResult :::: "+confirmResult);
		return confirmResult;
	}
	
	@RequestMapping("join")
	@ResponseBody
	public MemberInfo join(MemberInfo memberInfo) {
		System.out.println("memberInfo :::: "+memberInfo.toString());
		MemberInfo result = mis.join(memberInfo);
		return result;
	}
	@RequestMapping(value="login")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("sessionId");
		System.out.println("sessionId ::: "+sessionId);
		if(StringUtil.isNullOrEmpty(sessionId)) {
			return "login";
		} else {
			return "wrongPath";
		}
	}
	
	@PostMapping("loginChk")
	@ResponseBody
	public C_Name_List_RVO loginChk(HttpServletRequest request, MemberInfo memberInfo) {
		C_Name_List_RVO rVO = mis.loginChk(request, memberInfo);
		
		System.out.println("Controller rVO::::"+rVO);
		
		rVO.setErrorCode(0);
		rVO.setErrorMsg("정상적으로 처리되었습니다.");
		
		return rVO;
	}
	@RequestMapping("memberInfo")
	public String memberInfo(HttpServletRequest request, MemberInfo memberInfo, String currentPage, Model model) {
		String str = null;
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority != 3) {
				str = "wrongPath";
			}
			int total = mis.memberInfoTot();
			if(total == 0) {
				model.addAttribute("total", total);
			} else {
				Paging page = new Paging(total, currentPage);
				memberInfo.setStart(page.getStart());
				memberInfo.setEnd(page.getEnd());
				List<MemberInfo> memberInfoList = mis.memberInfoList(memberInfo);
				model.addAttribute("total", total);
				model.addAttribute("memberInfoList", memberInfoList);
				model.addAttribute("page", page);
			}
			str = "memberInfo";
		} catch (Exception e) {
			str= "sessionIsNull";
			System.out.println("세션값 없음");
		}
		return str;
	}
	@RequestMapping("widrawStudent")
	public String widrawStudent(HttpServletRequest request, MemberInfo memberInfo, Model model) {
		String str = null;
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority != 3) {
				str = "wrongPath";
			}
			int total = mis.widrawStudentTot(memberInfo);
			if(total == 0 ) {
				model.addAttribute("total", total);
			} else {
				List<Pre_C_Info> widrawStudentInfo = mis.widrawStudentInfo(memberInfo);
				model.addAttribute("total", total);
				model.addAttribute("widrawStudentInfo", widrawStudentInfo);
				model.addAttribute("id", memberInfo.getId());
			}
			str = "widrawStudent";
		} catch (Exception e) {
			str= "sessionIsNull";
		}
		return str;
	}
	@RequestMapping("widrawProfessor")
	public String widrawProfessor(HttpServletRequest request, MemberInfo memberInfo, Model model) {
		String str = null;
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority != 3) {
				str = "wrongPath";
			}
			int total = mis.professorTot(memberInfo);
			if(total == 0 ) {
				model.addAttribute("total", total);
			} else {
				List<Pre_C_Info> professorInfo = mis.professorInfo(memberInfo);
				model.addAttribute("total", total);
				model.addAttribute("widrawProfessorInfo", professorInfo);
				model.addAttribute("id", memberInfo.getId());
			}
			str="widrawProfessor";
		} catch (Exception e) {
			str= "sessionIsNull";
		}
		return str;
	}
	@RequestMapping("studentInfo")
	public String studentInfo(HttpServletRequest request, MemberInfo memberInfo, Model model) {
		String str = null;
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority != 3) {
				str = "wrongPath";
			}
			int total = mis.studentInfoTot(memberInfo);
			if(total == 0) {
				model.addAttribute("total", total);
			} else {
				List<Pre_C_Info> studentInfo = mis.studentInfo(memberInfo);
				model.addAttribute("total", total);
				model.addAttribute("studentInfo", studentInfo);
				model.addAttribute("id", memberInfo.getId());
			}
			str = "studentInfo";
		} catch (Exception e) {
			str= "sessionIsNull";
		}
		return str;
	}
	@RequestMapping("professorInfo")
	public String professorInfo(HttpServletRequest request, MemberInfo memberInfo, Model model) {
		String str = null;
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority != 3) {
				str = "wrongPath";
			}
			int total = mis.professorTot(memberInfo);
			if(total == 0 ) {
				model.addAttribute("total", total);
			} else {
				List<Pre_C_Info> professorInfo = mis.professorInfo(memberInfo);
				model.addAttribute("total", total);
				model.addAttribute("professorInfo", professorInfo);
				model.addAttribute("id", memberInfo.getId());
			}
			str="professorInfo";
		} catch (Exception e) {
			str = "sessionIsNull";
		}
		return str;
	}
	@RequestMapping("widrawChk")
	public String widrawChk(HttpServletRequest request) {
		String str = null;
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority == 3) {
				str = "wrongPath";
			} else {
				str = "widrawChk";
			}
		} catch (Exception e) {
			str = "sessionIsNull";
		}
		return str;
	}
	
	@RequestMapping("widrawPwChk")
	@ResponseBody
	public MemberInfo widrawChk(MemberInfo memberInfo) {
		MemberInfo widrawPwChk = mis.widrawPwChk(memberInfo);
		
		return widrawPwChk;
	}
	
	@RequestMapping("widrawMsg")
	public String widrawMsg(HttpServletRequest request) {
		String str = null;
		HttpSession session = request.getSession();
		try {
			int autority = (int) session.getAttribute("sessionAutority");
			if(autority == 3) {
				str = "wrongPath";
			} else {
				str = "widrawMsg";
			}
		} catch (Exception e) {
			str = "sessionIsNull";
		}
		return str;
	}
	@RequestMapping("widrawStuResult")
	@ResponseBody
	public MemberInfo widrawStuResult(HttpServletRequest request, MemberInfo memberInfo) {
		MemberInfo widrawStuResult = mis.widrawStuResult(memberInfo);
		HttpSession session = request.getSession();
		if(widrawStuResult.getResultCode() != 1) {
			session.invalidate();
		}
		return widrawStuResult;
	}
	@RequestMapping("widrawProResult")
	@ResponseBody
	public MemberInfo widrawProResult(HttpServletRequest request, MemberInfo memberInfo) {
		MemberInfo widrawProResult = mis.widrawProResult(memberInfo);
		HttpSession session = request.getSession();
		if(widrawProResult.getResultCode() != 1) {
			session.invalidate();
		}
		return widrawProResult;
	}
	@RequestMapping("selectView")
	@ResponseBody
	public List<MemberInfo> selectView(MemberInfo memberInfo){
		List<MemberInfo> selectView = mis.selectView(memberInfo);
		return selectView;
	}
	@RequestMapping("searchMember")
	@ResponseBody
	public List<MemberInfo> searchMember(MemberInfo memberInfo){
		List<MemberInfo> searchMember = mis.searchMember(memberInfo);
		return searchMember;
	}
	@RequestMapping("changeAutority")
	@ResponseBody
	public MemberInfo changeAutority(MemberInfo memberInfo) {
		MemberInfo changeAutority = mis.changeAutority(memberInfo);
		return changeAutority;
	}
	@RequestMapping("changeMemstatus")
	@ResponseBody
	public MemberInfo changeMemstatus(MemberInfo memberInfo) {
		MemberInfo changeMemstatus = mis.changeMemstatus(memberInfo);
		return changeMemstatus;
	}
}
