package com.transys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;

public class ServerSelectDaoImpl {

    @Resource(name="session")
    private SqlSession sqlSession;
    
    @Resource(name="sessionBak")
    private SqlSession sqlSessionBak;	

	public SqlSession serverSelect(int server) {
		System.out.println("선택서버 : "+server);

		if(server == 1) {
			return sqlSession;
		}else {
			return sqlSessionBak;
		}
	}
}
