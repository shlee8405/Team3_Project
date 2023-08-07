package com.team.report.service;

import java.util.List;

import com.team.report.vo.ReportVO;

public interface ReportService {

	// 신고 전체보기
	public List<ReportVO> getAllReports();
}
