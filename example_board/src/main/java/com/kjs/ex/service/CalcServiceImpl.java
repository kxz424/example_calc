package com.kjs.ex.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kjs.ex.dao.CalcDAO;
import com.kjs.ex.vo.CalcVO;

@Service
public class CalcServiceImpl implements CalcService {
	
	@Inject
	private CalcDAO dao;

	@Override
	public void insert(CalcVO vo) {

		dao.insert(vo);

	}

	@Override
	public void delete(CalcVO vo) {
		
		dao.delete(vo);
		
	}

}
