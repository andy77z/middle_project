<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	//서블릿에서 결과값 공유하기
	String id = (String) request.getAttribute("result");
	//a001~x001, null
%>
<% 	
	if(id==null){
%>
{"sw" : "사용가능한id입니다."}		
<%	}else{  %>
{"sw" : "사용불가능한id입니다."}
<%	
	}
%>  
	