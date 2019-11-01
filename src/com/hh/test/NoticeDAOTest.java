package com.hh.test;

import static org.junit.Assert.assertEquals;

import java.sql.Connection;

import org.junit.Test;

import com.hh.notice.NoticeDAO;
import com.hh.notice.NoticeDTO;
import com.hh.util.DBConnector;

public class NoticeDAOTest {
	
	
	public void noticelisttest() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		noticeDAO.noticeList(con);
		
	
	}

	@Test
	public void write(Connection con, NoticeDTO noticeDTO) throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		int result=0;
		
		 result= noticeDAO.write(con, noticeDTO);
		 
		 assertEquals(1,result);
	}
}
