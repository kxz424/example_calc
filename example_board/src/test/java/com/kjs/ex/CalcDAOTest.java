package com.kjs.ex;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kjs.ex.dao.CalcDAO;
import com.kjs.ex.vo.CalcVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CalcDAOTest {
	
	@Inject
	private CalcDAO dao;
	
	@Test
	public void testInsert() throws Exception {
		CalcVO vo = new CalcVO();
		vo.setFormula("2+3");
		vo.setResult((double) 5);
		
		dao.insert(vo);
	}

}
