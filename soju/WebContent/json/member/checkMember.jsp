<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	String res = (String)request.getAttribute("res");
	
%>

{"sw" : "<%= res %>"}		

	