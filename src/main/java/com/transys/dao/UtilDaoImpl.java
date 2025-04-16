package com.transys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.controller.MainController;
import com.transys.domain.Util;

@Repository
public class UtilDaoImpl implements UtilDao{
	
	
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
	    public List<Util> utilYearList(Util params) {
			
	    	//옥토시스
	    	if(MainController.mssqlOCTOChk) { 
	    		sqlSession.update("util.executeUtilProc05");
	    	}
	    	
	    	//EZ
	    	if(MainController.mssqlEZChk) { 
	    		sqlSessionEz.update("util.executeUtilProc05");
	    	}
		 	
	        return sessionReturn().selectList("util.utilYearList", params);  
	    }
	 
	 @Override
	    public List<Util> utilMonthList(Util params) {
		 
		 	
	        return sessionReturn().selectList("util.utilMonthList", params);  
	    }
	 
	 
	 @Override
	    public List<Util> utilElectricYearList(Util params) {
	    	//옥토시스
	    	if(MainController.mssqlOCTOChk) { 		 
	    		sqlSession.update("util.executeUtilProc05");
	    	}
	    	//EZ
	    	if(MainController.mssqlEZChk) { 		 
	    		sqlSessionEz.update("util.executeUtilProc05");
	    	}
		 	
	        return sessionReturn().selectList("util.utilElectricYearList", params);  
	    }
	 
	 @Override
	    public List<Util> utilElectricMonthList(Util params) {
		 
		 	
	        return sessionReturn().selectList("util.utilElectricMonthList", params);  
	    }
	 
}
