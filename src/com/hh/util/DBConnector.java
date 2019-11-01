package com.hh.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {

	public static Connection getConnection() throws Exception{
			
		Connection con = null;
		
		 //1. 4가지정보
	    String user="user11";
	    String password="user11";
	    String url="jdbc:oracle:thin:@211.238.142.28:1521:xe";
	    String driver="oracle.jdbc.driver.OracleDriver";

		//2. driver메모리에 로딩
		Class.forName(driver);
		
		//3. connection
		con = DriverManager.getConnection(url, user, password);
		
		
		
		
		return con;
	}
	
}
