<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	MemberVO resVo = (MemberVO) request.getAttribute("res");
%>
<% 	
	if(resVo!=null){
%>
{"sw" : "성공",
 "id" : "<%=resVo.getMem_id()%>"}
<%	}else{  %>
{"sw" : "실패"}
<%	
	}
%>  
	