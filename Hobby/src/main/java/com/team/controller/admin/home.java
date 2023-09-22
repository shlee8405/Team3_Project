package com.team.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.counter.service.LogincounterService;
import com.team.counter.service.ViewcounterService;
import com.team.counter.vo.LCVO;
import com.team.counter.vo.VCVO;
import com.team.user.service.UserService;

@Controller
public class home {

	@Autowired private UserService userService;
	
	@Autowired 
	private ViewcounterService viewcounterService;
	
	@Autowired
	private LogincounterService logincounterService;
	
	
	@GetMapping("/getviewcountlist")
	public ResponseEntity<List<Object>> getVCVOlist() {
//		System.out.println("inside /getviewcountlist");
		//총 조회수 데이터 생성
		List<VCVO> list = viewcounterService.getViewCount();
		List<String> dates = new ArrayList<String>();
		List<String> viewcount = new ArrayList<String>();
		for (VCVO vcvo : list) {
			dates.add(vcvo.getVc_date());
			viewcount.add(vcvo.getVc_count());
		}
		Map<String, List<String>> vcmap = new HashMap<>();
		vcmap.put("labels", dates);
		vcmap.put("datasets", viewcount);
		
		//로그인 수 데이터 생성
		List<LCVO> loginlist = logincounterService.getLoginCount();
		dates = new ArrayList<String>();
		List<String> logincount = new ArrayList<String>();
		for (LCVO lcvo : loginlist) {
			dates.add(lcvo.getLc_date());
			logincount.add(lcvo.getLc_count());
		}
		Map<String,List<String>> lcmap = new HashMap<>();
		lcmap.put("labels", dates);
		lcmap.put("datasets", logincount);
		
		
		
		
		
		// Object리스트 생성, 및 필요 list들 추가
		List<Object> objlist = new ArrayList<Object>();
		objlist.add(vcmap);
		objlist.add(lcmap);
		
		return ResponseEntity.ok(objlist);
	}
	
}
