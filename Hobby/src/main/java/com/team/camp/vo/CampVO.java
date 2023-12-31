package com.team.camp.vo;

public class CampVO {
	/* 
	 contentId : 콘텐츠 ID
	 facltNm : 야영장명
	 lineIntro : 한줄소개
	 addr1 : 전체 주소
	 doNm : 주소(시,도)
	 mapX : 경도(X)
	 mapY : 위도(Y)
	 tel : 전화번호 
	 operDeCl : 운영일
	 lctCl : 캠핑장 환경 (ex: 산, 숲)
	 induty : 캠핑장 유형 (ex: 자동차 야영장)
	 posblFcltyCl : 주변이용가능시설
	 featureNm : 소개글
	 intro : 소개글
	 firstImageUrl : 이미지
	 */
	
	private String contentId, facltNm, lineIntro, addr1, mapX, mapY, intro, 
				   tel, operDeCl, lctCl, induty, posblFcltyCl, featureNm, 
				   firstImageUrl, doNm, message, u_id;

	private int likesCount, wishCount;
	
	private double averageRating;
	
	public double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}

	public int getWishCount() {
		return wishCount;
	}

	public void setWishCount(int wishCount) {
		this.wishCount = wishCount;
	}

	public int getLikesCount() {
		return likesCount;
	}

	public void setLikesCount(int likesCount) {
		this.likesCount = likesCount;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getFacltNm() {
		return facltNm;
	}

	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}

	public String getLineIntro() {
		return lineIntro;
	}

	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getOperDeCl() {
		return operDeCl;
	}

	public void setOperDeCl(String operDeCl) {
		this.operDeCl = operDeCl;
	}

	public String getLctCl() {
		return lctCl;
	}

	public void setLctCl(String lctCl) {
		this.lctCl = lctCl;
	}

	public String getInduty() {
		return induty;
	}

	public void setInduty(String induty) {
		this.induty = induty;
	}

	public String getPosblFcltyCl() {
		return posblFcltyCl;
	}

	public void setPosblFcltyCl(String posblFcltyCl) {
		this.posblFcltyCl = posblFcltyCl;
	}

	public String getFeatureNm() {
		return featureNm;
	}

	public void setFeatureNm(String featureNm) {
		this.featureNm = featureNm;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getFirstImageUrl() {
		return firstImageUrl;
	}

	public void setFirstImageUrl(String firstImageUrl) {
		this.firstImageUrl = firstImageUrl;
	}

	public String getDoNm() {
		return doNm;
	}

	public void setDoNm(String doNm) {
		this.doNm = doNm;
	}
}