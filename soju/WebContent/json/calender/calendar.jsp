<%@page import="soju.vo.CalendarVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  //서블릿에서 수행결과 공유
  ArrayList<CalendarVO> list = (ArrayList<CalendarVO>)request.getAttribute("res");
  /*
	 "groupId" : , "writer": , "content": ,"allday": ,생략
  */
%>
[
<%
	for(int i=0;i<list.size();i++){
		CalendarVO vo = list.get(i);
		if(i>0) out.print(",");
%>		
	{
		"id" : "<%=vo.getCal_num() %>",
		"title" : "<%=vo.getCal_title() %>", 
		"start": "<%=vo.getCal_start() %>", 
		"end": "<%=vo.getCal_end() %>", 
		"allday": <%=vo.getAllday() %>,
		"content": "<%=vo.getCal_cont() %>"
	}
<%
}
%>
]
  