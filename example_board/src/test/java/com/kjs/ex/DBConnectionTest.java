package com.kjs.ex;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBConnectionTest {

	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	
	private static final String URL = "jdbc:mariadb://localhost:3306/calc";
	
	private static final String USER = "root";
	
	private static final String PW = "jong1234!";
	
	@Test
	public void testConnection() throws Exception {
		
		Class.forName(DRIVER);
		
		try (Connection con = DriverManager.getConnection(URL, USER, PW)) {
			
			System.out.println(con);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
