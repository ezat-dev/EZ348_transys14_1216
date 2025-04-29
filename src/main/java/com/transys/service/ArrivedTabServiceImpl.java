package com.transys.service;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.transys.dao.ArrivedTabDao;
import com.transys.domain.ArrivedTab;
import com.transys.domain.Product;

@Service
public class ArrivedTabServiceImpl implements ArrivedTabService{

	@Autowired
	private ArrivedTabDao arrivedTabDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ArrivedTabServiceImpl.class);
	
	@Override
	public void arrivedTabTimer() throws InterruptedException, ExecutionException {
		
		StringBuffer desc = new StringBuffer();
		//오라클 ARRIVED_TAB 데이터 조회
		List<ArrivedTab> arrivedTabList = arrivedTabDao.getArrivedTabDataSelect();
		
		if(arrivedTabList.size() > 0) {
			desc.append("ORACLE arrived_tab 조회 수 : "+arrivedTabList.size());
			logger.info("ARRIVED_TAB 14호기- {}",desc.toString());
			for(ArrivedTab avt : arrivedTabList) {
				if(avt != null) {
					if(avt.getWorkdate() != null &&
							avt.getWorkdate().length() > 0) {
						
						//T_PRODUCT 데이터 조회
						Product product = arrivedTabDao.getArrivedTabProductSelect(avt);
						if(product != null) {
							desc.append("MSSQL T_PRODUCT 조회 : "+product.getDobun());
							logger.info("ARRIVED_TAB 14호기- {}",desc.toString());
							Thread.sleep(200);
							
							if(product.getDobun() != null) {
								desc.append("MSSQL T_PRODUCT 조회됨 ");
								//arrived_tab 데이터 있음.
								//arrived_tab 추가
								
								//ARRIVED_TAB 데이터 저장
								arrivedTabDao.setArrivedTabDataInsert(avt);
								desc.append("MSSQL arrived_tab INSERT 완료 ");
								
								//arrived_tab 삭제
								arrivedTabDao.setArrivedTabDataDelete(avt);
								desc.append("CODE : "+avt.getCode()+"// fireno : "+avt.getFireno()+"// workdate : "+avt.getWorkdate());
								desc.append("ORACLE arrived_tab DELETE 완료 ");
								logger.info("ARRIVED_TAB 14호기- {}",desc.toString());
							}
						}else {
							desc.append("MSSQL T_PRODUCT 데이터 없음. ");
						}
		
						
					}		
				}
			}
		}
	}

}
