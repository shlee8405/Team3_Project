package com.team.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.report.dao.ReportDAO;
import com.team.report.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDAO reportDAO;
		
	@Override
	public List<ReportVO> getAllReports() {
		return reportDAO.getAllReports();
	}
}
