package com.transys.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.transys.dao.WorkDao;
import com.transys.domain.Product;
import com.transys.domain.Work;

@Service
public class WorkServiceImpl implements WorkService {

    @Autowired
    private WorkDao workDao;

    @Override
    public List<Work> workDetailList(Work work) {
        return workDao.workDetailList(work);
    }

    @Override
    public Work workDetailDescData(Work work) {
        return workDao.workDetailDescData(work);
    }

    @Override
    public List<Product> workDetailProductList() {
        return workDao.workDetailProductList();
    }

    @Override
    public Work workDetailEditData(Work work) {
        return workDao.workDetailEditData(work);
    }

    @Override
    public void setWorkDetailEditDataSave(Work work) {
        workDao.setWorkDetailEditDataSave(work);
    }

    @Override
    public void setWorkDetailAddDataSave(Work work) {
        workDao.setWorkDetailAddDataSave(work);
    }

    @Override
    public void setWorkDetailDelete(Work work) {
        workDao.setWorkDetailDelete(work);
    }
    

    @Override
    public void setWorkDetailInlineDelete(Work work) {
        workDao.setWorkDetailInlineDelete(work);
    }


    @Override
    public void setWorkDetailEndSalt(Work work) {
        workDao.setWorkDetailEndSalt(work);
    }

    @Override
    public void setWorkDetailEndTime(Work work) {
        workDao.setWorkDetailEndTime(work);
    }

    @Override
    public void setWorkDetailForcingStart(Work work) {
        workDao.setWorkDetailForcingStart(work);
    }

    @Override
    public void setWorkDetailForcingEnd(Work work) {
        workDao.setWorkDetailForcingEnd(work);
    }

    @Override
    public Work getWorkDetailEndTime(Work work) {
        return workDao.getWorkDetailEndTime(work);
    }


    @Override
    public Work getWorkDetail(Work work) {
        return workDao.getWorkDetail(work); 
    }

    @Override
    public List<Work> getAllProducts() {
        return workDao.getAllProducts();
    }

    @Override
    public List<Work> workDayList(Work work) {
        return workDao.workDayList(work);
    }

    @Override
    public List<Work> workMonthList(Work work) {
        return workDao.workMonthList(work);
    }

    @Override
    public List<Work> workYearList(Work work) {
        return workDao.workYearList(work);
    }
    
    @Override
    public List<Work> workDayPrint(Work work) {
        return workDao.workDayPrint(work);
    }
    
    @Override
    public List<Work> workMonthPrint(Work work) {
        return workDao.workMonthPrint(work);
    }
    
    @Override
    public List<Work> workYearPrint(Work work) {
        return workDao.workYearPrint(work);
    }

	@Override
	public void workDayPrintListCheckCntSet(Work work) {
		workDao.workDayPrintListCheckCntSet(work);
	}
}