<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bd_num = (Integer)request.getAttribute("num");
%>
{
	"bd_num" : "<%= bd_num %>"
}