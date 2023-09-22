package com.team.report.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.report.dao.ReportDAO;
import com.team.report.vo.ReportVO;
import com.team.user.vo.UserVO;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDAO reportDAO;
		
	@Override
	public List<ReportVO> getAllReports() {
		return reportDAO.getAllReports();
	}
	
	@Override
	public List<ReportVO> getUncheckedReport() {
		return reportDAO.getUncheckedReport();
	}
	
	@Override
	public int checkReport() {
		return reportDAO.checkReport();
	}
	
	@Override
	public int getReportInsert(ReportVO rvo,String u_idx) {
		return reportDAO.getReportInsert(rvo,u_idx);
	}
	
	@Override
	public ReportVO Detail(String r_idx) {
		return reportDAO.Detail(r_idx);
	}
	
	@Override
	public int UpdateReport(ReportVO rvo) {
		return reportDAO.UpdateReport(rvo);
	}
	
	@Override
	public int DeleteReport(String r_idx) {
		return reportDAO.DeleteReport(r_idx);
	}
	
	@Override
	public List<ReportVO> getReports(String u_idx) {
		return reportDAO.getReports(u_idx);
	}
	
	@Override
	public int getDeleteReportByRVO(ReportVO rvo) {
		return reportDAO.getDeleteReportByRVO(rvo);
	}
	
	@Override
	public int getUpdateReportByRVO(ReportVO rvo) {
		return reportDAO.getUpdateReportByRVO(rvo);
	}
	
	@Override
	public int getReviveReportByRVO(ReportVO rvo) {
		return reportDAO.getReviveReportByRVO(rvo);
	}
	
	@Override
	public int getBanUserReportAdmin(ReportVO rvo) {
		return reportDAO.getBanUserReportAdmin(rvo);
	}
	
	@Override
	public List<ReportVO> getListByTitle(String title) {
		return reportDAO.getListByTitle(title);
	}
	
	@Override
	public List<ReportVO> getListByNickname(String nickname) {
		List<UserVO> userlist = reportDAO.getUsersWithNickname(nickname);
		List<ReportVO> list = new ArrayList<ReportVO>();
		for (UserVO uvo : userlist) {
			list.addAll(reportDAO.getListByUidx1(uvo.getU_idx()));
		}
		return list;
	}
	
}

