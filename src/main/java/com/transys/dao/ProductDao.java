package com.transys.dao;

import java.util.List;


import com.transys.domain.PlcWrite;
import com.transys.domain.Product;

public interface ProductDao {
    List<Product> productDetailList();
    void deleteByDobun(String dobun);
    Product selectProductByDobun(String dobun);
    void updateProduct(Product product);
    List<PlcWrite> getWaitList(PlcWrite params);
    List<PlcWrite> getWaitPlayList(PlcWrite params);
    void insertOutputTab(String deviceCode);
    void updateCurLocation(String lotno);
    void forceCompleteOldData();
}
