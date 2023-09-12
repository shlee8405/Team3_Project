package com.team.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team.qna.service.QnaService;

@Controller
public class qna {

	@Autowired
	private QnaService qnaService;
	
	
	
}
