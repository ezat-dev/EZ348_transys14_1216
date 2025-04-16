package com.transys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.controller.MainController;
import com.transys.domain.ArrivedTab;
import com.transys.domain.Product;

@Repository
public class ArrivedTabDaoImpl implements ArrivedTabDao{
	
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
	public List<ArrivedTab> getArrivedTabDataSelect() {
		return sqlSessionOracle.selectList("arrivedTab.getArrivedTabDataSelect");
	}


	@Override
	public Product getArrivedTabProductSelect(ArrivedTab arrivedTab) {
		return sessionReturn().selectOne("arrivedTab.getArrivedTabProductSelect",arrivedTab);
	}


	@Override
	public void setArrivedTabDataInsert(ArrivedTab avt) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {		
    		sqlSession.insert("arrivedTab.setArrivedTabDataInsert",avt);
    	}

    	//EZ
    	if(MainController.mssqlEZChk) {		
    		sqlSessionEz.insert("arrivedTab.setArrivedTabDataInsert",avt);
    	}

    	
	}


	@Override
	public void setArrivedTabDataDelete(ArrivedTab avt) {
		sqlSessionOracle.delete("arrivedTab.setArrivedTabDataDelete",avt);
	}
}
