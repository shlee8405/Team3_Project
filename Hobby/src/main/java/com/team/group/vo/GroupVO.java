package com.team.group.vo;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class GroupVO {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String g_idx, g_title, g_desc, g_date, g_cdo, g_gugun, g_location, g_maxPeople, g_curPeople, g_link, g_status, g_fname, g_oldfname, u_idx, g_intro;
	
	// file 파리미터를 저장할 이름
	private MultipartFile file;
	
	public String getG_cdo() {
		return g_cdo;
	}

	public void setG_cdo(String g_cdo) {
		this.g_cdo = g_cdo;
	}

	public String getG_gugun() {
		return g_gugun;
	}

	public void setG_gugun(String g_gugun) {
		this.g_gugun = g_gugun;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getG_date() {
		return g_date;
	}

	public void setG_date(String g_date) {
		this.g_date = g_date;
	}

	public String getG_oldfname() {
		return g_oldfname;
	}

	public void setG_oldfname(String g_oldfname) {
		this.g_oldfname = g_oldfname;
	}

	public String getG_intro() {
		return g_intro;
	}

	public void setG_intro(String g_intro) {
		this.g_intro = g_intro;
	}

	public String getG_fname() {
		return g_fname;
	}

	public void setG_fname(String g_fname) {
		this.g_fname = g_fname;
	}

	public String getG_idx() {
		return g_idx;
	}

	public void setG_idx(String g_idx) {
		this.g_idx = g_idx;
	}

	public String getG_title() {
		return g_title;
	}

	public void setG_title(String g_title) {
		this.g_title = g_title;
	}

	public String getG_desc() {
		return g_desc;
	}

	public void setG_desc(String g_desc) {
		this.g_desc = g_desc;
	}

	public String getG_location() {
		return g_location;
	}

	public void setG_location(String g_location) {
		this.g_location = g_location;
	}

	public String getG_maxPeople() {
		return g_maxPeople;
	}

	public void setG_maxPeople(String g_maxPeople) {
		this.g_maxPeople = g_maxPeople;
	}

	public String getG_curPeople() {
		return g_curPeople;
	}

	public void setG_curPeople(String g_curPeople) {
		this.g_curPeople = g_curPeople;
	}

	public String getG_link() {
		return g_link;
	}

	public void setG_link(String g_link) {
		this.g_link = g_link;
	}

	public String getG_status() {
		return g_status;
	}

	public void setG_status(String g_status) {
		this.g_status = g_status;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}
	
	
}