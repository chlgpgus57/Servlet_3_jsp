<%@page import="com.hh.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hh.member.MemberDAO"%>
<%@page import="com.hh.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

MemberDTO memberDTO = new MemberDTO();
memberDTO.setId(request.getParameter("id"));
memberDTO.setPw(request.getParameter("pw"));
memberDTO.setEmail(request.getParameter("email"));
memberDTO.setPhone(request.getParameter("phone"));
memberDTO.setName(request.getParameter("name"));
memberDTO.setGrade(Integer.parseInt(request.getParameter("grade")));

MemberDAO memberDAO = new MemberDAO();

Connection con = DBConnector.getConnection();


int result = memberDAO.memberUpdate(con, memberDTO);


String msg = "정보 수정 실패";

String path = "../index.jsp";

if(result>0){
	
	msg = "정보 수정 성공";

}
request.setAttribute("msg", msg);

request.setAttribute("path", path);

session.setAttribute("member", memberDTO);

RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");

view.forward(request, response);




%>