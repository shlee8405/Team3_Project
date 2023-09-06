package com.team.camp.vo;

import java.util.Date;

public class ReviewVO {

	private int id; // 리뷰의 고유 ID
	private String facltNm; // 캠핑장 이름
	private String u_idx; // 리뷰를 남긴 회원의 idx
	private String u_Id; // 리뷰를 남긴 회원의 ID
	private String u_nickname; // 리뷰를 남긴 회원 닉네임
	private String comment; // 한 줄 평
	private int rating; // 별점
	private Date created_date; // 리뷰 생성 시간
	private String formatted_date; // 여기에 형식이 변경된 날짜를 저장

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}

	public String getFormatted_date() {
		return formatted_date;
	}

	public void setFormatted_date(String formatted_date) {
		this.formatted_date = formatted_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFacltNm() {
		return facltNm;
	}

	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}

	public String getU_Id() {
		return u_Id;
	}

	public void setU_Id(String u_Id) {
		this.u_Id = u_Id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
}