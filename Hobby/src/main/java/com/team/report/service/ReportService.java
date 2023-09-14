package com.team.report.service;

import java.util.List;

import com.team.faq.vo.FaqVO;
import com.team.report.vo.ReportVO;

public interface ReportService {

	// 신고 전체보기
	public List<ReportVO> getAllReports();
	
	// 신고하기
	int getReportInsert(ReportVO rvo,String u_idx);
	
	// 신고 상세
	ReportVO Detail(String r_idx);
	
	// 신고 수정
	int UpdateReport(ReportVO rvo);
	
	// 신고 삭제
	int DeleteReport(String r_idx);
	
	// 신고 특정 목록
	List<ReportVO> getReports(String u_idx);
	
	// 신고 삭제 with rvo
	int getDeleteReportByRVO(ReportVO rvo);
	
	// 신고 답변 or 업데이트 with rvo
	int getUpdateReportByRVO(ReportVO rvo);
	
	// 신고 삭제처리 복구
	int getReviveReportByRVO(ReportVO rvo);
	
	// 유저 밴 (신고 매퍼에서 유저 테이블 접근)
	int getBanUserReportAdmin(ReportVO rvo);
	
	// 제목으로 상세 검색
	public List<ReportVO> getListByTitle(String title);
	
	// 닉네임으로 상세 검색
	public List<ReportVO> getListByNickname(String nickname); 
	
}
