package com.oracle.yduProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.yduProject.dao.C_STU_Info_Dao;
import com.oracle.yduProject.dao.Pre_C_Info_Dao;
import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.util.StringUtil;

@Service
public class C_Stu_Info_ServiceImpl implements C_Stu_Info_Service {
	@Autowired
	private C_STU_Info_Dao csid;
	@Autowired
	private Pre_C_Info_Dao pcid;

	@Override
	public C_Stu_Info cStuInfo(Al_Status al_Status) {
		return csid.cStuInfo(al_Status);
	}

	@Override
	public C_Stu_Info enterTime(C_Stu_Info c_Stu_Info) {
		if(Integer.parseInt(c_Stu_Info.getHour()) >= 10) {
			c_Stu_Info.setE_time(c_Stu_Info.getHour()+c_Stu_Info.getMin());
		} else {
			c_Stu_Info.setE_time("0"+c_Stu_Info.getHour()+c_Stu_Info.getMin());
		}
		C_Stu_Info enterTime = csid.enterTime(c_Stu_Info);
		return enterTime;
	}

	@Override
	public C_Stu_Info checkOutTime(C_Stu_Info c_Stu_Info) {
		C_Stu_Info checkOutTime = csid.todayMyTime(c_Stu_Info);
		System.out.println("after checkOutTime :::: "+checkOutTime);
		if(StringUtil.isNullOrEmpty(checkOutTime.getResultMsg())) {
			int my_co_hour = Integer.parseInt(c_Stu_Info.getHour()); // 퇴실체크 시
			int my_co_min = Integer.parseInt(c_Stu_Info.getMin()); // 퇴실체크 분
			// 퇴실시간 값 먼저 coTime에 셋팅
			if(my_co_hour >= 10) {
				c_Stu_Info.setCo_time((c_Stu_Info.getHour()+c_Stu_Info.getMin()));
			} else {
				c_Stu_Info.setCo_time("0"+c_Stu_Info.getHour()+c_Stu_Info.getMin());
			}
			int my_e_time = Integer.parseInt(checkOutTime.getE_time().substring(0,2)) * 60 + 
					Integer.parseInt(checkOutTime.getE_time().substring(2,4)); // 입실체크 분으로 환산
			System.out.println("my_e_time :::: "+ my_e_time);
			int my_co_time = my_co_hour * 60 + my_co_min; // 퇴실체크 분으로 환산
			System.out.println("my_co_time :::: "+ my_co_time);
			
			Pre_C_Info myClassTime = pcid.myClassTime(c_Stu_Info); // 수업시간 받아옴
			int c_e_time = Integer.parseInt(myClassTime.getC_e_time())*60; // 수업 시작 시
			System.out.println("c_e_time :::: "+c_e_time);
			int c_co_time = Integer.parseInt(myClassTime.getC_co_time())*60; // 수업 종료 시
			System.out.println("c_co_time :::: "+c_co_time);
			int classTime = c_co_time-c_e_time; // 참여해야하는 수업시간 값
			System.out.println("classTime :::: "+ classTime);
			if(my_e_time < c_e_time) { // 입실시간보다 일찍 체크하면 입실시간 값으로 조정
				my_e_time = c_e_time;
			}
			if(my_co_time > c_co_time) { // 퇴실시간보다 늦게 체크하면 퇴실시간 값으로 조정
				my_co_time = c_co_time;
			}
			int myAttendanceTime = my_co_time-my_e_time; // 조정 이후 참여시간(실제 수업참여시간)
			System.out.println("myAttendanceTime :::: "+ myAttendanceTime);
			// 여기서부터 출결상태 반영
			if(classTime/2 > myAttendanceTime) {
				c_Stu_Info.setAttendstatus("absent");
			} else if(my_e_time > c_e_time && my_co_time < c_co_time) {
				c_Stu_Info.setAttendstatus("lateearly");
			} else if(my_e_time > c_e_time) {
				c_Stu_Info.setAttendstatus("late");
			} else if(my_co_time < c_co_time) {
				c_Stu_Info.setAttendstatus("early");
			} else {
				c_Stu_Info.setAttendstatus("attend");
			}
			checkOutTime = csid.checkOutTime(c_Stu_Info);
			System.out.println(checkOutTime);
			System.out.println(c_Stu_Info);
			
			return checkOutTime;
		} else {
			return checkOutTime;
		}
	}

	@Override
	public List<C_Stu_Info> myCStuInfo(C_Stu_Info c_Stu_Info) {
		return csid.myCStuInfo(c_Stu_Info);
	}

	@Override
	public Pre_C_Info applyClassInfo(C_Stu_Info c_Stu_Info) {
		return csid.applyClassInfo(c_Stu_Info);
	}

}
