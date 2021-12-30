package com.oracle.yduProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Professor_Rate;

@Repository
public class Professor_RateDaoImpl implements Professor_RateDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<Pre_C_Info> professorRateList(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> professorRateList = new ArrayList<Pre_C_Info>();
		Pre_C_Info professorRate = null;
		try {
			// 종료한 과목이 있는지 먼저 체크해야함
			List<Integer> closedClassChk = session.selectList("closedClassChk");
			if(closedClassChk.size() > 0) {
				for(int c_num : closedClassChk) {
					professorRate = new Pre_C_Info();
					professorRate = session.selectOne("professorRate", c_num);
					try { 
						professorRate.setProf_rates(session.selectOne("getProfRate", c_num));
					} catch (Exception e) {
						professorRate.setProf_rates(0);
					}
					System.out.println("professorRate : "+professorRate);
					professorRateList.add(professorRate);
				}
			}
			System.out.println("professorRateList : "+professorRateList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return professorRateList;
	}

	@Override
	public List<Professor_Rate> profRateContList(Pre_C_Info pre_C_Info) {
		List<Professor_Rate> profRateContList = new ArrayList<Professor_Rate>();
		try {
			profRateContList = session.selectList("profRateContList", pre_C_Info);
		} catch (Exception e) {
			profRateContList = new ArrayList<Professor_Rate>();
		}
		return profRateContList;
	}

	@Override
	public Pre_C_Info getProfRateInfo(Pre_C_Info pre_C_Info) {
		Pre_C_Info getProfRateInfo = null;
		try {
			getProfRateInfo = session.selectOne("getProfRateInfo", pre_C_Info);
			try { 
				getProfRateInfo.setProf_rates(session.selectOne("getProfRate", pre_C_Info.getC_num()));
			} catch (Exception e) {
				getProfRateInfo.setProf_rates(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getProfRateInfo;
	}

	@Override
	public Pre_C_Info professorRateForm(Pre_C_Info pre_C_Info) {
		Pre_C_Info professorRateForm = null;
		try {
			professorRateForm = session.selectOne("professorRateForm", pre_C_Info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return professorRateForm;
	}

	@Override
	public Professor_Rate professorRate(Professor_Rate professor_Rate) {
		Professor_Rate professorRate = new Professor_Rate();
		try {
			session.insert("professorRateInsert", professor_Rate);
			professorRate.setResultMsg("평가내용이 정상적으로 반영되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			professorRate.setErrorCode(1);
			professorRate.setResultMsg("평가내용 반영에 오류가 발생하였습니다.");
		}
		return professorRate;
	}

	@Override
	public Professor_Rate profRateUpdateForm(Al_Status al_Status) {
		Professor_Rate profRateUpdateForm = null;
		try {
			profRateUpdateForm = session.selectOne("profRateUpdateForm", al_Status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return profRateUpdateForm;
	}

	@Override
	public Professor_Rate rateUpdate(Professor_Rate professor_Rate) {
		Professor_Rate rateUpdate = new Professor_Rate();
		try {
			session.update("rateUpdate", professor_Rate);
			rateUpdate.setResultMsg("평가내용이 정상적으로 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			rateUpdate.setErrorCode(1);
			rateUpdate.setResultMsg("평가내용 수정에 오류가 발생하였습니다.");
		}
		return rateUpdate;
	}

	@Override
	public List<Pre_C_Info> searchProfRate(Pre_C_Info pre_C_Info) {
		List<Pre_C_Info> searchProfRate = new ArrayList<Pre_C_Info>();
		Pre_C_Info searchResult = new Pre_C_Info();
		try {
			List<Integer> searchChk = session.selectList("searchChk", pre_C_Info);
				if(searchChk.size()>0) {
					for(int c_num : searchChk) {
						pre_C_Info.setC_num(c_num);
						searchResult = session.selectOne("searchResult", pre_C_Info);
						try {
							searchResult.setProf_rates(session.selectOne("getProfRate", c_num));
						} catch (Exception e) {
							searchResult.setProf_rates(0);
						}
						System.out.println(c_num+"번째 체크 ::: "+searchResult);
						searchProfRate.add(searchResult);
					}
					System.out.println("리스트 체크 ::: "+searchProfRate);
				} else { // 검색결과 없으면 화면에서 체크용 데이터 전송
					Pre_C_Info searchNone = new Pre_C_Info();
					searchNone.setResultCode(1);
					searchNone.setSearchContent(pre_C_Info.getSearchContent());
					searchProfRate.add(searchNone);
				}
				return searchProfRate;
		} catch (Exception e) {
			e.printStackTrace();
			return searchProfRate;
		}
	}

	@Override
	public Professor_Rate professorRateDelete(Professor_Rate professor_Rate) {
		Professor_Rate professorRateDelete = new Professor_Rate();
		try {
			session.delete("professorRateDelete", professor_Rate);
			professorRateDelete.setResultMsg("교수평가가 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			professorRateDelete.setResultMsg("데이터 처리 중 오류가 발생하였습니다.");
		}
		return professorRateDelete;
	}
	
	
}
