package com.transys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.controller.MainController;
import com.transys.domain.PlcWrite;

@Repository
public class PlcWriteDaoImpl implements PlcWriteDao{
	
    @Resource(name="session")
    private SqlSession sqlSession;
	
	@Resource(name="sessionEZ")
	private SqlSession sqlSessionEz;   
	
	@Resource(name="sessionOracle")
	private SqlSession sqlSessionOracle;


	public SqlSession sessionReturn() {
		SqlSession ss = null;
		if(!MainController.mssqlSearchChk) {
			ss = sqlSession;
		}else {
			ss = sqlSessionEz;
		}
		
		return ss;
	}


	@Override
	public PlcWrite getPlcWriteWorkData() {
		return sessionReturn().selectOne("plcWrite.getPlcWriteWorkData");
	}


	@Override
	public void setPlcWriteDataUpdate(PlcWrite plcWrite) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {			
    		sqlSession.update("plcWrite.setPlcWriteDataUpdate",plcWrite);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {			
    		sqlSessionEz.update("plcWrite.setPlcWriteDataUpdate",plcWrite);
    	}
	}


	@Override
	public void setPlcWriteProc(PlcWrite plcWrite) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {		
    		sqlSession.update("plcWrite.setPlcWriteProc",plcWrite);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {		
    		sqlSessionEz.update("plcWrite.setPlcWriteProc",plcWrite);
    	}
	}


	@Override
	public void setPlcWriteDataDelete(PlcWrite work) {
		sqlSessionOracle.delete("plcWrite.setPlcWriteDataDelete",work);
	}

}
