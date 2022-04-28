<%@page import="java.util.HashMap"%>
<%@page import="soju.vo.CalendarVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  //서블릿에서 수행결과 공유
  ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)request.getAttribute("res");
 
%>
[
<%
	for(int i=0;i<list.size();i++){
		HashMap<String,Object> map = list.get(i);
		if(i>0) out.print(",");
%>		
	{
		"agc_id" : "<%=map.get("AGC_ID") %>",
		"art_num": "<%=map.get("ART_NUM") %>",
		"art_name": "<%=map.get("ART_NAME") %>"
	}
<%
}
%>
]
  