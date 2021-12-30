package com.oracle.yduProject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class C_Info {
	private int c_i_num;
	private int c_num;
	private String stu_id;
	private int m_score;
	private int f_score;
	private double a_score;
	private String ins_opinion;
	private String name;
	private String c_name;
	
	private int a_status;
	private int c_status;
	// 페이지네이션용
	private int high_c_num;
	private int low_c_num;
	
	// 출석점수용
	private int totalClassDay; // 총 수업일
	private int attendClassDay; // 참여 수업일
	
	private String grade;
	
	// 출결 점수 계산용
	private int absentCnt; // 결석수
	private int lateearlyCnt; // 지각&조퇴수
	private int lateCnt; // 지각수
	private int earlyCnt; // 조퇴수
	private int attendCnt; // 출석수
	private double attendPercent;
	
	// 시험점수 입력용
	private String updateChk;
	
	private int rateChk;

	@Override
	public String toString() {
		return "C_Info [c_i_num=" + c_i_num + ", c_num=" + c_num + ", stu_id=" + stu_id + ", m_score=" + m_score
				+ ", f_score=" + f_score + ", a_score=" + a_score + ", ins_opinion=" + ins_opinion + ", name=" + name
				+ ", c_name=" + c_name + ", a_status=" + a_status + ", c_status=" + c_status + ", high_c_num="
				+ high_c_num + ", low_c_num=" + low_c_num + ", totalClassDay=" + totalClassDay + ", attendClassDay="
				+ attendClassDay + ", grade=" + grade + ", absentCnt=" + absentCnt + ", lateearlyCnt=" + lateearlyCnt
				+ ", lateCnt=" + lateCnt + ", earlyCnt=" + earlyCnt + ", attendCnt=" + attendCnt + ", attendPercent="
				+ attendPercent + ", updateChk=" + updateChk + ", rateChk=" + rateChk + "]";
	} 
	
}
