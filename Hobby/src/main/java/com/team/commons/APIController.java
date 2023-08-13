package com.team.commons;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.team.camp.vo.CampVO;

@Controller
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
	public ModelAndView getCampList() throws URISyntaxException {
		
		// 리퀘스트 파라미터
		int numOfRows = 30; // 보여줄 리스트 개수
		int pageNo = 1; 	// 페이지 번호
		
		String apiUrl = targetUrl + "/basedList"
				+ "?numOfRows=" + numOfRows
				+ "&pageNo=" + pageNo
				+ "&MobileOS=" + mobileOS
				+ "&MobileApp=" +  mobileApp
				+ "&serviceKey=" + serviceKey
				+ "&_type=json";
		
		System.out.println("apiUrl:: " + apiUrl);
		
		// 자바 URI클래스를 사용. URL전송 할 때 문자열 그대로 날아가는 것이 아닌 한번 인코딩 해서 보내준다.
		URI uri = new URI(apiUrl);
		
		ResponseEntity<String> response = restTemplate.getForEntity(uri, String.class);
		System.out.println("response:: " + response);
		
		//Body 정보만 필요하기 때문에
		JSONObject jsonResponse = new JSONObject(response.getBody());
		System.out.println("jsonResponse:: " + jsonResponse);
		
		JSONArray item = jsonResponse.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
		System.out.println("item:: " + item);
		
		// CampVO타입으로 dataList라는 빈 배열 선언
		List<CampVO> dataList = new ArrayList<>();
		
		for (int i = 0; i < item.length(); i++) {
			JSONObject oneItem = item.getJSONObject(i);
			
			CampVO cvo = new CampVO();
			cvo.setContentId(oneItem.getString("contentId"));
			cvo.setFacltNm(oneItem.getString("facltNm"));
			cvo.setFeatureNm(oneItem.getString("featureNm"));
			// 나중에 필요한거 더 추가........
			dataList.add(cvo);
		}
		
		ModelAndView mv = new ModelAndView("camp/camp");
		mv.addObject("dataList", dataList);
		return mv;
	}
}