package com.hh.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import com.hh.point.PointDAO;
import com.hh.point.PointDTO;
import com.hh.util.DBConnector;

public class PointDAOTest {
	
	@Test
	public void updateTest() throws Exception{
		PointDTO pointDTO = new PointDTO();
		pointDTO.setNum(300);
		pointDTO.setName("공주님");
		pointDTO.setKor(80);
		pointDTO.setEng(70);
		pointDTO.setMath(100);
		pointDTO.setTotal(400);
		pointDTO.setAvg(40);
		
		Connection con = DBConnector.getConnection();
		PointDAO pointDAO = new PointDAO();
		int result = pointDAO.update(con, pointDTO);
		
		assertEquals(1, result);
		
		con.close();
	}
	
	
	
	
	//@Test
	public void insertTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		for(int i=0; i<10; i++) {
			Random rand = new Random();
			PointDTO pointDTO = new PointDTO();
			pointDTO.setName("name"+i);
			pointDTO.setKor(rand.nextInt(101));
			pointDTO.setEng(rand.nextInt(101));
			pointDTO.setMath(rand.nextInt(101));
			pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
			pointDTO.setAvg(pointDTO.getTotal()/3.0);
			pointDAO.insert(con, pointDTO);
			Thread.sleep(500);
		
		}
		con.close();
	}
	
	//@Test
	public void selectlistTest() throws Exception{
		
		PointDAO pointDAO = new PointDAO();
		
		Connection con = DBConnector.getConnection();
		
		ArrayList<PointDTO> ar = pointDAO.selectList(con);
		
		assertNotEquals(0,ar.size());
	}
	
	
	//@Test
	public void selectOneTest() throws Exception{
		
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		
		PointDTO pointDTO = pointDAO.selectOne(con, 1);
		
		assertNull(pointDTO);
	}
	

	//@Test
	public void test2() throws Exception{
		Connection con = DBConnector.getConnection();
		
		assertNotNull(con);
	}
	
	//@Test
	public void test() throws Exception {

		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		int result = pointDAO.delete(con, 53);

		//단정문
		assertEquals(1,result);
	
	}

}
