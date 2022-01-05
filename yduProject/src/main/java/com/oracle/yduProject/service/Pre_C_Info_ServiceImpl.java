package com.oracle.yduProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.yduProject.dao.C_Info_Dao;
import com.oracle.yduProject.dao.Pre_C_Info_Dao;
import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Pre_C_Info_RVO;

@Service
public class Pre_C_Info_ServiceImpl implements Pre_C_Info_Service {
	@Autowired
	private Pre_C_Info_Dao pcid;
	@Autowired
	private C_Info_Dao cid;

	@Override
	public Pre_C_Info_RVO createClass(Pre_C_Info pre_C_Info) {
		Pre_C_Info_RVO rVO = new Pre_C_Info_RVO();
		int createChk = pcid.createClass(pre_C_Info);
		System.out.println("createChk :::: "+createChk);
		if(createChk == 0) {
			rVO.setResultMsg("기존 수업일정과 중복됩니다.");
			rVO.setResultCode(0);
		} else if(createChk > 0){
			rVO.setResultMsg("수업이 정상적으로 개설되었습니다.");
			rVO.setResultCode(1);
		} else {
			rVO.setResultMsg("데이터 처리에 오류가 발생하였습니다.");
			rVO.setResultCode(2);
		}
		return rVO;
	}

	@Override
	public int classTot() {
		return pcid.classTot();
	}

	@Override
	public List<Pre_C_Info> classList(Pre_C_Info pre_C_Info) {
		return pcid.classList(pre_C_Info);
	}

	@Override
	public Pre_C_Info classContent(int c_num) {
		return pcid.classContent(c_num);
	}

	@Override
	public int applyStudentCnt(int c_num) {
		return pcid.applyStudentCnt(c_num);
	}

	@Override
	public Al_Status applyStudent(Al_Status al_Status) {
		return pcid.applyStudent(al_Status);
	}

	@Override
	public Pre_C_Info_RVO classSet(Pre_C_Info pre_C_Info, int set) {
		String str = null;
		Pre_C_Info_RVO rVO = new Pre_C_Info_RVO();
		if(set == 2) { // 수업확정
			int classSet = pcid.classFixed(pre_C_Info);
			if(classSet > 0) {
				rVO = pcid.createCInfo(pre_C_Info); // 확정 후 수업정보 데이터 생성
				str = "classFixedOk";
			} else {
				str = "classFixedError";
			}
		} else if(set == 4) { //수업취소
			int classSet = pcid.classClosed(pre_C_Info);
			if(classSet > 0) {
				str = "수업이 취소되었습니다.";
			} else {
				str = "수업 취소에 에러가 발생하였습니다.";
			}
		}
		rVO.setResultMsg(str);
		return rVO;
	}

	@Override
	public Pre_C_Info_RVO classUpdate(Pre_C_Info pre_C_Info) {
		Pre_C_Info_RVO rVO = new Pre_C_Info_RVO();
		String str = null;
		
		int classUpdate = pcid.classUpdate(pre_C_Info);
		System.out.println("classUpdate :::: "+classUpdate);
		if(classUpdate == 0) {
			str = "기존 수업일정과 중복됩니다.";
		} else if(classUpdate > 0){
			str = "수업이 정상적으로 수정되었습니다.";
			rVO.setSubResultMsg("y");
		} else {
			str = "데이터 처리에 오류가 발생하였습니다.";
		}
		rVO.setResultMsg(str);
		return rVO;
	}

	@Override
	public String classDelete(Pre_C_Info pre_C_Info) {
		String str = null;
		int classDelete = pcid.classDelete(pre_C_Info);
		if(classDelete > 0) {
			str = "classDeleteOk";
		} else {
			str = "classDeleteError";
		}
		return str;
	}

	@Override
	public String classFinish(Pre_C_Info pre_C_Info) {
		String str = null;
		int classFinish = pcid.classFinish(pre_C_Info);
		if(classFinish > 0) {
			str = "classFinishOk";
		} else {
			str = "classFinishError";
		}
		return str;
	}

	@Override
	public List<Pre_C_Info> selectClassList(Pre_C_Info pre_C_Info) {
		return pcid.selectClassList(pre_C_Info);
	}

	@Override
	public int myRateChk(Al_Status al_Status) {
		return pcid.myRateChk(al_Status);
	}

	@Override
	public List<Pre_C_Info> myCreateClassList(Pre_C_Info pre_C_Info) {
		return pcid.myCreateClassList(pre_C_Info);
	}

	@Override
	public int myClassTot(Pre_C_Info pre_C_Info) {
		return pcid.myClassTot(pre_C_Info);
	}

	@Override
	public List<Pre_C_Info> searchClass(Pre_C_Info pre_C_Info) {
		return pcid.searchClass(pre_C_Info);
	}

	@Override
	public List<Pre_C_Info> searchMyClass(Pre_C_Info pre_C_Info) {
		return pcid.searchMyClass(pre_C_Info);
	}

	@Override
	public Pre_C_Info updateCstatus(Pre_C_Info pre_C_Info) {
		return pcid.updateCstatus(pre_C_Info);
	}

	@Override
	public int myApplyTot(Pre_C_Info pre_C_Info) {
		return pcid.myApplyTot(pre_C_Info);
	}

	@Override
	public List<Pre_C_Info> myApplyList(Pre_C_Info pre_C_Info) {
		return pcid.myApplyList(pre_C_Info);
	}

	@Override
	public List<Pre_C_Info> searchMyApplyClass(Pre_C_Info pre_C_Info) {
		return pcid.searchMyApplyClass(pre_C_Info);
	}
}
