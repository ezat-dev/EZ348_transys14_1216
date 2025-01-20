package com.transys.dao;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.transys.domain.Product;
import com.transys.domain.Work;

@Repository
public class WorkDaoImpl implements WorkDao {

    @Resource(name="session")
    private SqlSession sqlSession;
    
    
    @Override
    public List<Work> workDetailList(Work work) {
    	return sqlSession.selectList("work.workDetailList", work);
    }

    @Override
    public Work workDetailDescData(Work work) {
        return sqlSession.selectOne("work.workDetailDescData", work);
    }

    @Override
    public List<Product> workDetailProductList() {
        return sqlSession.selectList("work.workDetailProductList");
    }

    @Override
    public Work workDetailEditData(Work work) {
        return sqlSession.selectOne("work.workDetailEditData", work);
    }

    @Override
    public void setWorkDetailEditDataSave(Work work) {
    	sqlSession.update("work.setWorkDetailEditDataSave", work);
    }

    @Override
    public void setWorkDetailAddDataSave(Work work) {
    	sqlSession.insert("work.setWorkDetailAddDataSave", work);
    }

    @Override
    public void setWorkDetailDelete(Work work) {
    	sqlSession.delete("work.setWorkDetailDelete", work);
    }
    
    @Override
    public void setWorkDetailInlineDelete(Work work) {
    	sqlSession.delete("work.setWorkDetailInlineDelete", work);
    }

    @Override
    public void setWorkDetailEndSalt(Work work) {
    	sqlSession.update("work.setWorkDetailEndSalt", work);
    }

    @Override
    public void setWorkDetailEndTime(Work work) {
    	sqlSession.update("work.setWorkDetailEndTime", work);
    }

    @Override
    public void setWorkDetailForcingStart(Work work) {
    	sqlSession.update("work.setWorkDetailForcingStart", work);
    }

    @Override
    public void setWorkDetailForcingEnd(Work work) {
    	sqlSession.update("work.setWorkDetailForcingEnd", work);
    }

    @Override
    public Work getWorkDetailEndTime(Work work) {
        return sqlSession.selectOne("work.getWorkDetailEndTime", work);
    }
    
    @Override
    public Work getWorkDetail(Work work) {
        return sqlSession.selectOne("work.getWorkDetail", work); 
    }

    @Override
    public List<Work> getAllProducts() {
        return sqlSession.selectList("work.getAllProducts");
    }

    @Override
    public List<Work> workDayList(Work work) {
        return sqlSession.selectList("work.workDayList", work);
    }

    @Override
    public List<Work> workMonthList(Work work) {
        return sqlSession.selectList("work.workMonthList", work);
    }

    @Override
    public List<Work> workYearList(Work work) {
        return sqlSession.selectList("work.workYearList", work);
    }
    
    @Override
    public List<Work> workDayPrint(Work work) {
        return sqlSession.selectList("work.workDayPrint", work);
    }
    
    @Override
    public List<Work> workMonthPrint(Work work) {
        return sqlSession.selectList("work.workMonthPrint", work);
    }
    
    @Override
    public List<Work> workYearPrint(Work work) {
        return sqlSession.selectList("work.workYearPrint", work);
    }

	@Override
	public void workDayPrintListCheckCntSet(Work work) {
		sqlSession.insert("work.workDayPrintListCheckCntSet", work);
	}

}