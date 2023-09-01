package com.team.camp.vo;

import java.util.Date;

public class ReviewVO {

	private int id;            // 리뷰의 고유 ID
    private String facltNm;    // 캠핑장 이름
    private String u_Id;     // 리뷰를 남긴 회원의 ID
    private String comment;    // 한 줄 평
	private int rating;        // 별점
    private Date created_date; // 리뷰 생성 시간
	
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