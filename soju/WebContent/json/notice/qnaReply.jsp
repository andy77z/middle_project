<%@page import="soju.vo.Direct_QnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Direct_QnaVO> list = (List<Direct_QnaVO>)request.getAttribute("qnaReplylist");
%>

[
<%
	for(int i = 0; i < list.size(); i++){
		Direct_QnaVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
	{
	    "bonum" : "<%= vo.getDq_num() %>",
		"adate" : "<%= vo.getDq_adate() %>",
		  "ans" : "<%= vo.getDq_answer() %>"
	}


<%
	}
%>
]