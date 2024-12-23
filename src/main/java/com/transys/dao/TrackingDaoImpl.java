package com.transys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.transys.domain.Tracking;

@Repository
public class TrackingDaoImpl implements TrackingDao{
	
	@Resource(name="session")
	private SqlSession sqlSession;
	
	@Override
	public void ccf1Tracking01(Tracking tracking) {
		sqlSession.update("tracking.ccf1Tracking01", tracking);
	}

}
