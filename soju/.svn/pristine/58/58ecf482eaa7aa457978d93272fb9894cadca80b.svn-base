<%@page import="soju.vo.AgencyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<AgencyVO> list = (List<AgencyVO>)request.getAttribute("listagency");
%>
[
<%
	int i = 0;
	for(AgencyVO vo : list){
		if(i > 0) out.print(",");
%>
		{
			  "agc_num" : "<%=vo.getAgc_num() %>",
			   "agc_id" : "<%=vo.getAgc_id() %>",
			 "agc_pass" : "<%=vo.getAgc_pass() %>",
			 "agc_name" : "<%=vo.getAgc_name() %>",
			 "agc_mail" : "<%=vo.getAgc_mail() %>",
			"agc_photo" : "<%=vo.getAgc_photo() %>"
		}
<%
	i++;
	}
%>
]
