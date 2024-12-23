package com.transys.service;

import java.util.List;

import com.transys.domain.Alarm;

public interface AlarmService {
	
	 List<Alarm> getAlarmSummary(Alarm alarm); 
	 List<Alarm> getAlarmList(Alarm params); 
	 List<Alarm> getAlarmInfo(Alarm alarm); 
}
	


