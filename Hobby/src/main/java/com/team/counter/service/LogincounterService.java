package com.team.counter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.counter.dao.LogincounterDAO;
import com.team.counter.vo.LCVO;

@Service
public class LogincounterService {
	@Autowired
	private LogincounterDAO logincounterDAO;
	
	public int loginCount() {
		return logincounterDAO.loginCount();
	}
	
	public List<LCVO> getLoginCount() {
		return logincounterDAO.getLoginCount();
	}
	
}
