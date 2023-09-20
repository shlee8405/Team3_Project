package com.team.mpimg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.mpimg.dao.MpimgDAO;
import com.team.mpimg.vo.MPIVO;

@Service
public class MpimgServiceImpl implements MpimgService{

	@Autowired
	private MpimgDAO mpimgDAO;
	
	@Override
	public List<MPIVO> getImages() {
		return mpimgDAO.getImages();
	}
	
	@Override
	public int uploadImage(MPIVO mpivo) {
		return mpimgDAO.uploadImage(mpivo);
	}
	
	@Override
	public int deleteImage(MPIVO mpivo) {
		return mpimgDAO.deleteImage(mpivo);
	}
	
	@Override
	public int updateImage(MPIVO mpivo) {
		return mpimgDAO.updateImage(mpivo);
	}

	@Override
	public String getMaxIdx() {
		return mpimgDAO.getMaxIdx();
	}
	
	@Override
	public int insertImgname(MPIVO mpivo) {
		return mpimgDAO.insertImgname(mpivo);
	}
	
}
