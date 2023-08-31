package com.team.qna.vo;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {
	
	private String q_idx, q_content, q_response , u_idx, q_status, q_name, f_name, q_date, q_title;
	private MultipartFile q_file;
	
	
	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public MultipartFile getQ_file() {
		return q_file;
	}

	public void setQ_file(MultipartFile q_file) {
		this.q_file = q_file;
	}

	public String getQ_name() {
		return q_name;
	}

	public void setQ_name(String u_name) {
		this.q_name = u_name;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}

	public String getQ_idx() {
		return q_idx;
	}

	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_response() {
		return q_response;
	}

	public void setQ_response(String q_response) {
		this.q_response = q_response;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	} 
	
	
	
}
