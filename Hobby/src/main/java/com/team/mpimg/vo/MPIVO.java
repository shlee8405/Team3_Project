package com.team.mpimg.vo;

import org.springframework.web.multipart.MultipartFile;

public class MPIVO {
	private String mp_idx, mp_title, mp_desc;
	private MultipartFile file;

	
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getMp_title() {
		return mp_title;
	}

	public void setMp_title(String mp_title) {
		this.mp_title = mp_title;
	}

	public String getMp_idx() {
		return mp_idx;
	}

	public void setMp_idx(String mp_idx) {
		this.mp_idx = mp_idx;
	}

	public String getMp_desc() {
		return mp_desc;
	}

	public void setMp_desc(String mp_desc) {
		this.mp_desc = mp_desc;
	}
	
}
