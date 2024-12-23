package com.transys.service;

import java.util.List;

import com.transys.domain.Product;
import com.transys.domain.Work;

public interface WorkService {

   List<Work> workDetailList(Work work);

   Work workDetailDescData(Work work);

   List<Product> workDetailProductList();

   Work workDetailEditData(Work work);

   void setWorkDetailEditDataSave(Work work);

   void setWorkDetailAddDataSave(Work work);

   void setWorkDetailDelete(Work work);

   void setWorkDetailEndSalt(Work work);

   void setWorkDetailEndTime(Work work);

   void setWorkDetailForcingStart(Work work);

   void setWorkDetailForcingEnd(Work work);

   Work getWorkDetailEndTime(Work work);

   Work getWorkDetail(Work work);
    
   List<Work> getAllProducts();
       
   List<Work> workDayList(Work work);
      
   List<Work> workMonthList(Work work);
       
   List<Work> workYearList(Work work);
      
   
}