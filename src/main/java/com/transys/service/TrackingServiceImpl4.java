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
public class TrackingServiceImpl4 implements TrackingService4{
	
	@Autowired
	private TrackingDao trackingDao;
	
	private static final Logger logger = LoggerFactory.getLogger(TrackingServiceImpl4.class);
	
	
	public void trackingDataSet(String devicecode, int curLocation, String setDataDir) 
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
				desc.append("실제 품번 : "+pumBun+"// ");
			}
			
			if("PRD".equals(tagName)) {
				desc.append("PRD 값 : "+value+"// ");
			}
			// && "1".equals(value)
			if("PRD_CHK".equals(tagName) && "1".equals(value)) {
				tracking.setDevicecode(devicecode);				
				tracking.setCurLocation(curLocation);
				desc.append("PRD_CHK 값 : "+value+"// ");
				prdChk = 1;
			}
		}
		
		//DB저장
		if(!"0000".equals(tracking.getPumbun()) && tracking.getPumbun() != null && prdChk != 0) {
			Tracking trackingReturn = trackingDao.trackingLocationReturn(tracking);
			
			if(trackingReturn != null) {
				desc.append("설비 : "+tracking.getDevicecode()+"// ");
				desc.append("품번 : "+tracking.getPumbun()+"// ");
				desc.append("이동위치 : "+tracking.getCurLocation()+"// ");
				desc.append("현재위치 : "+trackingReturn.getCurLocation()+"// ");
				desc.append("OPC태그 : "+setDataDir);							
				//트래킹 실행
				trackingDao.ccf1Tracking01(tracking);
				//지연시간 0.3초
				Thread.sleep(300);
				
				//트래킹처리 후 PRD_CHK_01 0으로 변경
				opcDataMap.setOpcData(setDataDir+".PRD_CHK", resetValue);
			}
		}
		
	}
	
	//[1]투입완료: 탈지로입구 리프트에 처리품이 위치할때
	public void ccf4Tracking01() throws InterruptedException, ExecutionException {
		//Transys.TRACKING.CCF04.C01의 하위태그 조회		
		String setDataDir = "Transys.TRACKING.CCF04.C01";
		
		//호기, 위치(순서), 태그경로
		trackingDataSet("4",1,setDataDir);
	}
	
	//[2]예열장입 : 처리품이 예열실에 도착할 때
	public void ccf4Tracking02() throws InterruptedException, ExecutionException {
		//Transys.TRACKING.CCF04.C02의 하위태그 조회		
		String setDataDir = "Transys.TRACKING.CCF04.C02";
	
		//호기, 위치(순서), 태그경로
		trackingDataSet("4",2,setDataDir);
	}
	
	//[3]침탄실(1) : 침탄 처리 시작위치
	public void ccf4Tracking03() throws InterruptedException, ExecutionException {
		//Transys.TRACKING.CCF04.C02의 하위태그 조회		
		String setDataDir = "Transys.TRACKING.CCF04.C03";
	
		//호기, 위치(순서), 태그경로
		trackingDataSet("4",3,setDataDir);
	}
	
	//[4]확산실(1) : 침탄 처리 종료 및 확산 처리 시작위치
	public void ccf4Tracking04() throws InterruptedException, ExecutionException {
		//Transys.TRACKING.CCF04.C02의 하위태그 조회		
		String setDataDir = "Transys.TRACKING.CCF04.C04";
		
		//호기, 위치(순서), 태그경로
		trackingDataSet("4",4,setDataDir);
	}
	
	//[5]냉각실(1) : 확산 처리 종료 위치
	public void ccf4Tracking05() throws InterruptedException, ExecutionException{
		
		String setDataDir = "Transys.TRACKING.CCF04.C05";
		
		trackingDataSet("4",5,setDataDir);
		
	}
	
	//[6]소입1실(1) : 소입 처리 시작 위치
	public void ccf4Tracking06() throws InterruptedException, ExecutionException{
			
		String setDataDir = "Transys.TRACKING.CCF04.C06";
			
		trackingDataSet("4",6,setDataDir);
			
	}
	
	//[7]소입2 추출 : 소입 처리 종료
	public void ccf4Tracking07() throws InterruptedException, ExecutionException{
				
		String setDataDir = "Transys.TRACKING.CCF04.C07";
				
		trackingDataSet("4",7,setDataDir);
				
	}
	
	//[8]SALT장입 : SALT 처리 시작위치
	public void ccf4Tracking08() throws InterruptedException, ExecutionException{
					
		String setDataDir = "Transys.TRACKING.CCF04.C08";
					
		trackingDataSet("4",8,setDataDir);
					
	}
	
	//[9]SALT추출 : 출구 리트리버 후퇴정지
	public void ccf4Tracking09() throws InterruptedException, ExecutionException{
						
		String setDataDir = "Transys.TRACKING.CCF04.C09";
						
		trackingDataSet("4",9,setDataDir);
						
	}	
}
