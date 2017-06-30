package com.kjs.ex.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kjs.ex.vo.CalcVO;

@Repository
public class CalcDAOImpl implements CalcDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.kjs.ex.mapper.CalcMapper";

	@Override
	public void insert(CalcVO vo) {
		
		sqlSession.insert(namespace + ".insert", vo);		

	}

	@Override
	public void delete(CalcVO vo) {

		sqlSession.delete(namespace + ".delete", vo);
		
	}

}
