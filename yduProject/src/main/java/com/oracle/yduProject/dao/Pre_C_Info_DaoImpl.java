package com.oracle.yduProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Pre_C_Info_RVO;
import com.oracle.yduProject.util.StringUtil;

@Repository
public class Pre_C_Info_DaoImpl implements Pre_C_Info_Dao {
	@Autowired
	private SqlSession session;

	@Override
	public int createClass(Pre_C_Info pre_C_Info) {
		int createClassChk = -1;
		int timeChk = -1;
		try {
			// 겹치는 날짜 먼저 체크
			List<Integer> myLecList = session.selectList("myLecList",pre_C_Info);
			System.out.println("myLecList size :::: "+ myLecList.size());
			System.out.println("myLecList :::: "+myLecList);
			if(myLecList.size() > 0) { // 날짜 중복체크
				for(int x : myLecList) { // 중복된 c_num으로 시간체크
					pre_C_Info.setC_num(x);
					System.out.println("dao pre_C_Info :::: "+pre_C_Info);
					int myLecTimeList = session.selectOne("myLecTimeList", pre_C_Info);
					System.out.println(x+1+"번째 myLecTimeList :::: "+myLecTimeList);
					if(myLecTimeList > 0) {
						timeChk = 1;
						break;
					} else {
						timeChk = 0;
					}
				}
				System.out.println("timeChk :::: "+timeChk);
				if(timeChk > 0) { // 날짜, 시간 중복되면 createClassChk 0 리턴
					createClassChk = 0;
				} else {
					createClassChk = session.insert("createClass", pre_C_Info);
				}
			} else {
				createClassChk = session.insert("createClass", pre_C_Info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return createClassChk;
	}


	@Override
	public int classTot() {
		int classTot = 0;
		try {
			classTot = session.selectOne("classTot");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classTot;
	}

	@Override
	public List<Pre_C_Info> classList(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> classList = null;
		try {
			classList = session.selectList("classList", pre_C_Info);
			System.out.println("name있는 classList :::: "+classList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classList;
	}


	@Override
	public Pre_C_Info classContent(int c_num) {
		Pre_C_Info classContent = new Pre_C_Info();
		try {
			classContent = session.selectOne("classContent", c_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return classContent;
	}


	@Override
	public int applyStudentCnt(int c_num) {
		int applyStudentCnt = 0;
		try {
			applyStudentCnt = session.selectOne("applyStudentCnt", c_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applyStudentCnt;
	}


	@Override
	public Al_Status applyStudent(Al_Status al_Status) {
		Al_Status applyStudent = null;
		try {
			applyStudent = session.selectOne("applyStudent", al_Status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applyStudent;
	}


	@Override
	public int classFixed(Pre_C_Info pre_C_Info) {
		int classFixed = 0;
		try {
			classFixed = session.update("classFixed", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classFixed;
	}


	@Override
	public int classClosed(Pre_C_Info pre_C_Info) {
		int classClosed = 0;
		try {
			int classApplyChk = session.selectOne("classApplyChk", pre_C_Info.getC_num());
			if(classApplyChk > 0) {
				int cStuInfoChk = session.selectOne("cStuInfoChk", pre_C_Info.getC_num());
				if(cStuInfoChk > 0) {
					session.delete("cStuInfoDelete", pre_C_Info.getC_num());
				}
				session.delete("classApplyDelete", pre_C_Info.getC_num());
			}
			classClosed = session.update("classClosed", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classClosed;
	}


	@Override
	public int classUpdate(Pre_C_Info pre_C_Info) {
		int classUpdate = -1;
		int timeChk = -1;
		try {
			List<Integer> myLecList = session.selectList("myLecList",pre_C_Info);
			System.out.println("myLecList size :::: "+ myLecList.size());
			System.out.println("myLecList :::: "+myLecList);
			if(myLecList.size() > 0) {
				for(int x : myLecList) {
					pre_C_Info.setC_num(x);
					System.out.println("dao pre_C_Info :::: "+pre_C_Info);
					int myLecTimeList = session.selectOne("myLecTimeList", pre_C_Info);
					System.out.println(x+1+"번째 myLecTimeList :::: "+myLecTimeList);
					if(myLecTimeList > 0) {
						timeChk = 1;
						break;
					} else {
						timeChk = 0;
					}
				}
				System.out.println("timeChk :::: "+timeChk);
				if(timeChk > 0) { // 날짜, 시간 중복되면 createClassChk 0 리턴
					classUpdate = 0;
				} else {
					classUpdate = session.update("classUpdate", pre_C_Info);
				}
			} else {
				classUpdate = session.update("classUpdate", pre_C_Info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classUpdate;
	}


	@Override
	public int classDelete(Pre_C_Info pre_C_Info) {
		int classDelete = 0;
		int c_num = pre_C_Info.getC_num();
		try {
			// 신청한 사람이 있으면 해당 테이블 데이터부터 날려야해서 있는지 체크 -> 해당 삭제 -> 현재삭제
			int classApplyChk = session.selectOne("classApplyChk", c_num);
			if(classApplyChk > 0) {
				int cStuInfoChk = session.selectOne("cStuInfoChk", c_num);
				if(cStuInfoChk > 0) {
					session.delete("cStuInfoDelete", c_num);
				}
				session.delete("classApplyDelete", c_num);
			}
			classDelete = session.delete("classDelete", c_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classDelete;
	}


	@Override
	public int classFinish(Pre_C_Info pre_C_Info) {
		int classFinish = 0;
		try {
			classFinish = session.update("classFinish", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classFinish;
	}


	@Override
	public List<Pre_C_Info> selectClassList(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> selectClassList = null;
		try {
			selectClassList = session.selectList("selectClassList", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectClassList;
	}


	@Override
	public Pre_C_Info_RVO createCInfo(Pre_C_Info pre_C_Info) {
		Pre_C_Info_RVO rVO = null;
		int createCInfo = 0;
		try {
			// 학생정보 먼저 불러와야됨
			List<Al_Status> aplStuList = session.selectList("aplStuList", pre_C_Info);
			System.out.println("aplStuList :::: "+aplStuList);
			
			for(Al_Status al_Status : aplStuList) {
				createCInfo = session.insert("createCInfo", al_Status);
			}
			if(createCInfo > 0) {
				rVO = new Pre_C_Info_RVO();
				rVO.setSubResultMsg("상세 수업정보가 만들어졌습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rVO;
	}


	@Override
	public Pre_C_Info myClassTime(C_Stu_Info c_Stu_Info) {
		Pre_C_Info myClassTime = null;
		try {
			myClassTime = session.selectOne("myClassTime", c_Stu_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myClassTime;
	}


	@Override
	public int myRateChk(Al_Status al_Status) {
		int myRateChk = 0;
		try {
			int classClosedChk = session.selectOne("classClosedChk", al_Status);
			if(classClosedChk > 0) {
				myRateChk = session.selectOne("myRateChk",al_Status);
			} else {
				myRateChk = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myRateChk;
	}


	@Override
	public List<Pre_C_Info> myCreateClassList(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> myCreateClassList = new ArrayList<Pre_C_Info>();
		try {
			int myCreateClassChk = session.selectOne("myCreateClassChk", pre_C_Info);
			if(myCreateClassChk > 0) {
				myCreateClassList = session.selectList("myCreateClassList", pre_C_Info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myCreateClassList;
	}


	@Override
	public int myClassTot(Pre_C_Info pre_C_Info) {
		int myClassTot = 0;
		try {
			myClassTot = session.selectOne("myClassTot", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myClassTot;
	}


	@Override
	public List<Pre_C_Info> searchClass(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> searchClass = new ArrayList<Pre_C_Info>();
		Pre_C_Info searchResult = new Pre_C_Info();
		try {
			List<Integer> searchChk = session.selectList("searchClassChk", pre_C_Info);
				if(searchChk.size() > 0) {
					for(int c_num : searchChk) {
						pre_C_Info.setC_num(c_num);
						searchResult = session.selectOne("searchClassResult", pre_C_Info);
						searchClass.add(searchResult);
					}
					System.out.println("리스트 체크 ::: "+searchClass);
				} else { // 검색결과 없으면 화면에서 체크용 데이터 전송
					pre_C_Info.setResultCode(1);
					searchClass.add(pre_C_Info);
				}
				return searchClass;
		} catch (Exception e) {
			e.printStackTrace();
			return searchClass;
		}
	}


	@Override
	public List<Pre_C_Info> searchMyClass(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> searchMyClass = new ArrayList<Pre_C_Info>();
		Pre_C_Info searchResult = new Pre_C_Info();
		try {
			List<Integer> searchChk = session.selectList("searchMyClassChk", pre_C_Info);
			if(searchChk.size() > 0) {
				for(int c_num : searchChk) {
					pre_C_Info.setC_num(c_num);
					searchResult = session.selectOne("searchMyClassResult", pre_C_Info);
					searchMyClass.add(searchResult);
				}
			} else {
				pre_C_Info.setResultCode(1);
				searchMyClass.add(pre_C_Info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return searchMyClass;
	}


	@Override
	public Pre_C_Info updateCstatus(Pre_C_Info pre_C_Info) {
		Pre_C_Info updateCstatus = new Pre_C_Info();
		try {
			int updateCstatusChk = session.update("updateCstatus", pre_C_Info);
			if(updateCstatusChk > 0) {
				updateCstatus.setResultMsg("수업상태가 정상적으로 변경되었습니다.");
			} else {
				updateCstatus.setResultCode(1);
				updateCstatus.setResultMsg("데이터 처리에 오류가 발생하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCstatus;
	}


	@Override
	public int myApplyTot(Pre_C_Info pre_C_Info) {
		int myApplyTot = -1;
		try {
			myApplyTot = session.selectOne("myApplyTot", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myApplyTot;
	}


	@Override
	public List<Pre_C_Info> myApplyList(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> myApplyList = new ArrayList<Pre_C_Info>();
		try {
			myApplyList = session.selectList("myApplyList", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myApplyList;
	}


	@Override
	public List<Pre_C_Info> searchMyApplyClass(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> searchMyApplyClass = new ArrayList<Pre_C_Info>();
		System.out.println("pre_C_Info ::: "+pre_C_Info);
		try {
			searchMyApplyClass = session.selectList("searchMyApplyClass", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return searchMyApplyClass;
	}

}
