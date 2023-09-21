package com.team.counter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.counter.dao.ViewcounterDAO;
import com.team.counter.vo.VCVO;

@Service
public class ViewcounterService {
	@Autowired
	private ViewcounterDAO viewcounterDAO;
	
	public int viewCount() {
		return viewcounterDAO.viewCount();
	}
	
	public VCVO getViewCount() {
		return viewcounterDAO.getViewCount();
	}
}
