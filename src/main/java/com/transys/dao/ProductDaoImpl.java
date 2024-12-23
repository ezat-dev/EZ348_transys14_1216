package com.transys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.domain.PlcWrite;
import com.transys.domain.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Resource(name="session")
    private SqlSession sqlSession;
    
	@Resource(name="sessionOracle")
	private SqlSession sqlSessionOracle;

    @Override
    public List<Product> productDetailList() {
        return sqlSession.selectList("product.productDetailList");
    }

    @Override
    public void deleteByDobun(String dobun) {
        sqlSession.delete("product.deleteByDobun", dobun); 
    }

    @Override
    public Product selectProductByDobun(String dobun) {
        return sqlSession.selectOne("product.selectProductByDobun", dobun); 
    }
    @Override
    public void updateProduct(Product product) {
        sqlSession.update("product.updateProduct", product); // MyBatis를 사용하여 수정
    }
    
    @Override
    public List<PlcWrite> getWaitList(PlcWrite params) {
        return sqlSession.selectList("product.getWaitList", params);  // MyBatis 쿼리 호출
    }
    @Override
    public List<PlcWrite> getWaitPlayList(PlcWrite params) {
        return sqlSession.selectList("product.getWaitPlayList", params);  // MyBatis 쿼리 호출
    }
    @Override
    public void insertOutputTab(String deviceCode) {
    	sqlSessionOracle.insert("outPut.insertOutputTab", deviceCode); 
    }
    
    @Override
    public void updateCurLocation(String lotno) {
        sqlSession.update("updateCurLocation", lotno);
    }
    @Override
    public void forceCompleteOldData() {
    	 sqlSession.update("5dayforce");
    }
}