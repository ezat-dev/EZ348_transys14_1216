package com.transys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.domain.PlcWrite;

@Repository
public class PlcWriteDaoImpl implements PlcWriteDao{
	
	@Resource(name="session")
	private SqlSession sqlSession;
	
	
	@Resource(name="sessionOracle")
	private SqlSession sqlSessionOracle;


	@Override
	public PlcWrite getPlcWriteWorkData() {
		return sqlSession.selectOne("plcWrite.getPlcWriteWorkData");
	}


	@Override
	public void setPlcWriteDataUpdate(PlcWrite plcWrite) {
		sqlSession.update("plcWrite.setPlcWriteDataUpdate",plcWrite);
	}


	@Override
	public void setPlcWriteProc(PlcWrite plcWrite) {
		sqlSession.update("plcWrite.setPlcWriteProc",plcWrite);
	}


	@Override
	public void setPlcWriteDataDelete(PlcWrite work) {
		sqlSessionOracle.delete("plcWrite.setPlcWriteDataDelete",work);
	}

}
