<%@page import="soju.vo.MemberVO"%>
<%@page import="soju.vo.Direct_QnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Direct_QnaVO> list = (List<Direct_QnaVO>)request.getAttribute("adminQnaList");
%>
{	
	"datas" : [
	<%
		for(int i = 0; i <list.size(); i++){
			Direct_QnaVO vo = list.get(i);
			if(i>0) out.print(",");
	%>
		{
	          "num" : "<%= vo.getDq_num() %>",
		  "subject" : "<%= vo.getDq_title() %>",
	      "content" : "<%= vo.getDq_cont().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
	         "Myid" : "<%= vo.getDq_id() %>",
			 "date" : "<%= vo.getDq_date() %>"
		}
<% 
	}
%>
]
}
