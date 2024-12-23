package com.transys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.domain.MchInput;

@Repository
public class MchInputDaoImpl implements MchInputDao{
	
	@Resource(name="session")
	private SqlSession sqlSession;
	
	
	@Resource(name="sessionOracle")
	private SqlSession sqlSessionOracle;


	@Override
	public MchInput getMchInputDataSelectWorkInline(MchInput mchInput) {
		return sqlSession.selectOne("mchInput.getMchInputDataSelectWorkInline", mchInput);
	}


	@Override
	public void setMchDataInsertInputTab(MchInput mchInput) {
		sqlSessionOracle.insert("mchInput.setMchDataInsertInputTab",mchInput);
	}


	@Override
	public void setMchDataUpdateWaitList(MchInput mchInput) {
		sqlSession.update("mchInput.setMchDataUpdateWaitList", mchInput);
	}


	@Override
	public void setMchDataUpdateSiljuk(MchInput mchInput) {
		sqlSession.update("mchInput.setMchDataUpdateSiljuk", mchInput);
	}


	@Override
	public void setMchDataDeleteWorkInline(MchInput mchInput) {
		sqlSession.delete("mchInput.setMchDataDeleteWorkInline", mchInput);
	}


	@Override
	public void setMchDataInsertInputTabFail(MchInput mchInput) {
		sqlSessionOracle.insert("mchInput.setMchDataInsertInputTabFail",mchInput);
	}


	@Override
	public void setMchDataUpdateSiljukFail(MchInput mchInput) {
		sqlSession.update("mchInput.setMchDataUpdateSiljukFail", mchInput);
	}


	@Override
	public void setMchDataDeleteWorkInlineFail(MchInput mchInput) {
		sqlSession.delete("mchInput.setMchDataDeleteWorkInlineFail", mchInput);
	}
}
