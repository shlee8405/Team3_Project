package com.team.mpimg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.mpimg.vo.MPIVO;

@Repository
public class MpimgDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MPIVO> getImages() {
		return sqlSessionTemplate.selectList("mainpageimage.getImage");
	}
	
	public int uploadImage(MPIVO mpivo) {
		return sqlSessionTemplate.insert("mainpageimage.uploadImage",mpivo);
	}
	
	public int deleteImage(MPIVO mpivo) {
		return sqlSessionTemplate.delete("mainpageimage.deleteImage", mpivo);
	}
	
	public int updateImage(MPIVO mpivo) {
		return sqlSessionTemplate.update("mainpageimage.updateImage", mpivo);
	}
	
	public String getMaxIdx() {
		return sqlSessionTemplate.selectOne("mainpageimage.getMaxIdx");
	}
	
	public int insertImgname(MPIVO mpivo) {
		return sqlSessionTemplate.update("mainpageimage.insertImgname", mpivo);
	}
}
