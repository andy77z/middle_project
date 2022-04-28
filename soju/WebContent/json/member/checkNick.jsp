<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	//서블릿에서 결과값 공유하기
	String nick = (String) request.getAttribute("result");
	//a001~x001, null
%>
<% 	
	if(nick==null){
%>
{"sw" : "사용 가능한 닉네임입니다."}		
<%	}else{  %>
{"sw" : "사용 불가능한 닉네임입니다."}
<%	
	}
%>  
	