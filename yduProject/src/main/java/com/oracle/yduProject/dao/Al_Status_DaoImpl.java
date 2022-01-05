package com.oracle.yduProject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Stu_Info;

@Repository
public class Al_Status_DaoImpl implements Al_Status_Dao {
	@Autowired
	private SqlSession session;

	//@SuppressWarnings("unused") <- 이건 언제한거지
	@Override
	public int applyClass(Al_Status al_Status) {
		int applyClass = 0;
		try {
			List<Integer> myApplyDayChk = session.selectList("myApplyDayChk", al_Status);
			System.out.println("myApplyDayChk list :::: "+myApplyDayChk);
			if(myApplyDayChk.size() > 0) {
				for(int c_num : myApplyDayChk) {
					Al_Status timeChk = new Al_Status();
					timeChk.setC_e_time(al_Status.getC_e_time());
					timeChk.setC_co_time(al_Status.getC_co_time());
					timeChk.setC_num(c_num);
					int myApplyTimeChk = session.selectOne("myApplyTimeChk", timeChk);
					if(myApplyTimeChk > 0) {
						applyClass = 5;
						return applyClass;
					}
				}
			}
			// db에서 먼저 값 가져온 뒤, 값이 0이면 insert, 1이면 update로 해줘야함 int로 값가져오고, if문으로
			Al_Status applyChk = session.selectOne("applyChk", al_Status); // 값이 없는 int형같은 경우 dto로 받아서 null체크 해야함
			System.out.println("applyChk ::: "+applyChk);
			if(applyChk == null) {
				applyClass = session.insert("applyInsertClass", al_Status);
			} else if(applyChk.getA_status() == 1) {
				applyClass = session.update("applyUpdateClass",al_Status);
			}
			if(applyClass > 0) {
				List<Integer> todayApplyChk = session.selectList("todayApplyChk", al_Status.getStu_id());
				System.out.println("todayApplyChk :::: "+todayApplyChk);
				List<Integer> todayAttendChk = session.selectList("todayAttendChk", al_Status.getStu_id());
				System.out.println("todayAttendChk :::: "+todayAttendChk);
				todayApplyChk.removeAll(todayAttendChk);
				System.out.println("after remove todayApplyChk :::: "+todayApplyChk);
				if(todayApplyChk.size() > 0) {
					C_Stu_Info c_Stu_Info = new C_Stu_Info();
					c_Stu_Info.setStu_id(al_Status.getStu_id());
					for(int i=0; i<todayApplyChk.size(); i++) {
						System.out.println("todayAttendChk.get(i) ::: " + todayApplyChk.get(i));
						c_Stu_Info.setC_num(todayApplyChk.get(i));
						int createChk = session.insert("createCStuInfo", c_Stu_Info);
						if(createChk > 0 ) {
							applyClass = 4;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applyClass;
	}

	@Override
	public int applyCancel(Al_Status al_Status) {
		int applyCancel = 0;
		try {
			int myCStuInfoChk = session.selectOne("myCStuInfoChk", al_Status);
			System.out.println("myCStuInfoChk :::: "+myCStuInfoChk);
			if(myCStuInfoChk > 0) {
				session.delete("myCStuInfoDelete", al_Status);
			}
			applyCancel = session.update("applyCancel", al_Status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applyCancel;
	}

	@Override
	public int classWaiver(Al_Status al_Status) {
		int classWaiver = 0;
		try {
			classWaiver = session.update("classWaiver", al_Status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classWaiver;
	}

	@Override
	public Al_Status updateAstatus(Al_Status al_Status) {
		Al_Status updateAstatus = new Al_Status();
		try {
			int updateAstatusChk = session.update("updateAstatus", al_Status);
			if(updateAstatusChk > 0) {
				updateAstatus.setResultMsg(al_Status.getStu_id()+"님의 수강상태가 정상적으로 변경되었습니다.");
			} else {
				updateAstatus.setResultCode(1);
				updateAstatus.setResultMsg("데이터 처리에 오류가 발생하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateAstatus;
	}
}
