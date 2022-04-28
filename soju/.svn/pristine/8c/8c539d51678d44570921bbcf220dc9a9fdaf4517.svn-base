<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//서블릿에서 수행결과 공유
	int res = (Integer)request.getAttribute("res");
	if(res > 0 ) {
		
	int totalp  = (Integer)request.getAttribute("tpage");
	
%>
	
		{ "sw" : "성공",
		  "tpage" : "<%= totalp %>"
		 }
		
<%	}else { %>

		{ "sw" : "실패" }
		
<%
	}
%>