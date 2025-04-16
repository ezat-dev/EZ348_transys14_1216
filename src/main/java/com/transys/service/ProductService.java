package com.transys.service;

import java.util.List;

import com.transys.domain.PlcWrite;
import com.transys.domain.Product;

public interface ProductService {
    List<Product> getProductList(); 
    void deleteProductByDobun(String dobun);
    Product getProductByDobun(String dobun);
    void updateProduct(Product product);
    List<PlcWrite> getWaitList(PlcWrite params); 
    List<PlcWrite> getWaitPlayList(PlcWrite params); 
    void insertOutputTab(String deviceCode);
    void updateCurLocation(String lotno);
    void forceCompleteOldData();
	void productPlayListEditSave(PlcWrite plcWrite);
}
