package com.transys.service;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.transys.dao.TrackingDao;
import com.transys.domain.Tracking;
import com.transys.util.OpcDataMap;

@Service
public class TrackingServiceImpl5 implements TrackingService5{
	
	@Autowired
	private TrackingDao trackingDao;
	
	private static final Logger logger = LoggerFactory.getLogger(TrackingServiceImpl5.class);
	
	
	public void trackingDataSet(int curLocation, String setDataDir) 
			throws InterruptedException, ExecutionException {
		OpcDataMap opcDataMap = new OpcDataMap();
		
		Map<String, JSONArray> dataMap = opcDataMap.getOpcDataListMap2(setDataDir);
				
		JSONArray rowsArray = dataMap.get("dataList");			
		
		Tracking tracking = new Tracking();
		String pumBun = "0000";
		int prdChk = 0;
		StringBuffer desc = new StringBuffer();
		short resetValue = 0;
		for(int i=0; i<rowsArray.size(); i++) {
			JSONObject rowObj = (JSONObject) rowsArray.get(i);
			
			String tagName = rowObj.get("tagName").toString();
			String value = rowObj.get("value").toString();
			
			if("PUMBUN".equals(tagName)) {
				pumBun = String.format("%04d",Integer.parseInt(value));
				tracking.setPumbun(pumBun);				
			}
			
			if("DEVICE".equals(tagName)) {
				tracking.setDevicecode(value);
			}
			// && "1".equals(value)
			if("PRD_CHK".equals(tagName) && "1".equals(value)) {			
				tracking.setCurLocation(curLocation);
				prdChk = Integer.parseInt(value);
			}
		
		}
		
		//DB저장
		if(curLocation < 12) {
			if(!"0000".equals(tracking.getPumbun()) && tracking.getPumbun() != null && prdChk != 0) {
				Tracking trackingReturn = trackingDao.trackingLocationReturn(tracking);
				
				if(trackingReturn != null) {
					desc.append("설비 : "+tracking.getDevicecode()+"// ");
					desc.append("품번 : "+tracking.getPumbun()+"// ");
					desc.append("이동위치 : "+tracking.getCurLocation()+"// ");
					desc.append("현재위치 : "+trackingReturn.getCurLocation()+"// ");
					desc.append("OPC태그 : "+setDataDir);	
					
					logger.info("TRACKING(14호기) : {}",desc.toString());					
					//트래킹 실행
					trackingDao.ccf1Tracking01(tracking);
					//지연시간 0.3초
					Thread.sleep(300);
					
					
					//트래킹처리 후 PRD_CHK_01 0으로 변경
					opcDataMap.setOpcData(setDataDir+".PRD_CHK", resetValue);
				}
			}
		}else {
			if(!"0000".equals(tracking.getPumbun()) && tracking.getPumbun() != null && prdChk != 0) {
				tracking.setCurLocation(12);
				Tracking trackingReturn = trackingDao.trackingLocationReturn(tracking);
				
				if(trackingReturn != null) {
					desc.append("설비 : "+tracking.getDevicecode()+"// ");
					desc.append("품번 : "+tracking.getPumbun()+"// ");
					desc.append("이동위치 : "+tracking.getCurLocation()+"// ");
					desc.append("현재위치 : "+trackingReturn.getCurLocation()+"// ");
					desc.append("OPC태그 : "+setDataDir);
					
					logger.info("TRACKING(14호기) : {}",desc.toString());					
					//트래킹 실행
					trackingDao.ccf1Tracking01(tracking);
					//지연시간 0.3초
					Thread.sleep(300);
					
					
					//트래킹처리 후 PRD_CHK_01 0으로 변경
					opcDataMap.setOpcData(setDataDir+".PRD_CHK", resetValue);
				}
			}			
		}
		
	}

	//[10]세정장입 : NO.1 세정기 DIPS조 처리품
	@Override
	public void cm1Tracking10_1() throws InterruptedException, ExecutionException {
		
		String setDataDir = "Transys.TRACKING.CM01.C10_1";
				
		trackingDataSet(10,setDataDir);
	}


	//[10]세정장입 : NO.2 세정기 DIPS조 처리품
	@Override
	public void cm1Tracking10_2() throws InterruptedException, ExecutionException {
		
		String setDataDir = "Transys.TRACKING.CM01.C10_2";
				
		trackingDataSet(10,setDataDir);
	}


	//[11]소려로 장입 : 소려로 로내 (1)처리품
	@Override
	public void cm1Tracking11_1() throws InterruptedException, ExecutionException {
		
		String setDataDir = "Transys.TRACKING.CM01.C11_1";
				
		trackingDataSet(11,setDataDir);
	}


	//[11]소려로 장입 : 소려로 로내 (2)처리품
	@Override
	public void cm1Tracking11_2() throws InterruptedException, ExecutionException {
		
		String setDataDir = "Transys.TRACKING.CM01.C11_2";
				
		trackingDataSet(11,setDataDir);	
	}



	@Override
	public void cm1Tracking12() throws InterruptedException, ExecutionException {
		
		String setDataDir = "Transys.TRACKING.CM01.C12";
				
		trackingDataSet(12,setDataDir);	
	}	
}
