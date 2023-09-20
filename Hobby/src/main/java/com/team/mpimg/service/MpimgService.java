package com.team.mpimg.service;

import java.util.List;

import com.team.mpimg.vo.MPIVO;

public interface MpimgService {
	int uploadImage(MPIVO mpivo);
	int deleteImage(MPIVO mpivo);
	int updateImage(MPIVO mpivo);
	int insertImgname(MPIVO mpivo);
	String getMaxIdx();
	List<MPIVO> getImages();
}
