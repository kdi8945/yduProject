package com.oracle.yduProject.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Info;
import com.oracle.yduProject.model.Pre_C_Info;

@Repository
public class C_Info_DaoImpl implements C_Info_Dao {
	@Autowired
	private SqlSession session;

	@Override
	public C_Info cNums(Pre_C_Info pre_C_Info) {
		C_Info cNums = new C_Info();
		try {
			// 최초에 내 수업이 있는지 체크해야함
			int haveClassChk = session.selectOne("haveClassChk", pre_C_Info);
			if(haveClassChk > 0) { // 수업이 있는경우
				System.out.println("pre c_num :::: "+pre_C_Info.getC_num());
				if(pre_C_Info.getC_num()==0) { // c_num이 있는지 체크하고 없으면 max값 가져와야함
					pre_C_Info.setC_num(session.selectOne("maxCnum", pre_C_Info));
				}
				System.out.println("after c_num :::: "+pre_C_Info.getC_num());
				int maxAndMinChk = session.selectOne("maxAndMinChk", pre_C_Info); // c_num이 max 또는 min인지 체크
				System.out.println("maxAndMinChk ::: "+maxAndMinChk);
				cNums.setC_num(pre_C_Info.getC_num()); // 현재 c_num값 셋팅
				List<Integer> cNumList = session.selectList("cNumList", pre_C_Info); // c_num 리스트 구함
				System.out.println("cNumList :::: "+cNumList);
				int listChk = 0;
				for(int i=0; i<cNumList.size(); i++) {
					if(cNumList.get(i) == cNums.getC_num()) {
						listChk = i;
						break;
					}
				}
				// 현재 c_num 기준 이전, 다음 row가 있는지 체크하고 셋팅
				if(maxAndMinChk == 3) { // c_num이 maxAndMin // 체크완료
					cNums.setHigh_c_num(0);
					cNums.setLow_c_num(0);
				} else if(maxAndMinChk == 2) { // c_num이 max // 체크완료
					cNums.setHigh_c_num(0);
					cNums.setLow_c_num(cNumList.get(listChk+1));
				} else if(maxAndMinChk == 1) { // c_num이 min // 체크완료
					cNums.setHigh_c_num(cNumList.get(listChk-1));
					cNums.setLow_c_num(0);
				} else { // c_num이 max도 min도 아님 // 체크완료
					cNums.setHigh_c_num(cNumList.get(listChk-1));
					cNums.setLow_c_num(cNumList.get(listChk+1));
				}
				System.out.println("high_c_num :::: "+cNums.getHigh_c_num());
				System.out.println("low_c_num :::: "+cNums.getLow_c_num());
			} else { // 수업이 없는경우
				cNums.setC_num(0);
				System.out.println("상태2인 수업없음 c_num은 ::::"+cNums.getC_num());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cNums;
	}

	@Override
	public List<C_Info> classStudentInfoList(Pre_C_Info pre_C_Info) {
		List<C_Info> classStudentInfoList = new ArrayList<C_Info>();
		C_Info classStudentInfo = new C_Info();
		try {
			// 해당 글의 학생정보 있는지 체크후 학생 이름순으로 c_i_num, stu_id, c_num을 가져옴
			List<C_Info> getCINum = session.selectList("getCINum", pre_C_Info);
			System.out.println("getCINum :::: "+getCINum);
			for(C_Info x : getCINum) {
				System.out.println("--getCINum 출결정보 조회--");
				int totalClassDay = session.selectOne("totalClassDay", pre_C_Info); // 해당수업 전체수업일수
				System.out.println("totalClassDay :::: "+totalClassDay);
				int absentCnt = session.selectOne("absentCnt", x); // 결석 수
				System.out.println(x.getStu_id()+"의 결석 수  :::: "+absentCnt);
				int lateearlyCnt = session.selectOne("lateearlyCnt", x); // 지각&조퇴수
				System.out.println(x.getStu_id()+"의 지각 & 조퇴 수 :::: "+lateearlyCnt);
				int lateCnt = session.selectOne("lateCnt", x); // 지각수
				System.out.println(x.getStu_id()+"의 지각 수 :::: "+lateCnt);
				int earlyCnt = session.selectOne("earlyCnt", x); // 조퇴수
				System.out.println(x.getStu_id()+"의 조퇴 수 :::: "+earlyCnt);
				int attendCnt = session.selectOne("attendCnt", x); // 출석수
				System.out.println(x.getStu_id()+"의 정상출석 수 :::: "+attendCnt);
				// 올림한 출석수(출석일 노출용)
				int attendClassDay = (int) Math.ceil((lateearlyCnt * 0.5) + (lateCnt * 0.75) + (earlyCnt * 0.75) + attendCnt);
				System.out.println("출결반영 실제 출석수 :::: "+attendClassDay);
				// 출석율 % 노출용(둘째 자리에서 반올림)
				double atdPercent = (double)attendClassDay/(double)totalClassDay * 100;
				double atdPercentResult = Double.parseDouble(String.format("%.1f", atdPercent));
				System.out.println("***************");
				System.out.println("atdPercent ::: "+atdPercent);
				System.out.println("출석율 ::: "+atdPercentResult);
				double a_score = Double.parseDouble(String.format("%.1f", atdPercentResult*0.2));
				System.out.println("출석점수 ::: "+a_score);
				classStudentInfo = session.selectOne("getStudentInfo",x);
				System.out.println("---------------중간 확인------------");
				System.out.println(classStudentInfo.getName()+"의 정보"+classStudentInfo);
				System.out.println("---------------중간 확인 끝------------");
				classStudentInfo.setTotalClassDay(totalClassDay);
				classStudentInfo.setAttendClassDay(attendClassDay);
				classStudentInfo.setAttendPercent(atdPercentResult);
				classStudentInfo.setA_score(a_score);
				session.update("inAScore", classStudentInfo);
				double grade =  classStudentInfo.getM_score() + classStudentInfo.getF_score() + classStudentInfo.getA_score();
				System.out.println("----- score -----");
				System.out.println(classStudentInfo.getM_score());
				System.out.println(classStudentInfo.getF_score());
				System.out.println(classStudentInfo.getA_score());
				System.out.println(classStudentInfo.getName()+"의 학점 :::: "+grade);
				if(grade >= 90) {
					classStudentInfo.setGrade("A");
				} else if(grade < 90 && grade >= 80) {
					classStudentInfo.setGrade("B");
				} else if(grade < 80 && grade >= 70) {
					classStudentInfo.setGrade("C");
				} else if(grade < 70 && grade >= 60) {
					classStudentInfo.setGrade("D");
				} else {
					classStudentInfo.setGrade("F");
				}
				classStudentInfo.setA_status(session.selectOne("getAStatus", x));
				classStudentInfoList.add(classStudentInfo);
			}
			System.out.println("---classStudentInfoList---");
			System.out.println(classStudentInfoList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classStudentInfoList;
	}

	@Override
	public Pre_C_Info getMyClassInfo(Pre_C_Info pre_C_Info) {
		Pre_C_Info getMyClassInfo = null;
		try {
			getMyClassInfo = session.selectOne("getMyClassInfo", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getMyClassInfo;
	}

	@Override
	public C_Info scoreUpdate(C_Info c_Info) {
		C_Info scoreUpdate = new C_Info();
		int chk = 0;
		try {
			if(c_Info.getUpdateChk().equals("m")) {
				chk = session.update("mScoreUpdate", c_Info);
				if(chk > 0) {
					scoreUpdate.setUpdateChk("중간고사점수가 입력되었습니다.");
				}
			} else if(c_Info.getUpdateChk().equals("f")) {
				chk = session.update("fScoreUpdate", c_Info);
				scoreUpdate.setUpdateChk("기말고사점수가 입력되었습니다.");				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return scoreUpdate;
	}

	@Override
	public List<C_Info> myApplyClassList(Al_Status al_Status) {
		List<C_Info> myApplyClassList = new ArrayList<C_Info>();
		C_Info myApplyClassInfo = new C_Info();
		Pre_C_Info pre_C_Info = new Pre_C_Info();
		try {
			List<Al_Status> myApplyClassChk = session.selectList("myApplyClassChk", al_Status); // 내 상태별 수강중인과목
			System.out.println("불러오려는 글 번호 리스트 :::: "+myApplyClassChk);
			if(myApplyClassChk.size() > 0) {
				for(Al_Status n : myApplyClassChk) {
					System.out.println(n.getStu_id()+"의 "+n.getC_num()+"글 출결정보 조회");
					int totalClassDay = session.selectOne("myTotalClassDay", n); // 해당수업 전체수업일
					System.out.println("totalClassDay :::: "+totalClassDay);
					int absentCnt = session.selectOne("myAbsentCnt", n); // 결석 수
					System.out.println(n.getStu_id()+"의 결석 수  :::: "+absentCnt);
					int lateearlyCnt = session.selectOne("myLateearlyCnt", n); // 지각&조퇴수
					System.out.println(n.getStu_id()+"의 지각 & 조퇴 수 :::: "+lateearlyCnt);
					int lateCnt = session.selectOne("myLateCnt", n); // 지각수
					System.out.println(n.getStu_id()+"의 지각 수 :::: "+lateCnt);
					int earlyCnt = session.selectOne("myEarlyCnt", n); // 조퇴수
					System.out.println(n.getStu_id()+"의 조퇴 수 :::: "+earlyCnt);
					int attendCnt = session.selectOne("myAttendCnt", n); // 출석수
					System.out.println(n.getStu_id()+"의 정상출석 수 :::: "+attendCnt);
					// 올림한 출석수(출석일 노출용)
					int attendClassDay = (int) Math.ceil((lateearlyCnt * 0.5) + (lateCnt * 0.75) + (earlyCnt * 0.75) + attendCnt);
					System.out.println("출결반영 실제 출석수 :::: "+attendClassDay);
					// 출석율 % 노출용(둘째 자리에서 반올림)
					double atdPercent = (double)attendClassDay / (double)totalClassDay * 100;
					double atdPercentResult = Double.parseDouble(String.format("%.1f", atdPercent));
					System.out.println("출석율 ::: "+atdPercentResult);
					double a_score = Double.parseDouble(String.format("%.1f", atdPercentResult*0.2));
					System.out.println("출석점수 ::: "+a_score);
					myApplyClassInfo = session.selectOne("myApplyClassInfo", n);
					System.out.println("---------------중간 확인------------");
					System.out.println(myApplyClassInfo.getStu_id()+"의 정보"+myApplyClassInfo);
					System.out.println("---------------중간 확인 끝------------");
					
					myApplyClassInfo.setTotalClassDay(totalClassDay);
					myApplyClassInfo.setAttendClassDay(attendClassDay);
					myApplyClassInfo.setAttendPercent(atdPercentResult);
					myApplyClassInfo.setA_score(a_score);
					session.update("updateMyAScore", myApplyClassInfo);
					int grade =  myApplyClassInfo.getM_score() + myApplyClassInfo.getF_score() + (int) myApplyClassInfo.getA_score();
					System.out.println("----- score -----");
					System.out.println(myApplyClassInfo.getM_score());
					System.out.println(myApplyClassInfo.getF_score());
					System.out.println(myApplyClassInfo.getA_score());
					System.out.println(myApplyClassInfo.getStu_id()+"의 "+myApplyClassInfo.getC_num()+"번과목 학점 :::: "+grade);
					if(grade >= 90) {
						myApplyClassInfo.setGrade("A");
					} else if(grade < 90 && grade >= 80) {
						myApplyClassInfo.setGrade("B");
					} else if(grade < 80 && grade >= 70) {
						myApplyClassInfo.setGrade("C");
					} else if(grade < 70 && grade >= 60) {
						myApplyClassInfo.setGrade("D");
					} else {
						myApplyClassInfo.setGrade("F");
					}
					myApplyClassInfo.setRateChk(session.selectOne("rateChk", n));
					myApplyClassInfo.setC_status(session.selectOne("getCStatus", n));
					myApplyClassList.add(myApplyClassInfo);
				}
				System.out.println("---myApplyClassList---");
				System.out.println(myApplyClassList);
					
				}
			} catch (Exception e) {
			e.printStackTrace();
		}
		return myApplyClassList;
	}

	@Override
	public List<C_Info> myClassInfoList(Pre_C_Info pre_C_Info) {
		List<C_Info> myClassInfoList = new ArrayList<C_Info>();
		try {
			myClassInfoList = session.selectList("myClassInfoList", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myClassInfoList;
	}


}
