package com.team.mpimg.service;

import com.team.mpimg.vo.MPIVO;

public interface MpimgService {
	int uploadImage(MPIVO mpivo);
	int deleteImage(MPIVO mpivo);
	int updateImage(MPIVO mpivo);
}
