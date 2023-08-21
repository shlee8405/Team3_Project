package com.team.report.service;

import java.util.List;

import com.team.report.vo.ReportVO;

public interface ReportService {

	// 신고 전체보기
	public List<ReportVO> getAllReports();
	
	// 신고하기
	int getReportInsert(ReportVO rvo);
	
	// 신고 상세
	ReportVO Detail(String r_idx);
}
