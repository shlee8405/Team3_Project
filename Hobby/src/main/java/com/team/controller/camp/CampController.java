package com.team.controller.camp;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.team.camp.service.CampService;
import com.team.camp.vo.CampVO;
import com.team.camp.vo.ReviewVO;

@RestController
public class CampController {
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private CampService campService;
	
	// 공통파라미터 전역 선언
	private final String targetUrl = "https://apis.data.go.kr/B551011/GoCamping";
	private final String serviceKey = "vftwTJlsPgy8Zr4yGFWel%2B0e54Ai6wRKua4w26fGz03gC5HqPtaQzeqWerg0kCB8f%2FpRosqM4JRLUq5Xvjel9A%3D%3D";
	private final String mobileOS = "ETC";
	private final String mobileApp = "MobileApp";
	
	
	// 캠핑장 리스트 가져오기(고캠핑 api basedList 호출)
	@GetMapping("/campList.do")
	public List<CampVO> getCampList(@RequestParam(defaultValue = "1") int pageNo) throws URISyntaxException {
		
		// 리퀘스트 파라미터
		int numOfRows = 6; 	// 보여줄 리스트 개수
		
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
			
			CampVO cvo = new CampVO();
			cvo.setFacltNm(oneItem.getString("facltNm"));
			
			//averageRating 값을 반올림하여 정수값으로 변환
			double rawAverageRating = campService.getAverageRating(cvo.getFacltNm());			
			int averageRating = (int) Math.round(rawAverageRating);
			
			cvo.setFirstImageUrl(oneItem.getString("firstImageUrl"));
			cvo.setAddr1(oneItem.getString("addr1"));
			cvo.setDoNm(oneItem.getString("doNm"));
			cvo.setAverageRating(averageRating);
			dataList.add(cvo);
			
		}
		return dataList;
	}
	
	
	@GetMapping("/campMain.do")
	public ModelAndView goCampMain() {
		ModelAndView mv = new ModelAndView("camp/camp_list");
		return mv;
	}
	
	
	// 캠핑장 검색
	@GetMapping("/campSearch.do")
	public List<CampVO> getSearchList(@RequestParam(defaultValue = "1") int pageNo, @RequestParam String keyword) throws URISyntaxException, UnsupportedEncodingException {
			
			// 리퀘스트 파라미터
			int numOfRows = 6; 	// 보여줄 리스트 개수
			//int pageNo = 1; 	// 페이지 번호
			
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
			int searchResult = jsonResponse.getJSONObject("response").getJSONObject("body").getInt("numOfRows");
			
			
			// CampVO타입으로 dataList라는 빈 배열 선언
			List<CampVO> dataList = new ArrayList<>();
			
			if (pageNo == 1 && searchResult == 0) {
				// 검색 결과가 없는 경우
			    CampVO cvo = new CampVO();
			    cvo.setMessage("검색 결과가 없습니다.");
			    dataList.add(cvo);
			    return dataList;

			} else if (pageNo > 1 && searchResult == 0) {
				//겸색 결과는 있는데 마지막 페이지인 경우
			    CampVO cvo = new CampVO();
			    cvo.setMessage("마지막 페이지 입니다.");
			    dataList.add(cvo);
			    return dataList;
			}
			
			// searchResult가 0보다 큰 경우 = 검색 결과 있음
			JSONArray item = jsonResponse.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
			
			for (int i = 0; i < item.length(); i++) {
				JSONObject oneItem = item.getJSONObject(i);

				CampVO cvo = new CampVO();
				cvo.setFacltNm(oneItem.getString("facltNm"));
				
				//averageRating 값을 반올림하여 정수값으로 변환
				double rawAverageRating = campService.getAverageRating(cvo.getFacltNm());			
				int averageRating = (int) Math.round(rawAverageRating);
				
				cvo.setIntro(oneItem.getString("intro"));
				cvo.setAddr1(oneItem.getString("addr1"));
				cvo.setFirstImageUrl(oneItem.getString("firstImageUrl"));
				cvo.setDoNm(oneItem.getString("doNm"));
				cvo.setAverageRating(averageRating);
				dataList.add(cvo);
			}
			
			
			//ModelAndView mv = new ModelAndView("camp/camp_list");
			//mv.addObject("dataList", dataList);
			return dataList;
		}
	
	
	// 캠핑장 베스트3
		@GetMapping("/campBest.do")
		public List<CampVO> getTop3Camps() throws URISyntaxException, UnsupportedEncodingException {
		    //Map<String, Object> response = new HashMap<>();
		    List<String> bestCampNames = campService.getBest3(); // 상위 3개 캠핑장 이름 가져오기

		    List<CampVO> bestDataList = new ArrayList<>();

		    for (String campName : bestCampNames) {
		        // API 호출 로직
		        String apiUrl = targetUrl + "/searchList"
		                + "?numOfRows=" + 1 // 한 건만 가져올 것이므로 numOfRows는 1
		                + "&pageNo=" + 1
		                + "&MobileOS=" + mobileOS
		                + "&MobileApp=" + mobileApp
		                + "&serviceKey=" + serviceKey
		                + "&_type=json"
		                + "&keyword=" + URLEncoder.encode(campName, StandardCharsets.UTF_8.toString());

		        URI uri = new URI(apiUrl);
		        ResponseEntity<String> apiResponse = restTemplate.getForEntity(uri, String.class);

		        JSONObject jsonResponse = new JSONObject(apiResponse.getBody());

		        JSONArray items = jsonResponse.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");

		        // 첫번째 아이템 가져오기 (우리는 numOfRows를 1로 설정했으므로 하나만 있다)
		        JSONObject oneItem = items.getJSONObject(0);

		        // 정보 추출 및 CampVO 객체 생성
		        CampVO cvo = new CampVO();
				cvo.setFacltNm(oneItem.getString("facltNm"));
				
				//averageRating 값을 반올림하여 정수값으로 변환
				double rawAverageRating = campService.getAverageRating(cvo.getFacltNm());			
				int averageRating = (int) Math.round(rawAverageRating);
				
				cvo.setIntro(oneItem.getString("intro"));
				cvo.setAddr1(oneItem.getString("addr1"));
				cvo.setFirstImageUrl(oneItem.getString("firstImageUrl"));
				cvo.setDoNm(oneItem.getString("doNm"));
				cvo.setAverageRating(averageRating);

		        // CampVO 객체를 리스트에 추가
		        bestDataList.add(cvo);
		    }

		    //response.put("bestCamps", bestDataList);
		    return bestDataList;
		}
		

	
	// 캠핑장 상세보기 호출하기
	@GetMapping("/campDetail.do")
	public ModelAndView getCampDetail(@RequestParam String keyword, HttpServletRequest request) 
			throws URISyntaxException, UnsupportedEncodingException {
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		
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
		cvo.setIntro(firstData.getString("intro"));
		cvo.setFeatureNm(firstData.getString("featureNm"));
		cvo.setMapX(firstData.getString("mapX"));
		cvo.setMapY(firstData.getString("mapY"));
		
		// 나중에 필요한거 더 추가........

		// DB에 저장된 좋아요 수를 가져와서 화면에 보낸다.
		int likesCount = campService.getLikes(cvo.getFacltNm());
		cvo.setLikesCount(likesCount);
		
		// 찜하기 수 가져오기
		int wishCount = campService.getWish(cvo.getFacltNm());
		cvo.setWishCount(wishCount);
		
		// 후기와 별점 가져오기
	    List<ReviewVO> reviews = campService.getReviews(cvo.getFacltNm());
	    
	    // 날짜 형식 변경
	    SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
	    for(ReviewVO review : reviews) {
	    	Date creaDate = review.getCreated_date();
	    	String formattedDate = sdf.format(creaDate);
	    	review.setFormatted_date(formattedDate);
	    }
	    
	    //averageRating 값을 반올림하여 정수값으로 변환
	    double rawAverageRating = campService.getAverageRating(cvo.getFacltNm());
	    
	    System.out.println("평균별점:::" + rawAverageRating);
	    
	    int averageRating = (int) Math.round(rawAverageRating);

	    System.out.println("reviews" + reviews);
	    ModelAndView mv = new ModelAndView("camp/camp_detail");
		mv.addObject("cvo", cvo);
	    mv.addObject("reviews", reviews);
	    mv.addObject("averageRating", averageRating);
	    mv.addObject("sessionUidx", u_idx);
		return mv;
	}
	
	// 후기 추가
	@PostMapping("/addReview.do")
	public ModelAndView addReview(@RequestParam String facltNm, @RequestParam String comment, @RequestParam int rating, 
			HttpServletRequest request) {
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");

	    campService.addReview(facltNm, u_idx, comment, rating);
	    String encodedFacltNm = URLEncoder.encode(facltNm, StandardCharsets.UTF_8);
	    
	    ModelAndView mv = new ModelAndView("redirect:/campDetail.do?keyword=" + encodedFacltNm + "&showReviews=true");
	    mv.addObject("scrollToReviews", true);  // 후기 섹션으로 스크롤하는 플래그를 설정
	    return mv; // 후기가 추가된 후 다시 해당 캠핑장 상세 페이지로 리다이렉트
	}
	
	// 후기 삭제
	@PostMapping("/deleteReview.do")
	public ModelAndView deleteReview(@RequestParam String facltNm, @RequestParam int id, HttpServletRequest request) {
	    String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		campService.deleteReview(id, u_idx);
		String encodedFacltNm = URLEncoder.encode(facltNm, StandardCharsets.UTF_8);
		ModelAndView mv = new ModelAndView("redirect:/campDetail.do?keyword=" + encodedFacltNm);

		    return mv;
		}
}