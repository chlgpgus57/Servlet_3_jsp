package com.hh.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class NoticeDAO {
	

	public int update(Connection con, NoticeDTO noticeDTO) throws Exception{
		int result=0;
		
		String sql = "UPDATE notice set title=? , contents=? where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	public int delete(Connection con, int num) throws Exception {
		int result=0;
		
		String sql="delete notice where num=? ";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	
	public int write(Connection con, NoticeDTO noticeDTO) throws Exception {
		
		int result=0;
		String sql="insert into notice (num,title,writer,contents,reg_date, hit) values(board_seq.nextval,?,'������',?,sysdate,0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		
		result =st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	
	public ArrayList<NoticeDTO> noticeList(Connection con) throws Exception {
		
		NoticeDTO noticeDTO = null;
		
		String sql="select * from notice order by num desc";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		ArrayList<NoticeDTO> ar = new ArrayList<NoticeDTO>();
		
		while(rs.next()) {
			noticeDTO = new NoticeDTO();
			
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		
		rs.close();
		st.close();
		
		return ar;

	}
	
	public NoticeDTO noticeSelect(Connection con, int num) throws Exception{
		NoticeDTO noticeDTO= null;
		String sql = "select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1,num);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		
		}
		
		
		rs.close();
		st.close();
		
		return noticeDTO;
	}
	
}
