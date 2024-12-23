package com.transys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.domain.Util;

@Repository
public class UtilDaoImpl implements UtilDao{
	
	
	@Resource(name="session")
    private SqlSession sqlSession;
	
	 @Override
	    public List<Util> utilYearList(Util params) {
		 	sqlSession.update("util.executeUtilProc05");
		 	
	        return sqlSession.selectList("util.utilYearList", params);  
	    }
	 
	 @Override
	    public List<Util> utilMonthList(Util params) {
		 
		 	
	        return sqlSession.selectList("util.utilMonthList", params);  
	    }
	 
	 
	 @Override
	    public List<Util> utilElectricYearList(Util params) {
		 	sqlSession.update("util.executeUtilProc05");
		 	
	        return sqlSession.selectList("util.utilElectricYearList", params);  
	    }
	 
	 @Override
	    public List<Util> utilElectricMonthList(Util params) {
		 
		 	
	        return sqlSession.selectList("util.utilElectricMonthList", params);  
	    }
	 
}
