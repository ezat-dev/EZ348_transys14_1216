package com.transys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.domain.ArrivedTab;
import com.transys.domain.Product;

@Repository
public class ArrivedTabDaoImpl implements ArrivedTabDao{
	
	@Resource(name="session")
	private SqlSession sqlSession;
	
	
	@Resource(name="sessionOracle")
	private SqlSession sqlSessionOracle;


	@Override
	public List<ArrivedTab> getArrivedTabDataSelect() {
		return sqlSessionOracle.selectList("arrivedTab.getArrivedTabDataSelect");
	}


	@Override
	public Product getArrivedTabProductSelect(ArrivedTab arrivedTab) {
		return sqlSession.selectOne("arrivedTab.getArrivedTabProductSelect",arrivedTab);
	}


	@Override
	public void setArrivedTabDataInsert(ArrivedTab avt) {
		sqlSession.insert("arrivedTab.setArrivedTabDataInsert",avt);
	}


	@Override
	public void setArrivedTabDataDelete(ArrivedTab avt) {
		sqlSessionOracle.delete("arrivedTab.setArrivedTabDataDelete",avt);
	}
}
