package com.hh.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MemberDAO {
	
	public int memberDelete(Connection con, MemberDTO memberDTO) throws Exception {
		
		int result=0;
		
		String sql="delete from join where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	
	
	public int memberUpdate(Connection con,MemberDTO memberDTO) throws Exception{

		String sql = "update join  set pw = ?, name = ?, email=?, phone =?, lev = ? where id = ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getName());
		st.setString(3, memberDTO.getEmail());
		st.setString(4, memberDTO.getPhone());
		st.setInt(5, memberDTO.getGrade());
		st.setString(6, memberDTO.getId());
		
		int result = st.executeUpdate();
		
		st.close();

		return result;

	}

	   //join   (회원가입 화면)
	   public int join(Connection con, MemberDTO memberDTO) throws Exception{
	      int result =0;
	      
	      String sql = "insert into join values(?,?,?,?,?,?)";
	      
	      PreparedStatement st = con.prepareStatement(sql);
	      
	      st.setString(1, memberDTO.getId());
	      st.setString(2, memberDTO.getPw());
	      st.setString(3, memberDTO.getName());
	      st.setString(4, memberDTO.getEmail());
	      st.setString(5, memberDTO.getPhone());
	      st.setInt(6, memberDTO.getGrade());
	      
	      result = st.executeUpdate();
	      
	      st.close();
	      
	      return result;
	   }
	   
	   
	   public MemberDTO memberLogin(Connection con, String id, String pw) throws Exception{

			MemberDTO memberDTO=null;

			String sql = "select * from join where id=? and pw = ?";

			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, id);

			st.setString(2, pw);

			
			ResultSet rs = st.executeQuery();

			if(rs.next()) {

				memberDTO = new MemberDTO();
				memberDTO.setId(rs.getString(1));
				memberDTO.setPw(rs.getString(2));
				memberDTO.setName(rs.getString(3));
				memberDTO.setPhone(rs.getString(4));
				memberDTO.setEmail(rs.getString(5));
				memberDTO.setGrade(rs.getInt(6));

			}

			rs.close();
			st.close();

			return memberDTO;

		}
}
