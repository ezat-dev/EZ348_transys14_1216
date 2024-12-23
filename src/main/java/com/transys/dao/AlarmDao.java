package com.transys.dao;

import java.util.List;

import com.transys.domain.Alarm;

public interface AlarmDao {
	  List<Alarm> getAlarmSummary(Alarm alarm);
	  List<Alarm> getAlarmList(Alarm alarm);
	  List<Alarm> getAlarmInfo(Alarm alarm);
	  
}
