package com.transys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.controller.MainController;
import com.transys.domain.Tracking;

@Repository
public class TrackingDaoImpl implements TrackingDao{
	
    @Resource(name="session")
    private SqlSession sqlSession;
	
	@Resource(name="sessionEZ")
	private SqlSession sqlSessionEz;   

	public SqlSession sessionReturn() {
		SqlSession ss = null;
		if(!MainController.mssqlEZChk) {
			ss = sqlSession;
		}else {
			ss = sqlSessionEz;
		}
		
		return ss;
	}
	
	
	@Override
	public void ccf1Tracking01(Tracking tracking) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) { 		
    		sqlSession.update("tracking.ccf1Tracking01", tracking);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) { 		
    		sqlSessionEz.update("tracking.ccf1Tracking01", tracking);
    	}
	}

	@Override
	public Tracking trackingLocationReturn(Tracking tracking) {
		return sessionReturn().selectOne("tracking.trackingLocationReturn", tracking);
	}

}
