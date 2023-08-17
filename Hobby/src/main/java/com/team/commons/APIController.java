package com.team.commons;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.team.camp.vo.CampVO;

@RestController
public class APIController {
	@Autowired
	private RestTemplate restTemplate;
	
	// 공통파라미터 전역 선언
	private final String targetUrl = "https://apis.data.go.kr/B551011/GoCamping";
	private final String serviceKey = "vftwTJlsPgy8Zr4yGFWel%2B0e54Ai6wRKua4w26fGz03gC5HqPtaQzeqWerg0kCB8f%2FpRosqM4JRLUq5Xvjel9A%3D%3D";
	private final String mobileOS = "ETC";
	private final String mobileApp = "MobileApp";
	
	
	// 캠핑장 리스트 가져오기(고캠핑 api basedList 호출)
	@GetMapping("/campList.do")
	public List<CampVO> getCampList(@RequestParam(defaultValue = "1") int pageNo) throws URISyntaxException {
		
		// 리퀘스트 파라미터
		int numOfRows = 5; 	// 보여줄 리스트 개수
		//int pageNo = 1; 	// 페이지 번호
		
		String apiUrl = targetUrl + "/basedList"
				+ "?numOfRows=" + numOfRows
				+ "&pageNo=" + pageNo
				+ "&MobileOS=" + mobileOS
				+ "&MobileApp=" +  mobileApp
				+ "&serviceKey=" + serviceKey
				+ "&_type=json";
				
		// 자바 URI클래스를 사용. URL전송 할 때 문자열 그대로 날아가는 것이 아닌 한번 인코딩 해서 보내준다.
		URI uri = new URI(apiUrl);
		
		ResponseEntity<String> response = restTemplate.getForEntity(uri, String.class);
		
		//Body 정보만 필요하기 때문에
		JSONObject jsonResponse = new JSONObject(response.getBody());
		
		JSONArray item = jsonResponse.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
		
		// CampVO타입으로 dataList라는 빈 배열 선언
		List<CampVO> dataList = new ArrayList<>();
		
		for (int i = 0; i < item.length(); i++) {
			JSONObject oneItem = item.getJSONObject(i);
			
			/*
			 facltNm : 야영장명
			 lineIntro : 한줄소개
			 firstImageUrl : 이미지
			 addr1 : 전체 주소
			 doNm : 주소(시,도)
			 tel : 전화번호 
			 operDeCl : 운영일
			 lctCl : 캠핑장 환경 (ex: 산, 숲)
			 induty : 캠핑장 유형 (ex: 자동차 야영장)
			 posblFcltyCl : 주변이용가능시설
			 mapX : 경도(X)
			 mapY : 위도(Y)
			 featureNm : 소개글
			 */
			
			CampVO cvo = new CampVO();
			cvo.setFacltNm(oneItem.getString("facltNm"));
			cvo.setAddr1(oneItem.getString("addr1"));
			cvo.setLineIntro(oneItem.getString("lineIntro"));
			// 나중에 필요한거 더 추가........
			dataList.add(cvo);
		}
		
//		ModelAndView mv = new ModelAndView("camp/camp_list");
//		mv.addObject("dataList", dataList);
		return dataList;
	}
	
	
	@GetMapping("/campMain.do")
	public ModelAndView goCampMain() {
		ModelAndView mv = new ModelAndView("camp/camp_list");
		return mv;
	}
	
	
	// 캠핑장 상세보기 호출하기
	@GetMapping("/campDetail.do")
	public ModelAndView getCampDetail(@RequestParam String keyword) throws URISyntaxException, UnsupportedEncodingException {
		
		// 리퀘스트 파라미터
		int numOfRows = 1; // 보여줄 리스트 개수
		int pageNo = 1; 	// 페이지 번호
		
		String apiUrl = targetUrl + "/searchList"
				+ "?numOfRows=" + numOfRows
				+ "&pageNo=" + pageNo
				+ "&MobileOS=" + mobileOS
				+ "&MobileApp=" +  mobileApp
				+ "&serviceKey=" + serviceKey
				+ "&_type=json"
				+ "&keyword=" + URLEncoder.encode(keyword, StandardCharsets.UTF_8.toString());
				
		// 자바 URI클래스를 사용. URL전송 할 때 문자열 그대로 날아가는 것이 아닌 한번 인코딩 해서 보내준다.
		URI uri = new URI(apiUrl);
		
		ResponseEntity<String> response = restTemplate.getForEntity(uri, String.class);
		
		// Body 정보만 필요하기 때문에
		JSONObject jsonResponse = new JSONObject(response.getBody());
		// item을 받고
		JSONArray item = jsonResponse.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
		
		// 0번째 index 리스트만 가져와야 함.
		JSONObject firstData = item.getJSONObject(0);
		
		/*
		 facltNm : 야영장명
		 lineIntro : 한줄소개
		 firstImageUrl : 이미지
		 addr1 : 전체 주소
		 doNm : 주소(시,도)
		 tel : 전화번호 
		 operDeCl : 운영일
		 lctCl : 캠핑장 환경 (ex: 산, 숲)
		 induty : 캠핑장 유형 (ex: 자동차 야영장)
		 posblFcltyCl : 주변이용가능시설
		 mapX : 경도(X)
		 mapY : 위도(Y)
		 featureNm : 소개글
		 */
		 
		CampVO cvo = new CampVO();
		cvo.setFirstImageUrl(firstData.getString("firstImageUrl"));
		cvo.setFacltNm(firstData.getString("facltNm"));
		cvo.setLineIntro(firstData.getString("lineIntro"));
		cvo.setAddr1(firstData.getString("addr1"));
		cvo.setTel(firstData.getString("tel"));
		cvo.setOperDeCl(firstData.getString("operDeCl"));
		cvo.setLctCl(firstData.getString("lctCl"));
		cvo.setInduty(firstData.getString("induty"));
		cvo.setPosblFcltyCl(firstData.getString("posblFcltyCl"));
		cvo.setFeatureNm(firstData.getString("featureNm"));
		cvo.setMapX(firstData.getString("mapX"));
		cvo.setMapY(firstData.getString("mapY"));
		
		// 나중에 필요한거 더 추가........

		ModelAndView mv = new ModelAndView("camp/camp_detail");
		mv.addObject("cvo", cvo);
		return mv;
	}
}