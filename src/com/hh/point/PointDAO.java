package com.hh.point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;


public class PointDAO {

	
	
	//insert
	public int insert(Connection con, PointDTO pointDTO) throws Exception {
		
		int result=0;
		
		String sql = "insert into point values(pt_seq.nextval,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		
		result = st.executeUpdate();
		
		st.close();
		

		return result;
	}
	
	//delete
	public int delete(Connection con, int num) throws SQLException {
		
		int result=0;
		
		String sql="delete point where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);

		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//SelectOne
	public PointDTO selectOne(Connection con, int num) throws Exception{
		
		PointDTO pointDTO=null;
		
		String sql ="select * from point where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			pointDTO = new PointDTO();
			
			pointDTO.setNum(rs.getInt("num"));
			pointDTO.setName(rs.getString("name"));
			pointDTO.setKor(rs.getInt("kor"));
			pointDTO.setEng(rs.getInt("eng"));
			pointDTO.setMath(rs.getInt("math"));
			pointDTO.setTotal(rs.getInt("sum"));
			pointDTO.setAvg(rs.getDouble("avg"));

		}
		
		rs.close();
		st.close();
		
		return pointDTO;
	}
	
	
	//selectList
	public ArrayList<PointDTO> selectList(Connection con) throws Exception{
		
		PointDTO pointDTO = null;
		
		String sql="select * from point order by num desc";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		ArrayList<PointDTO> ar = new ArrayList<PointDTO>();
		
		while(rs.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt("num"));
			pointDTO.setName(rs.getString("name"));
			pointDTO.setKor(rs.getInt("kor"));
			pointDTO.setEng(rs.getInt("eng"));
			pointDTO.setMath(rs.getInt("math"));
			pointDTO.setTotal(rs.getInt("sum"));
			pointDTO.setAvg(rs.getDouble("avg"));
			ar.add(pointDTO);
		}
		
		rs.close();
		st.close();
		
		return ar;
	}
	
	//Update
	public int update(Connection con, PointDTO pointDTO) throws Exception{
		
		int result=0;
	
		
		String sql = "update point set name=?, kor=?, eng=?, math=?, sum=?, avg=?" + 
					 "where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1,pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());		
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		st.setInt(7, pointDTO.getNum());
		
		result = st.executeUpdate();

		st.close();
		
		return result;
	}
}
