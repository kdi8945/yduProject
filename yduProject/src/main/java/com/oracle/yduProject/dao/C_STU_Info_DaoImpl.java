package com.oracle.yduProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.util.StringUtil;

@Repository
public class C_STU_Info_DaoImpl implements C_STU_Info_Dao {
	@Autowired
	private SqlSession session;

	@Override
	public C_Stu_Info cStuInfo(Al_Status al_Status) {
		C_Stu_Info cStuInfo = new C_Stu_Info();
		try {
			cStuInfo = session.selectOne("cStuInfo", al_Status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cStuInfo;
	}

	@Override
	public C_Stu_Info enterTime(C_Stu_Info c_Stu_Info) {
		C_Stu_Info enterTime = null;
		try {
			System.out.println("enterTime dao c_Stu_Info :::: "+c_Stu_Info);
			int enterChk = session.update("enterTime", c_Stu_Info);
			System.out.println("enterChk :::: "+enterChk);
			if(enterChk > 0) {
				enterTime = new C_Stu_Info();
				enterTime.setResultMsg("입실체크 되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			int todayChk = session.selectOne("todayChk", c_Stu_Info);
			if(todayChk == 0) {
				enterTime.setResultMsg("오늘의 출결데이터가 없습니다.");
			} else {
				enterTime.setResultMsg("데이터 처리에 오류가 발생하였습니다.");
			}
		}
		return enterTime;
	}

	@Override
	public C_Stu_Info todayMyTime(C_Stu_Info c_Stu_Info) {
		C_Stu_Info checkOutTime = new C_Stu_Info();
		try {
			String myEnterTime = session.selectOne("myEnterTime", c_Stu_Info);
			if(StringUtil.isNullOrEmpty(myEnterTime)) {
				checkOutTime.setResultMsg("입실정보가 없습니다.");
			} else {
				checkOutTime.setE_time(myEnterTime);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkOutTime;
	}

	@Override
	public C_Stu_Info checkOutTime(C_Stu_Info c_Stu_Info) {
		C_Stu_Info checkOutTime = new C_Stu_Info();
		try {
			int attendStatusChk = session.selectOne("attendStatusChk", c_Stu_Info);
			int stuUpdate = session.update("checkOutTime", c_Stu_Info);
			if(stuUpdate > 0) {
				if(attendStatusChk > 0) {
					checkOutTime.setResultMsg("출결정보가 수정되었습니다.");
				} else {
					checkOutTime.setResultMsg("출결정보가 등록되었습니다.");
				}
			} else {
				checkOutTime.setResultMsg("출결정보 등록 및 수정에 실패하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkOutTime;
	}

	@Override
	public List<C_Stu_Info> myCStuInfo(C_Stu_Info c_Stu_Info) {
		List<C_Stu_Info> myCStuInfoList = new ArrayList<C_Stu_Info>();
		C_Stu_Info myCStuInfo = new C_Stu_Info();
		try {
			List<Integer> myCSIList = session.selectList("myCSIList", c_Stu_Info);
			for(int c_stu_num : myCSIList) {
				c_Stu_Info.setC_stu_num(c_stu_num);
				myCStuInfo = session.selectOne("myCStuInfo", c_Stu_Info);
				if(!StringUtil.isNullOrEmpty(myCStuInfo.getE_time())) {
					myCStuInfo.setEhour(myCStuInfo.getE_time().substring(0,2));
					myCStuInfo.setEmin(myCStuInfo.getE_time().substring(2,4));
				} else {
					myCStuInfo.setEhour("00");
					myCStuInfo.setEmin("00");
				}
				if(!StringUtil.isNullOrEmpty(myCStuInfo.getCo_time())) {
					myCStuInfo.setCohour(myCStuInfo.getCo_time().substring(0,2));
					myCStuInfo.setComin(myCStuInfo.getCo_time().substring(2,4));
				} else {
					myCStuInfo.setCohour("00");
					myCStuInfo.setComin("00");
				}
				myCStuInfoList.add(myCStuInfo);
			}
			System.out.println("myCStuInfoList :::: "+myCStuInfoList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myCStuInfoList;
	}

	@Override
	public Pre_C_Info applyClassInfo(C_Stu_Info c_Stu_Info) {
		Pre_C_Info applyClassInfo = new Pre_C_Info();
		try {
			applyClassInfo = session.selectOne("applyClassInfo", c_Stu_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applyClassInfo;
	}

}
