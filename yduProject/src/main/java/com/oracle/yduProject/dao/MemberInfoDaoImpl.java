package com.oracle.yduProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.Al_Status;
import com.oracle.yduProject.model.C_Name_List_RVO;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.MemberInfo;
import com.oracle.yduProject.model.Pre_C_Info;
import com.oracle.yduProject.model.Terms;

@Repository
public class MemberInfoDaoImpl implements MemberInfoDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<Terms> TermsList() {
		List<Terms> TermsList = null;
		try {
			TermsList = session.selectList("TermsList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return TermsList;
	}
	
	@Override
	public String confirmId(String id) {
		String confirmId = "";
		try {
			confirmId = session.selectOne("confirmId",id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return confirmId;
	}

	@Override
	public int loginChk(MemberInfo memberInfo) {
		int loginChk = 0;
		try {
			int idChk = session.selectOne("idChk", memberInfo);
			if(idChk>0) { // 아이디 있으면 1, 
				int idPwChk = session.selectOne("idPwChk", memberInfo);
				if(idPwChk>0) { // 아이디, 비밀번호 일치하면 2, 아니면 1 리턴
//					memberInfo.setMem_status(session.selectOne("setMem_status", memberInfo));
//					memberInfo.setAutority(session.selectOne("setAutority", memberInfo));
					int mem_statusChk = session.selectOne("mem_statusChk", memberInfo);
					if(mem_statusChk==2) { // 승인대기상태
						loginChk = mem_statusChk;
					} else if(mem_statusChk==3) { // 회원탈퇴상태
						loginChk = mem_statusChk;
					} else { //정상
						loginChk = 4;
					}
				} else {
					loginChk = 1;
				}
			} else { // 아이디 없으면 0 리턴
				loginChk = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("dao loginChk ::::"+loginChk);
		return loginChk;
	}

	@Override
	public int joinMember(MemberInfo memberInfo) {
		int joinMember = 0;
		try {
			joinMember = session.insert("joinMember",memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return joinMember;
	}

	@Override
	public MemberInfo bringMemberInfo(MemberInfo memberInfo) {
		MemberInfo bringMemberInfo = null;
		try {
			bringMemberInfo = session.selectOne("bringMemberInfo", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bringMemberInfo;
	}

	@Override
	public int joinTerms(MemberInfo memberInfo) {
		int joinTerms = 0;
		try {
			joinTerms = session.insert("joinTerms", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return joinTerms;
	}

	@Override
	public void createCStuInfo(C_Name_List_RVO rVO, String id) {
		try {
			List<Integer> todayApplyChk = session.selectList("todayApplyChk", id);
			System.out.println("todayApplyChk :::: "+todayApplyChk);
			List<Integer> todayAttendChk = session.selectList("todayAttendChk", id);
			System.out.println("todayAttendChk :::: "+todayAttendChk);
			todayApplyChk.removeAll(todayAttendChk);
			System.out.println("after remove todayApplyChk :::: "+todayApplyChk);
			if(todayApplyChk.size() > 0) {
				C_Stu_Info c_Stu_Info = new C_Stu_Info();
				c_Stu_Info.setStu_id(id);
				for(int i=0; i<todayApplyChk.size(); i++) {
					System.out.println("todayAttendChk.get(i) ::: " + todayApplyChk.get(i));
					c_Stu_Info.setC_num(todayApplyChk.get(i));
					int createChk = session.insert("createCStuInfo", c_Stu_Info);
					if(createChk > 0) {
						rVO.setCreateCStuInfoMsg("오늘의 출결정보가 등록되었습니다. 출석체크 해주세요");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int memberInfoTot() {
		int memberInfoTot = -1;
		try {
			memberInfoTot = session.selectOne("memberInfoTot");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberInfoTot;
	}

	@Override
	public List<MemberInfo> memberInfoList(MemberInfo memberInfo) {
		List<MemberInfo> memberInfoList = new ArrayList<MemberInfo>();
		try {
			memberInfoList = session.selectList("memberInfoList", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberInfoList;
	}

	@Override
	public int widrawStudentTot(MemberInfo memberInfo) {
		int widrawStudentTot = -1;
		try {
			widrawStudentTot = session.selectOne("studentTot", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return widrawStudentTot;
	}

	@Override
	public List<Pre_C_Info> widrawStudentInfo(MemberInfo memberInfo) {
		List<Pre_C_Info> widrawStudentInfoList = new ArrayList<Pre_C_Info>();
		Pre_C_Info widrawStudentInfo = new Pre_C_Info();
		try {
			List<Integer> studentCnumInfo = session.selectList("studentCnumInfo", memberInfo);
			for(int c_num : studentCnumInfo) {
				memberInfo.setC_num(c_num);
				widrawStudentInfo = session.selectOne("studentInfo", memberInfo);
				widrawStudentInfoList.add(widrawStudentInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return widrawStudentInfoList;
	}

	@Override
	public int professorTot(MemberInfo memberInfo) {
		int professorTot = -1;
		try {
			professorTot = session.selectOne("professorTot", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return professorTot;
	}

	@Override
	public List<Pre_C_Info> professorInfo(MemberInfo memberInfo) {
		List<Pre_C_Info> professorInfo = new ArrayList<Pre_C_Info>();
		try {
			professorInfo = session.selectList("professorInfo", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return professorInfo;
	}

	@Override
	public int studentInfoTot(MemberInfo memberInfo) {
		int studentInfoTot = -1;
		try {
			studentInfoTot = session.selectOne("studentTot", memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentInfoTot;
	}

	@Override
	public List<Pre_C_Info> studentInfo(MemberInfo memberInfo) {
		List<Pre_C_Info> studentInfoList = new ArrayList<Pre_C_Info>();
		Pre_C_Info studentInfo = new Pre_C_Info();
		try {
			List<Integer> studentCnumInfo = session.selectList("studentCnumInfo", memberInfo);
			for(int c_num : studentCnumInfo) {
				memberInfo.setC_num(c_num);
				studentInfo = session.selectOne("studentInfo", memberInfo);
				studentInfoList.add(studentInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentInfoList;
	}

	@Override
	public MemberInfo widrawPwChk(MemberInfo memberInfo) {
		MemberInfo widrawPwChkResult = new MemberInfo();
		try {
			int widrawPwChk = session.selectOne("widrawPwChk", memberInfo);
			if(widrawPwChk == 0) {
				widrawPwChkResult.setResultMsg("비밀번호가 일치하지 않습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return widrawPwChkResult;
	}

	@Override
	public MemberInfo widrawStuResult(MemberInfo memberInfo) {
		MemberInfo widrawStuResult = new MemberInfo();
		try {
			List<Integer> myCstatusOneListChk = session.selectList("myCstatusOneListChk", memberInfo);
			System.out.println("myCstatusOneListChk ::: "+myCstatusOneListChk);
			if(myCstatusOneListChk.size() > 0) {
				for(int c_num : myCstatusOneListChk) {
					memberInfo.setC_num(c_num);
					int subChk = session.selectOne("subChk", memberInfo);
					if(subChk > 0) {
						int chk = session.delete("myCStuInfoDelete2", memberInfo);
					}
					session.update("myAStatus1Update", memberInfo);
				}
			}
			List<Integer> myCstatusTwoListChk = session.selectList("myCstatusTwoListChk", memberInfo);
			System.out.println("myCstatusTwoListChk ::: "+myCstatusTwoListChk);
			if(myCstatusTwoListChk.size() > 0) {
				for(int c_num : myCstatusTwoListChk) {
					memberInfo.setC_num(c_num);
					session.update("myAStatus3Update", memberInfo);
				}
			}
			int widrawResult = session.update("widrawResult", memberInfo);
			if(widrawResult > 0) {
				widrawStuResult.setResultMsg("회원탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			} else {
				widrawStuResult.setResultCode(1);
				widrawStuResult.setResultMsg("데이터 처리에 오류가 발생하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return widrawStuResult;
	}

	@Override
	public MemberInfo widrawProResult(MemberInfo memberInfo) {
		MemberInfo widrawProResult = new MemberInfo();
		try {
			int myC2ClassChk = session.selectOne("myC2ClassChk", memberInfo);
			if(myC2ClassChk > 0) {
				widrawProResult.setResultCode(1);
				widrawProResult.setResultMsg("수업중인 과정이 있습니다. 수업종료 후 회원탈퇴해주세요.");
			} else {
				List<Integer> myC1ClassChk = session.selectList("myC1ClassChk", memberInfo);
				if(myC1ClassChk.size() > 0) {
					for(int c_num : myC1ClassChk) {
						memberInfo.setC_num(c_num);
						int myC1CstuClassChk = session.selectOne("myC1CstuClassChk", memberInfo);
						if(myC1CstuClassChk > 0) {
							session.delete("myC1CstuDelete", memberInfo); // 출결정보 삭제
						}
						int myC1ApplyChk = session.selectOne("myC1ApplyChk", memberInfo);
						if(myC1ApplyChk > 0) {
							session.update("myC1ApplyUpdate", memberInfo); // 수강신청생 취소로 전환 
						}
						session.update("myC1ClassUpdate", memberInfo); //상태변경
					}
				}
				session.update("widrawResult", memberInfo);
				widrawProResult.setResultMsg("회원탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return widrawProResult;
	}

	@Override
	public List<MemberInfo> selectView(MemberInfo memberInfo) {
		List<MemberInfo> selectView = new ArrayList<MemberInfo>();
		try {
			if(memberInfo.getAutority() > 0) {
				int autorityListChk = session.selectOne("autorityListChk", memberInfo);
				if(autorityListChk > 0) {
					selectView = session.selectList("getAutorityList", memberInfo);
				}
			} else if(memberInfo.getMem_status() > 0) {
				int memStatusListChk = session.selectOne("memStatusListChk", memberInfo);
				if(memStatusListChk > 0) {
					selectView = session.selectList("getMemStatusList", memberInfo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectView;
	}

	@Override
	public List<MemberInfo> searchMember(MemberInfo memberInfo) {
		List<MemberInfo> searchMember = new ArrayList<MemberInfo>();
		try {
			String keywordChk = memberInfo.getKeyword();
			if(keywordChk.equals("승인완료") || keywordChk.equals("승인완") || keywordChk.equals("인완료") || keywordChk.equals("완료") || keywordChk.equals("완") || keywordChk.equals("료")) {
				memberInfo.setMs1Keyword(1);
				searchMember = session.selectList("searchMs1Member", memberInfo);
			} else if(keywordChk.equals("승인대기") || keywordChk.equals("승인대") || keywordChk.equals("인대기") || keywordChk.equals("대기") || keywordChk.equals("대") || keywordChk.equals("기")) {
				memberInfo.setMs2Keyword(2);
				searchMember = session.selectList("searchMs2Member", memberInfo);
			} else if(keywordChk.equals("승인") || keywordChk.equals("승") || keywordChk.equals("인")) {
				memberInfo.setMs1Keyword(1);
				memberInfo.setMs2Keyword(2);
				searchMember = session.selectList("searchMs12Member", memberInfo);
			} else if(keywordChk.equals("학생") || keywordChk.equals("학") || keywordChk.equals("생")) {
				memberInfo.setArKeyWord(1);
				searchMember = session.selectList("searchArMember", memberInfo);
			} else if(keywordChk.equals("교수") || keywordChk.equals("교") || keywordChk.equals("수")) {
				memberInfo.setArKeyWord(2);
				searchMember = session.selectList("searchArMember", memberInfo);
			} else if(keywordChk.equals("관리자") || keywordChk.equals("관리") || keywordChk.equals("리자") || keywordChk.equals("관") || keywordChk.equals("리") || keywordChk.equals("자")) {
				memberInfo.setArKeyWord(3);
				searchMember = session.selectList("searchArMember", memberInfo);
			} else {
				searchMember = session.selectList("searchMember", memberInfo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return searchMember;
	}

	@Override
	public MemberInfo changeAutority(MemberInfo memberInfo) {
		MemberInfo changeAutority = new MemberInfo();
		System.out.println("memberInfo.getPreAutority() ::: "+memberInfo.getPreAutority());
		try {
			if(memberInfo.getPreAutority() == 1) { // 학생의 경우
				int changeAutorityChk1 = session.selectOne("changeAutorityChk1", memberInfo); // 수업중인거 있는지 체크
				System.out.println("changeAutorityChk1 ::: "+changeAutorityChk1);
				if(changeAutorityChk1 > 0) {
					changeAutority.setResultMsg("수강신청 중이거나 참여 중인 수업이 있어 권한변경이 불가능합니다.");
					return changeAutority;
				}
			} else if(memberInfo.getPreAutority() == 2) {
				int changeAutorityChk2 = session.selectOne("changeAutorityChk2", memberInfo);
				System.out.println("changeAutorityChk2 ::: "+changeAutorityChk2);
				if(changeAutorityChk2 > 0) {
					changeAutority.setResultMsg("수업개설 중이거나 수업 중인 과목이 있어 권한변경이 불가능합니다.");
					return changeAutority;
				} 
			} 
			int changeAutorityResult = session.update("changeAutorityResult", memberInfo);
			System.out.println("changeAutorityResult ::: "+changeAutorityResult);
			if(changeAutorityResult > 0) {
				changeAutority.setResultMsg(memberInfo.getId()+"님의 권한이 정상적으로 변경되었습니다.");
			} else {
				changeAutority.setResultCode(1);
				changeAutority.setResultMsg("데이터 처리에 오류가 발생하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return changeAutority;
	}

	@Override
	public MemberInfo changeMemstatus(MemberInfo memberInfo) {
		MemberInfo changeMemstatus = new MemberInfo();
		try {
			if(memberInfo.getPreMem_status() == 1 && memberInfo.getAutority() == 1) { // 수강신청이력, 수강과정 확인, 신청이력중 출결정보 삭제
				int c1a2Chk = session.selectOne("c1a2Chk", memberInfo);
				if(c1a2Chk > 0) { // 신청이력 중 수강신청-수업개설인 과정, 출결정보 여부 체크
					session.delete("c1a2Delete",memberInfo); // 출결정보 삭제
				}
				int c1a2ApplyChk = session.selectOne("c1a2ApplyChk", memberInfo);
				if(c1a2ApplyChk > 0) { // 신청이력 중 수강신청-수업개설인 과정, 수강취소로 변경
					session.update("c1a2Update", memberInfo);
				}
				int c2a2Chk = session.selectOne("c2a2Chk", memberInfo);
				if(c2a2Chk > 0) {
					session.update("c2a2Update", memberInfo);
				}
			} else if(memberInfo.getPreMem_status() == 1 && memberInfo.getAutority() == 2) {
				int myC2Chk = session.selectOne("myC2Chk", memberInfo);
				if(myC2Chk > 0) {
					changeMemstatus.setResultMsg("수업중인 과정이 있어 회원상태를 변경할 수 없습니다.");
					return changeMemstatus;
				}
				List<Integer> myC1List = session.selectList("myC1List", memberInfo);
				if(myC1List.size() > 0) {
					for(int c_num : myC1List) {
						memberInfo.setC_num(c_num);
						try {
							session.delete("myC1CstuDelete", memberInfo);
						} catch (Exception e) {
							continue;
						}
						try {
							session.update("myC1ApplyUpdate", memberInfo);
						} catch (Exception e) {
							continue;
						}
						session.update("myC1ClassUpdate", memberInfo);
					}
				}
			}
			session.update("changeMemstatus", memberInfo);
			changeMemstatus.setResultMsg(memberInfo.getId()+"님의 회원상태가 정상적으로 변경되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return changeMemstatus;
	}
}
