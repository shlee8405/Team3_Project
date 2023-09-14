package com.team.report.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.report.vo.ReportVO;
import com.team.user.vo.UserVO;

@Repository
public class ReportDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReportVO> getAllReports() {
		return sqlSessionTemplate.selectList("report.allList");
	}
	
	public int getReportInsert(ReportVO rvo,String u_idx) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("rvo", rvo);
		map.put("u_idx", u_idx);
		
		return sqlSessionTemplate.insert("report.insert",map);
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
	
	public List<ReportVO> getReports(String u_idx) {
		return sqlSessionTemplate.selectList("report.List",u_idx);
	}
	
	public int getDeleteReportByRVO(ReportVO rvo) {
		return sqlSessionTemplate.update("report.deleteWithRVO", rvo);
	}
	
	public int getUpdateReportByRVO(ReportVO rvo) {
		return sqlSessionTemplate.update("report.updateWithRVO", rvo);
	}
	
	public int getReviveReportByRVO(ReportVO rvo) {
		return sqlSessionTemplate.update("report.reviveWithRVO", rvo);
	}
	
	public int getBanUserReportAdmin(ReportVO rvo) {
		return sqlSessionTemplate.update("report.banUserWithRVO", rvo);
	}
	
	public List<ReportVO> getListByTitle(String r_title) {
		return sqlSessionTemplate.selectList("report.getListWithTitle", r_title);
	}
	
	public List<ReportVO> getListByUidx1(String u_idx1) {
		return sqlSessionTemplate.selectList("report.getListWithUidx1", u_idx1);
	}
	
	public List<UserVO> getUsersWithNickname(String nickname) {
		return sqlSessionTemplate.selectList("report.getUsersWithNickname", nickname);
	}
}
