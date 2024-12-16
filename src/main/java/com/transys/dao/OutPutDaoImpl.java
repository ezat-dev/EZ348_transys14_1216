package com.transys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.domain.OutPut;

@Repository
public class OutPutDaoImpl implements OutPutDao{
	
	@Resource(name="session")
	private SqlSession sqlSession;
	
	
	@Resource(name="sessionOracle")
	private SqlSession sqlSessionOracle;


	@Override
	public OutPut getOutPutDeviceStatus(OutPut paramOutPut) {
		return sqlSessionOracle.selectOne("outPut.getOutPutDeviceStatus", paramOutPut);
	}

	@Override
	public void setOutPutSend(OutPut outPut) {
		sqlSessionOracle.insert("outPut.setOutPutSend", outPut);
	}

	@Override
	public void outputCancel() {
		sqlSessionOracle.delete("outPut.outputCancel");
	}

}
