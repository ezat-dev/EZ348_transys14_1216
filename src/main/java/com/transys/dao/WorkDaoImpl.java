package com.transys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.controller.MainController;
import com.transys.domain.InOut;
import com.transys.domain.Product;
import com.transys.domain.Work;

@Repository
public class WorkDaoImpl implements WorkDao {

    @Resource(name="session")
    private SqlSession sqlSession;
	
	@Resource(name="sessionEZ")
	private SqlSession sqlSessionEz;    
	
	
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
    public List<Work> workDetailList(Work work) {    	
    	return sessionReturn().selectList("work.workDetailList", work);
    }

    @Override
    public Work workDetailDescData(Work work) {
        return sessionReturn().selectOne("work.workDetailDescData", work);
    }

    @Override
    public List<Product> workDetailProductList(Product product) {
    	return sessionReturn().selectList("work.workDetailProductList", product);
    }

    @Override
    public Work workDetailEditData(Work work) {
        return sessionReturn().selectOne("work.workDetailEditData", work);
    }

    @Override
    public void setWorkDetailEditDataSave(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {
    		sqlSession.update("work.setWorkDetailEditDataSave", work);	
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {
    		sqlSessionEz.update("work.setWorkDetailEditDataSave", work);
    	}
    	
    }

    @Override
    public void setWorkDetailAddDataSave(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {
    		sqlSession.insert("work.setWorkDetailAddDataSave", work);	
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {
    		sqlSessionEz.insert("work.setWorkDetailAddDataSave", work);    		
    	}
    }

    @Override
    public void setWorkDetailDelete(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {
    		sqlSession.delete("work.setWorkDetailDelete", work);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {
    		sqlSessionEz.delete("work.setWorkDetailDelete", work);
    	}
    }
    
    @Override
    public void setWorkDetailInlineDelete(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {
    		sqlSession.delete("work.setWorkDetailInlineDelete", work);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {
    		sqlSessionEz.delete("work.setWorkDetailInlineDelete", work);
    	}
    }

    @Override
    public void setWorkDetailEndSalt(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {
    		sqlSession.update("work.setWorkDetailEndSalt", work);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {
    		sqlSessionEz.update("work.setWorkDetailEndSalt", work);
    	}
    }

    @Override
    public void setWorkDetailEndTime(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {
    		sqlSession.update("work.setWorkDetailEndTime", work);
    	}

    	//EZ
    	if(MainController.mssqlEZChk) {    	
    		sqlSessionEz.update("work.setWorkDetailEndTime", work);
    	}
    }

    @Override
    public void setWorkDetailForcingStart(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {
    		sqlSession.update("work.setWorkDetailForcingStart", work);
    	}

    	//EZ
    	if(MainController.mssqlEZChk) {
    		sqlSessionEz.update("work.setWorkDetailForcingStart", work);
    	}
    }

    @Override
    public void setWorkDetailForcingEnd(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {
    		sqlSession.update("work.setWorkDetailForcingEnd", work);
    	}

    	//EZ
    	if(MainController.mssqlEZChk) {    	
    		sqlSessionEz.update("work.setWorkDetailForcingEnd", work);
    	}
    }

    @Override
    public Work getWorkDetailEndTime(Work work) {
    	return sessionReturn().selectOne("work.getWorkDetailEndTime", work);
    }
    
    @Override
    public Work getWorkDetail(Work work) {        
        return sessionReturn().selectOne("work.getWorkDetail", work);
    }

    @Override
    public List<Work> getAllProducts() {
    	return sessionReturn().selectList("work.getAllProducts");
    }

    @Override
    public List<Work> workDayList(Work work) {
        return sessionReturn().selectList("work.workDayList", work);
    }

    @Override
    public List<Work> workMonthList(Work work) {
        return sessionReturn().selectList("work.workMonthList", work);
    }

    @Override
    public List<Work> workYearList(Work work) {
        return sessionReturn().selectList("work.workYearList", work);       
    }
    
    @Override
    public List<Work> workDayPrint(Work work) {    	
    	return sessionReturn().selectList("work.workDayPrint", work);
    }
    
    @Override
    public List<Work> workMonthPrint(Work work) {
    	return sessionReturn().selectList("work.workMonthPrint", work);
    }
    
    @Override
    public List<Work> workYearPrint(Work work) {
    	return sessionReturn().selectList("work.workYearPrint", work);
    }

	@Override
	public void workDayPrintListCheckCntSet(Work work) {
    	//옥토시스
    	if(MainController.mssqlOCTOChk) {		
    		sqlSession.insert("work.workDayPrintListCheckCntSet", work);
    	}
    	
    	//EZ
    	if(MainController.mssqlEZChk) {    	
    		sqlSessionEz.insert("work.workDayPrintListCheckCntSet", work);
    	}
	}

	@Override
	public Work workDetailDescDataOverView(Work work) {
		return sessionReturn().selectOne("work.workDetailDescDataOverView", work);
	}

	@Override
	public List<InOut> getInOutList() {
		return sessionReturn().selectList("work.getInOutList");
	}
	

}