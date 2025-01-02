package com.transys.service;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.transys.controller.MainController;
import com.transys.dao.PlcWriteDao;
import com.transys.domain.PlcWrite;
import com.transys.util.OpcDataMap;

@Service
public class PlcWriteServiceImpl implements PlcWriteService{
	
	@Autowired
	private PlcWriteDao plcWriteDao;
	
	private final Logger logger = LoggerFactory.getLogger(PlcWriteServiceImpl.class);
	
	//PLCWRITE(1~4호기)
	public void plcWrite() throws InterruptedException, ExecutionException {
//		System.out.println("PLCWRITE ");
		OpcDataMap opcData = new OpcDataMap();
		StringBuffer desc = new StringBuffer();
		//DB데이터 조회 (t_waitlist)
		PlcWrite plcWrite = plcWriteDao.getPlcWriteWorkData();

		Thread.sleep(500);
		short resetValue = 1;
//		desc.append("");
//		logger.info("PLCWRITE 조회중 {}", desc.toString());
		//가져온 행의 값이 있을때만
		String list_year = "";
//		System.out.println("list_year 11 : "+list_year);
		if(plcWrite != null) {
			if(!"".equals(plcWrite.getList_year()) && plcWrite.getList_year() != null) {
				list_year = plcWrite.getList_year();
				
				desc.append("PLCWRITE - ");
				desc.append("CYCLENO : "+plcWrite.getCycleno()+"// ");
				desc.append("PUMBUN : "+plcWrite.getPumbun()+"// ");
				desc.append("AGITATE_RPM : "+plcWrite.getAgitate_rpm()+"// ");
				desc.append("DEVICECODE : "+plcWrite.getDevicecode());
				
				
				
				logger.info("PLCWRITE(14호기) : {}",desc.toString());
				opcData.setOpcData("Transys.PLCWRITE.CM01.CYCLENO", plcWrite.getCycleno());
				opcData.setOpcData("Transys.PLCWRITE.CM01.PUMBUN", Short.parseShort(plcWrite.getPumbun()));
				opcData.setOpcData("Transys.PLCWRITE.CM01.AGITATE_RPM", plcWrite.getAgitate_rpm());
				opcData.setOpcData("Transys.PLCWRITE.CM01.DEVICECODE", Short.parseShort(plcWrite.getDevicecode()));
				opcData.setOpcData("Transys.PLCWRITE.CM01.PRD_GB", resetValue);
				
				Thread.sleep(500);
	
				opcData.setOpcData("Transys.PLCWRITE.CM01.CYCLENO", plcWrite.getCycleno());
				opcData.setOpcData("Transys.PLCWRITE.CM01.PUMBUN", Short.parseShort(plcWrite.getPumbun()));
				opcData.setOpcData("Transys.PLCWRITE.CM01.AGITATE_RPM", plcWrite.getAgitate_rpm());
				opcData.setOpcData("Transys.PLCWRITE.CM01.DEVICECODE", Short.parseShort(plcWrite.getDevicecode()));
				opcData.setOpcData("Transys.PLCWRITE.CM01.PRD_GB", resetValue);

				//DB값 업데이트 (t_waitlist)
				plcWriteDao.setPlcWriteDataUpdate(plcWrite);
	
				
				Thread.sleep(200);
				//DB 프로시저 실행(TRACKING_PROC00)
				plcWriteDao.setPlcWriteProc(plcWrite);
				
				Thread.sleep(200);
				//DB값 삭제 (OUTPUT_TAB)
				plcWriteDao.setPlcWriteDataDelete(plcWrite);
				
				//각 설비에 해당되는 outPutChk값 false
				int device = Integer.parseInt(plcWrite.getDevicecode());
				
				switch (device) {
					case 1 : MainController.outPutChk1 = false; break;
					case 2 : MainController.outPutChk2 = false; break;
					case 3 : MainController.outPutChk3 = false; break;
					case 4 : MainController.outPutChk4 = false; break;
				}
				Thread.sleep(200);
				desc.append("-> 완료");
				logger.info("PLCWRITE(14호기) : {}",desc.toString());			
			}
		}
	}
		
	//침탄1~4호기, 공통1호기
	public void plcWriteTimer() throws InterruptedException, ExecutionException {
		String output_chk = "false";
		OpcDataMap opcData = new OpcDataMap();
		StringBuffer desc = new StringBuffer();
		//창고출고가능요구 1이면
		Map<String, Object> outputMap = opcData.getOpcData("Transys.PLCWRITE.CM01.OUTPUT_CHK");	//DB18.X41.5
		
		output_chk = outputMap.get("value").toString();
//		desc.append("창고출고가능요구 신호 : "+output_chk);
//		logger.info("PLCWRITE - {}",desc.toString());
		if("true".equals(output_chk)) {
			
			plcWrite();
		}
	}
	
	
}
