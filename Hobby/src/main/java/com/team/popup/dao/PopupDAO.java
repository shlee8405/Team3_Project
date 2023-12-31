package com.team.popup.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.popup.vo.PopupVO;

@Repository
public class PopupDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public int Insert_Popup(PopupVO vo) {
		return sqlSessionTemplate.insert("popup.insert",vo);
	}
	
	
	public List<PopupVO> SelectPopup() {
		return sqlSessionTemplate.selectList("popup.selectlist");
	}
	
	public int Delete_Popup(String idx) {
		return sqlSessionTemplate.delete("popup.delete", idx);
	}
	
	public PopupVO selectOne(PopupVO popupVO) {
		return sqlSessionTemplate.selectOne("popup.one", popupVO.getPop_idx());
	}
	
	public int Update(PopupVO popvo) {
		return sqlSessionTemplate.update("popup.update", popvo);
	}
}
