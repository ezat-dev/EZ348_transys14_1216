package com.transys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.transys.dao.ProductDao;
import com.transys.domain.PlcWrite;
import com.transys.domain.Product;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Override
    public List<Product> getProductList() {
        return productDao.productDetailList();  
    }

    @Override
    public void deleteProductByDobun(String dobun) {
        productDao.deleteByDobun(dobun); // 삭제 메서드 호출
    }

    @Override
    public Product getProductByDobun(String dobun) {
        return productDao.selectProductByDobun(dobun); // 추가된 메서드
    }
    @Override
    public void updateProduct(Product product) {
        productDao.updateProduct(product); // 수정 로직 호출
    }
    @Override
    public List<PlcWrite> getWaitList(PlcWrite params) {
        return productDao.getWaitList(params); 
    }
    @Override
    public List<PlcWrite> getWaitPlayList(PlcWrite params) {
        return productDao.getWaitPlayList(params);  
    }
    @Override
    public void insertOutputTab(String deviceCode) {
        productDao.insertOutputTab(deviceCode); 
    }
    @Override
    public void updateCurLocation(String lotno) {
    	productDao.updateCurLocation(lotno);
    }
    @Override
    public void forceCompleteOldData() {
    	productDao.forceCompleteOldData();
    }
}
