<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//서블릿에서 결과값 공유하기
	String id = (String) request.getAttribute("result");
	
	if(id!=null){
%>
	{
		"sw" : "가입성공"
	}
		
<%	}else{  %>
		{
		"sw" : "가입실패"
		}
<%	
	}
%>  
	