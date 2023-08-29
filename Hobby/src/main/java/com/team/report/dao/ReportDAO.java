package com.team.report.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.report.vo.ReportVO;

@Repository
public class ReportDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReportVO> getAllReports() {
		return sqlSessionTemplate.selectList("report.allList");
	}
	
	public int getReportInsert(ReportVO rvo) {
		return sqlSessionTemplate.insert("report.insert",rvo);
	}
	
	public ReportVO Detail(String r_idx) {
		return sqlSessionTemplate.selectOne("report.detail", r_idx);
	}
	
	public int UpdateReport(ReportVO rvo) {
		return sqlSessionTemplate.update("report.update", rvo);
	}
	
	public int DeleteReport(String r_idx) {
		return sqlSessionTemplate.update("report.delete",r_idx);
	}
}
