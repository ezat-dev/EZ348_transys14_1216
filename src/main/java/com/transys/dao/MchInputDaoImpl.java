package com.transys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.controller.MainController;
import com.transys.domain.MchInput;

@Repository
public class MchInputDaoImpl implements MchInputDao{
	
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
	public MchInput getMchInputDataSelectWorkInline(MchInput mchInput) {
		return sessionReturn().selectOne("mchInput.getMchInputDataSelectWorkInline", mchInput);
	}


	@Override
	public void setMchDataInsertInputTab(MchInput mchInput) {
		sqlSessionOracle.insert("mchInput.setMchDataInsertInputTab",mchInput);
	}


	@Override
	public void setMchDataUpdateWaitList(MchInput mchInput) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {		
    		sqlSession.update("mchInput.setMchDataUpdateWaitList", mchInput);
    	}

    	//EZ
    	if(MainController.mssqlEZChk) {		
    		sqlSessionEz.update("mchInput.setMchDataUpdateWaitList", mchInput);
    	}
	}


	@Override
	public void setMchDataUpdateSiljuk(MchInput mchInput) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {			
    		sqlSession.update("mchInput.setMchDataUpdateSiljuk", mchInput);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {			
    		sqlSessionEz.update("mchInput.setMchDataUpdateSiljuk", mchInput);
    	}
	}


	@Override
	public void setMchDataDeleteWorkInline(MchInput mchInput) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {			
    		sqlSession.delete("mchInput.setMchDataDeleteWorkInline", mchInput);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {			
    		sqlSessionEz.delete("mchInput.setMchDataDeleteWorkInline", mchInput);
    	}
	}


	@Override
	public void setMchDataInsertInputTabFail(MchInput mchInput) {
		sqlSessionOracle.insert("mchInput.setMchDataInsertInputTabFail",mchInput);
	}


	@Override
	public void setMchDataUpdateSiljukFail(MchInput mchInput) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {		
    		sqlSession.update("mchInput.setMchDataUpdateSiljukFail", mchInput);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {		
    		sqlSessionEz.update("mchInput.setMchDataUpdateSiljukFail", mchInput);
    	}
    	
	}


	@Override
	public void setMchDataDeleteWorkInlineFail(MchInput mchInput) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {			
    		sqlSession.delete("mchInput.setMchDataDeleteWorkInlineFail", mchInput);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {			
    		sqlSessionEz.delete("mchInput.setMchDataDeleteWorkInlineFail", mchInput);
    	}
    	
	}
}
