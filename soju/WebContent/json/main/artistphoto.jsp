<%@page import="soju.vo.ArtistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ArtistVO> list = (List<ArtistVO>)request.getAttribute("list");
%>
[
<%
	int i = 0;
	for(ArtistVO vo : list){
		if(i > 0) out.print(",");
%>		
		{
			"name" : "<%= vo.getArt_name() %>",
			"grname" : "<%= vo.getGr_name() %>",
			"photo" : "<%= vo.getArt_photo() %>",
			"art_num" : "<%= vo.getArt_num() %>"
		}
<%	
	i++;
	}
%>
]