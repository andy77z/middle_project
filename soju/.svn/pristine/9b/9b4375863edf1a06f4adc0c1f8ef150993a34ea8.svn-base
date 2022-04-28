<%@page import="soju.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<QnaVO> list = (List<QnaVO>)request.getAttribute("qnalistt");
	Integer spage = (Integer)request.getAttribute("spage");
	Integer tpage = (Integer)request.getAttribute("tpage");
	Integer epage = (Integer)request.getAttribute("epage");
	
%>
{
	"tp" : "<%= tpage %>",
	"sp" : "<%= spage %>",
	"ep" : "<%= epage %>",
	"datas" : [
	<%
		for(int i = 0; i <list.size(); i++){
			QnaVO vo = list.get(i);
			if(i>0) out.print(",");
	%>
		{
			    "num" : "<%= vo.getQna_num() %>",
			"subject" : "<%= vo.getQna_title() %>",
			"content" : "<%= vo.getQna_cont().replaceAll("\r", "").replaceAll("\n", "<br>") %>"
		}
<% 
	}
%>
]
}
