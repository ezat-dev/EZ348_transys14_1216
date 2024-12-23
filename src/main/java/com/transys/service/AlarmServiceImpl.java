package com.transys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.transys.dao.AlarmDao;
import com.transys.domain.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired
    private AlarmDao alarmDao;

    @Override
    public List<Alarm> getAlarmSummary(Alarm params) {
        return alarmDao.getAlarmSummary(params); 
    }
    @Override
    public List<Alarm> getAlarmList(Alarm params) {
        return alarmDao.getAlarmList(params); 
    }
    @Override
    public List<Alarm> getAlarmInfo(Alarm alarm) {
        return alarmDao.getAlarmInfo(alarm); 
    }
    

}
