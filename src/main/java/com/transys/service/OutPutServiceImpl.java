package com.transys.service;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.transys.controller.MainController;
import com.transys.dao.OutPutDao;
import com.transys.domain.OutPut;
import com.transys.util.OpcDataMap;

@Service
public class OutPutServiceImpl implements OutPutService{

	@Autowired
	private OutPutDao outPutDao;
	
	private static final Logger logger = LoggerFactory.getLogger(OutPutServiceImpl.class);

	@Override
	public void outPut(int devicecode) {
		OutPut paramOutPut = new OutPut();
		paramOutPut.setFireno(devicecode+"");
		//파라미터로 받은 설비로 status값 조회
		StringBuffer desc = new StringBuffer();
		OutPut outPut = outPutDao.getOutPutDeviceStatus(paramOutPut);
		
		if(outPut == null) {
			//status값 0이라면
			//OUTPUT_TAB에 INSERT
			
			switch(devicecode) {
				case 1: MainController.outPutChk1 = true;
						desc.append(devicecode+"호기 출고요청 완료");
				break;
				case 2: MainController.outPutChk2 = true;
						desc.append(devicecode+"호기 출고요청 완료");
				break;
				case 3: MainController.outPutChk3 = true;
						desc.append(devicecode+"호기 출고요청 완료");
				break;
				case 4: MainController.outPutChk4 = true;
						desc.append(devicecode+"호기 출고요청 완료");
				break;
			}
			
			outPutDao.setOutPutSend(paramOutPut);
			logger.info("OUTPUT(14호기) : {}",desc.toString());				
		}
	}

	//침탄 1~4호기
	@Override
	public void outPutTimer() throws InterruptedException, ExecutionException {
		//설비별 출고요청 가능신호
		String hogi1 = "false";
		String hogi2 = "false";
		String hogi3 = "false";
		String hogi4 = "false";

		//설비별 출고제품 체크
		String hogi1Prd = "0";
		String hogi2Prd = "0";
		String hogi3Prd = "0";
		String hogi4Prd = "0";
		String outputCancel = "false";
		
		//창고 출고가능 요구신호
		int outContinue = 0;
		
		//각 설비별 출고요청가능 신호 받기
		OpcDataMap opcData = new OpcDataMap();
		//창고출고가능요구 1이면
		Map<String, Object> hogi1Map = opcData.getOpcData("Transys.OUTPUT.CM01.HOGI1");
		Map<String, Object> hogi2Map = opcData.getOpcData("Transys.OUTPUT.CM01.HOGI2");
		Map<String, Object> hogi3Map = opcData.getOpcData("Transys.OUTPUT.CM01.HOGI3");
		Map<String, Object> hogi4Map = opcData.getOpcData("Transys.OUTPUT.CM01.HOGI4");
		
		//창고 출고요청취소 신호
		Map<String, Object> outputCancelMap = opcData.getOpcData("Transys.OUTPUT.CM01.OUTPUT_CANCEL");
		Thread.sleep(300);
		
		hogi1 = hogi1Map.get("value").toString();
		hogi2 = hogi2Map.get("value").toString();
		hogi3 = hogi3Map.get("value").toString();
		hogi4 = hogi4Map.get("value").toString();
		outputCancel = outputCancelMap.get("value").toString();

		//
		Map<String, Object> hogi1PrdMap = opcData.getOpcData("Transys.OUTPUT.CM01.HOGI1_PRD");
		Map<String, Object> hogi2PrdMap = opcData.getOpcData("Transys.OUTPUT.CM01.HOGI2_PRD");
		Map<String, Object> hogi3PrdMap = opcData.getOpcData("Transys.OUTPUT.CM01.HOGI3_PRD");
		Map<String, Object> hogi4PrdMap = opcData.getOpcData("Transys.OUTPUT.CM01.HOGI4_PRD");
		Thread.sleep(300);
		
		hogi1Prd = hogi1PrdMap.get("value").toString();
		hogi2Prd = hogi2PrdMap.get("value").toString();
		hogi3Prd = hogi3PrdMap.get("value").toString();
		hogi4Prd = hogi4PrdMap.get("value").toString();	
		
		StringBuffer desc = new StringBuffer();
		desc.append("hogi1 : "+hogi1+"// hogi2 : "+hogi2+"// hogi3 : "+hogi3+"// hogi4 : "+hogi4);
		desc.append("hogi1Prd : "+hogi1Prd+"// hogi2Prd : "+hogi2Prd+"// hogi3Prd : "+hogi3Prd+"// hogi4Prd : "+hogi4Prd);
		
		Map<String, Object> outContinueMap = opcData.getOpcData("Transys.PLCWRITE.CM01.DEVICECODE");
		
		outContinue = Integer.parseInt(outContinueMap.get("value").toString());
		desc.append("outContinue : "+outContinue+"// ");
//		logger.info("OUTPUT {}",desc.toString());
		//출고요청신호 확인시 1이면
		
		//출고요청취소 신호 들어올경우
		if("true".equals(outputCancel)) {
			outPutDao.outputCancel();
			opcData.setOpcData("Transys.OUTPUT.CM01.OUTPUT_CANCEL", false);
			MainController.outPutChk1 = false;
			MainController.outPutChk2 = false;
			MainController.outPutChk3 = false;
			MainController.outPutChk4 = false;
		}
		
		//1호기
		if("true".equals(hogi1)) {
			desc = new StringBuffer();
			desc.append("hogi1 : "+hogi1+"// ");			
			//화물 위치체크
			if("0".equals(hogi1Prd)) {
				desc.append("hogi1Prd : "+hogi1Prd+"// ");				
				//PLCWRITE의 설비값이 0일때
				if(outContinue == 0) {
					desc.append("outContinue : "+outContinue+"// ");
					desc.append("MainController.outPutChk1 : "+MainController.outPutChk1+"// ");
					
					logger.info("OUTPUT : {} ",desc.toString());					
					if(!MainController.outPutChk1) {
						desc.append("MainController.outPutChk1 ** : "+MainController.outPutChk1+"// ");
						logger.info("OUTPUT : {} ",desc.toString());						
						outPut(1);
					}
				}
			}
		}
		
		//2호기
		if("true".equals(hogi2)) {

			//화물 위치체크
			if("0".equals(hogi2Prd)) {

				//PLCWRITE의 설비값이 0일때
				if(outContinue == 0) {

					if(!MainController.outPutChk2) {

						outPut(2);
					}
				}
			}
		}
		
		//3호기
		if("true".equals(hogi3)) {
			//화물 위치체크
			if("0".equals(hogi3Prd)){
				//PLCWRITE의 설비값이 0일때
				if(outContinue == 0) {
					if(!MainController.outPutChk3) {
						outPut(3);
					}
				}
			}
		}
		
		//4호기
		if("true".equals(hogi4)) {
			//화물 위치체크
			if("0".equals(hogi4Prd)) {
				//PLCWRITE의 설비값이 0일때
				if(outContinue == 0) {
					if(!MainController.outPutChk4) {
						outPut(4);
					}
				}
			}
		}
		
		
	}
}
