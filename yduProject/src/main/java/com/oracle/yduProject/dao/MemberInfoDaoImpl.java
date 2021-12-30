package com.oracle.yduProject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.C_Name_List_RVO;
import com.oracle.yduProject.model.C_Stu_Info;
import com.oracle.yduProject.model.MemberInfo;
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
	

}
