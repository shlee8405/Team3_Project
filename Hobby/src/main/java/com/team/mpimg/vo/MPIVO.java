package com.team.mpimg.vo;

import org.springframework.web.multipart.MultipartFile;

public class MPIVO {
	private String mp_idx, mp_title, mp_desc, mp_imgname, mp_date;
	private MultipartFile file;


	
	
	
	public String getMp_date() {
		return mp_date;
	}

	public void setMp_date(String mp_date) {
		this.mp_date = mp_date;
	}

	public String getMp_imgname() {
		return mp_imgname;
	}

	public void setMp_imgname(String mp_imgname) {
		this.mp_imgname = mp_imgname;
	}

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
