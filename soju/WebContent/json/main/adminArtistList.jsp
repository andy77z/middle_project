<%@page import="soju.vo.ArtistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	List<ArtistVO> list = (List<ArtistVO>)request.getAttribute("listartistadmin");
%>

[
<%
	int i =0;
	for(ArtistVO vo : list){
		if(i > 0) out.print(",");

%>
		{
			    "art_num" : "<%= vo.getArt_num() %>",
				"art_id" : "<%= vo.getArt_id()  %>",
				"art_pass" : "<%= vo.getArt_pass() %>",
				"art_name" : "<%= vo.getArt_name() %>",
				"gr_name" : "<%= vo.getGr_name() %>",
				"art_mail" : "<%= vo.getArt_mail() %>",
				"art_photo" : "<%= vo.getArt_photo() %>",
				"sub_cnt" : "<%= vo.getSub_cnt() %>",
				"agc_num" : "<%= vo.getAgc_num() %>",
				"art_resign" : "<%= vo.getArt_resign() %>"
			 
		}
		
<%
	i++;
	}
%>
]



