package com.transys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.controller.MainController;
import com.transys.domain.PlcWrite;
import com.transys.domain.Product;
import com.transys.domain.Work;

@Repository
public class ProductDaoImpl implements ProductDao {
	
    @Resource(name="session")
    private SqlSession sqlSession;
	
	@Resource(name="sessionEZ")
	private SqlSession sqlSessionEz;   
    
	@Resource(name="sessionOracle")
	private SqlSession sqlSessionOracle;


	public SqlSession sessionReturn() {
		SqlSession ss = null;
		if(MainController.mssqlOCTOChk) {
			ss = sqlSession;
		}else {
			ss = sqlSessionEz;
		}
		
		return ss;
	}

    @Override
    public List<Product> productDetailList() {
        return sessionReturn().selectList("product.productDetailList");
    }

    @Override
    public void deleteByDobun(String dobun) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {    	
    		sqlSession.delete("product.deleteByDobun", dobun);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {    	
    		sqlSessionEz.delete("product.deleteByDobun", dobun);
    	}
    }

    @Override
    public Product selectProductByDobun(String dobun) {
        return sessionReturn().selectOne("product.selectProductByDobun", dobun); 
    }
    @Override
    public void updateProduct(Product product) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {      	
    		sqlSession.update("product.updateProduct", product); // MyBatis를 사용하여 수정
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {      	
    		sqlSessionEz.update("product.updateProduct", product); // MyBatis를 사용하여 수정
    	}
    }
    
    @Override
    public List<PlcWrite> getWaitList(PlcWrite params) {
        return sessionReturn().selectList("product.getWaitList", params);  // MyBatis 쿼리 호출
    }
    @Override
    public List<PlcWrite> getWaitPlayList(PlcWrite params) {
        return sessionReturn().selectList("product.getWaitPlayList", params);  // MyBatis 쿼리 호출
    }
    @Override
    public void insertOutputTab(String deviceCode) {
    	sqlSessionOracle.insert("outPut.insertOutputTab", deviceCode); 
    }
    
    @Override
    public void updateCurLocation(String lotno) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {     	
    		sqlSession.update("product.updateCurLocation", lotno);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {     	
    		sqlSessionEz.update("product.updateCurLocation", lotno);
    	}
    }
    
    @Override
    public void forceCompleteOldData() {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {     	
    		sqlSession.update("product.5dayforce");
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {     	
    		sqlSessionEz.update("product.5dayforce");
    	}
    }

	@Override
	public void productPlayListEditSave(PlcWrite plcWrite) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {   		
    		sqlSession.update("product.productPlayListEditSave",plcWrite);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {   		
    		sqlSessionEz.update("product.productPlayListEditSave",plcWrite);
    	}
	}

	@Override
	public Work productPlayListEditData(Work work) {
		return sessionReturn().selectOne("product.productPlayListEditData", work);
	}

	@Override
	public void setProductPlayListEditDataSave(Work work) {
		
    	//옥토시스
    	if(MainController.mssqlOCTOChk) { 		
    		sqlSession.update("product.setProductPlayListEditDataSave",work);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) { 		
    		sqlSessionEz.update("product.setProductPlayListEditDataSave",work);
    	}
	}

}