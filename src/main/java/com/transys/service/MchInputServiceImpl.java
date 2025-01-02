package com.transys.service;

import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.apache.poi.util.SystemOutLogger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.transys.controller.MainController;
import com.transys.dao.MchInputDao;
import com.transys.domain.MchInput;
import com.transys.util.OpcDataMap;

@Service
public class MchInputServiceImpl implements MchInputService{
	
	@Autowired
	private MchInputDao mchInputDao;
	
	private final Logger logger = LoggerFactory.getLogger(MchInputServiceImpl.class);
	
	String savePumbun = "";
	String saveDevice = "";	
	
	public void mchInput(String plcPumbun, String plcDevice) throws InterruptedException, ExecutionException {
//		System.out.println("MCHINPUT ");
		String dbMesLot = "";
		String dbRemark = "";
		StringBuffer desc = new StringBuffer();		
		
		//품번이 0이 아닐때만
		if(!"0".equals(plcPumbun) && !"0".equals(plcDevice)) {
			
			//t_workinline에서 품번, 호기로 데이터 조회
			MchInput mchInput = new MchInput();
			mchInput.setPumbun(plcPumbun);
			mchInput.setDevicecode(plcDevice);
			
			desc.append("보내는 DEVICECODE : "+mchInput.getDevicecode()+"// ");
			desc.append("보내는 PUMBUN : "+mchInput.getPumbun()+"// ");			
			logger.info("MCHINPUT(14호기) : {}",desc.toString());	
			
			
			//t_workinline, t_product 조인쿼리 실행
			MchInput mchData = mchInputDao.getMchInputDataSelectWorkInline(mchInput);
			short resetValue = 0;

			//가져온 데이터가 있을때만
			if(mchData != null) {
				if(mchData.getRegtime() != null) {
					
					//위 조건이 else 일때만, MESLOT가 공백(널)이면 변수 공백으로
					if(mchData.getMeslot().length() == 0 || mchData.getMeslot() == null) {
						dbMesLot = " ";
					}else {
						dbMesLot = mchData.getMeslot();
					}
					if(mchData.getRemark() == null) {
						dbRemark = " ";
					}else {
						dbRemark = mchData.getRemark();
					}
					
					mchData.setMeslot(dbMesLot);
					mchData.setRemark(dbRemark);
					mchData.setDevicecode(plcDevice);

					desc.append("REGTIME : "+mchData.getRegtime()+"// ");
					desc.append("PUMBUN : "+mchData.getPumcode()+"// ");
					desc.append("DEVICECODE : "+mchData.getDevicecode()+"// ");
					desc.append("CYCLENO : "+mchData.getCycleno()+"// ");
					desc.append("AGITATE_RPM : "+mchData.getAgitate_rpm()+"// ");
					desc.append("MESLOT : "+mchData.getMeslot()+"// ");
					desc.append("REMARK : "+mchData.getRemark()+"// ");
					desc.append("LOADCNT : "+mchData.getLoadcnt()+"// ");
					desc.append("LOTNO : "+mchData.getLotno()+"// ");
					
					logger.info("MCHINPUT(14호기) : {}",desc.toString());
					
					//INPUT_TAB에 정상적인 데이터 INSERT
					mchInputDao.setMchDataInsertInputTab(mchData);
			
					String send1 = mchData.getPumcode();
					String send2 = mchData.getLotno();
					String send3 = mchData.getMeslot();
					String send4 = mchData.getLoadcnt()+"";
					
					//PLC값 0:출고대기, 1:작업중, 2:창고입고완료
					//t_waitlist에 PLC값 2로 업데이트
					mchInputDao.setMchDataUpdateWaitList(mchData);
			
					//t_siljuk테이블에 완료시간 업데이트
					mchInputDao.setMchDataUpdateSiljuk(mchData);
			
					//t_workinline에서 해당 호기의 품번 삭제
					mchInputDao.setMchDataDeleteWorkInline(mchData);
			
					OpcDataMap opcData = new OpcDataMap();
				
					//창고 입고내역 입력
					opcData.setOpcData("Transys.MCHINPUT.CM01.PUMCODE", send1);
					opcData.setOpcData("Transys.MCHINPUT.CM01.LOTNO", send2);
					opcData.setOpcData("Transys.MCHINPUT.CM01.MESLOT", send3);
					opcData.setOpcData("Transys.MCHINPUT.CM01.LOADCNT", send4);
					
					//창고 마지막 입고이력
					opcData.setOpcData("Transys.MCHINPUT.CM01.LAST_PUMBUN", Short.parseShort(plcPumbun));
					opcData.setOpcData("Transys.MCHINPUT.CM01.LAST_DEVICE", Short.parseShort(plcDevice));
					
					
					//화면의 표시값 초기화 (PLC값 등등)
					opcData.setOpcData("Transys.MCHINPUT.CM01.PUMBUN", resetValue);
					opcData.setOpcData("Transys.MCHINPUT.CM01.DEVICECODE", resetValue);
					
					//창고 입고신호 임시값
					opcData.setOpcData("Transys.MCHINPUT.CM01.MCHINPUT_CHK_TMP", false);
		
					//마지막 창고 입고내역
					desc.append("--> 입고완료");
					opcData.setOpcData("Transys.MCHINPUT.CM01.INPUT_COUNT", Short.parseShort(MainController.plcCount+""));
					logger.info("MCHINPUT(14호기) : {}",desc.toString());					
					
				}
			}else {
				//조회 카운터가 0이하이면 입고요청에러로 INPUT_TAB에 INSERT 후 리턴
				//카운트0 대신에 받아온 데이터가 null로 구분
				MchInput mchTemp = new MchInput();
				mchTemp.setDevicecode(mchInput.getDevicecode());
				mchInputDao.setMchDataInsertInputTabFail(mchTemp);
			}
			
			
			//t_workinline에 데이터가 없어도
			//t_waitlist 업데이트, t_workinline 딜리트
			//오늘날짜 - 5일 이전의 waitlist 업데이트
			mchInputDao.setMchDataUpdateSiljukFail(mchData);
			
			//오늘날짜 -5일 이전의 workinline 딜리트
			mchInputDao.setMchDataDeleteWorkInlineFail(mchData);
		}
	}

	public void mchInputTimer() throws InterruptedException, ExecutionException {
		OpcDataMap opcDataMap = new OpcDataMap();
		String dbMesLot = "";
		StringBuffer desc = new StringBuffer();
		
		//품번, 호기값 조회
		Map<String, Object> pumbunMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.PUMBUN");		//DB1.DBW804
		Map<String, Object> deviceMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.DEVICECODE");	//DB1.DBW808
		
		String plcPumbun = pumbunMap.get("value").toString();
		String plcDevice = deviceMap.get("value").toString();
		
		//제품추출요구 신호
		String mchInputChk = "false";
		Map<String, Object> mchInputMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.MCHINPUT_CHK");	//DB18.X41.4
//		Map<String, Object> mchInputMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.MCHINPUT_CHK_TMP");	//가상태그		
		
		mchInputChk = mchInputMap.get("value").toString();
		
		//제품 강제입고처리 신호
		short resetValue = 0;
		String mchInputForceChk = "false";
		Map<String, Object> mchInputForceMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.INPUT_FORCE");
		
		mchInputForceChk = mchInputForceMap.get("value").toString();
		Map<String, Object> pumbunWaitMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.WAIT_PUMBUN");		//DB1.DBW804
		Map<String, Object> deviceWaitMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.WAIT_DEVICE");	//DB1.DBW808		
		
		String plcWaitPumbun = pumbunWaitMap.get("value").toString();
		String plcWaitDevice = deviceWaitMap.get("value").toString();

		
		if(!"0".equals(plcPumbun) && plcPumbun.length() > 0) {
			//4자리 포맷으로 만들기 품번이 4면 0004
			savePumbun = String.format("%04d",Integer.parseInt(plcPumbun));
		}
		
		if(!"0".equals(plcDevice) && plcDevice.length() > 0) {
			saveDevice = plcDevice;
		}
		
		//강제입고처리 진행
		if("true".equals(mchInputForceChk)) {
			
			if(!"0".equals(plcWaitPumbun) && plcWaitPumbun.length() > 0) {
				//4자리 포맷으로 만들기 품번이 4면 0004
				savePumbun = String.format("%04d",Integer.parseInt(plcWaitPumbun));
			}
			
			if(!"0".equals(plcWaitDevice) && plcWaitDevice.length() > 0) {
				saveDevice = plcWaitDevice;
			}
			
			Map<String, Object> plcCountMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.INPUT_COUNT");	//가상태그
			
			//PLC 창고입고카운트 1증가
			MainController.plcCount = Integer.parseInt(plcCountMap.get("value").toString());			
			MainController.plcCount++;
			
	        //txt_INPUT1 값이 txt_INPUT 값보다 먼저 삭제되는 경우가 발생하여 변수로 저장한 값으로 비교(이동진 수정 : 2012.09.07)
			if(!"0".equals(savePumbun) && !"0".equals(saveDevice)) {
				
				mchInput(savePumbun, saveDevice);
			}else {
				//로그남기기(입고등록 중단)
			}
			
			opcDataMap.setOpcData("Transys.MCHINPUT.CM01.INPUT_FORCE", false);
			opcDataMap.setOpcData("Transys.MCHINPUT.CM01.WAIT_PUMBUN", resetValue);
			opcDataMap.setOpcData("Transys.MCHINPUT.CM01.WAIT_DEVICE", resetValue);
		}
		
		if("true".equals(mchInputChk)) {
//			desc.append("PUMBUN : "+savePumbun+"// ");
//			desc.append("DEVICECODE : "+saveDevice+"// ");
			
//			logger.info("MCHINPUT(14호기) : {}",desc.toString());					
			
			Map<String, Object> plcCountMap = opcDataMap.getOpcData("Transys.MCHINPUT.CM01.INPUT_COUNT");	//가상태그
			
			//PLC 창고입고카운트 1증가
			MainController.plcCount = Integer.parseInt(plcCountMap.get("value").toString());			
			MainController.plcCount++;
			
	        //txt_INPUT1 값이 txt_INPUT 값보다 먼저 삭제되는 경우가 발생하여 변수로 저장한 값으로 비교(이동진 수정 : 2012.09.07)
			if(!"0".equals(savePumbun) && !"0".equals(saveDevice)) {
				
				mchInput(savePumbun, saveDevice);
				
			}else {
				//로그남기기(입고등록 중단)
			}
			
		}
		

	}
	
}
