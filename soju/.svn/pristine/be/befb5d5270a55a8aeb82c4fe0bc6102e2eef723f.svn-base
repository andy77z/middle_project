<%@page import="soju.vo.FileVO"%>
<%@page import="soju.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<BoardVO> video = (List<BoardVO>)request.getAttribute("list");
	List<BoardVO> photo = (List<BoardVO>)request.getAttribute("list2");
	List<FileVO> files = (List<FileVO>)request.getAttribute("files");
%>
[
<%
if(!video.isEmpty()){
	for(int i = 0; i < video.size(); i++){
		BoardVO vo = video.get(i);
		if(i>0) out.print(",");
%>			
		{
			"num" : "<%= vo.getBd_num() %>",
			"title" : "<%= vo.getBd_title() %>",
			"date" : "<%= vo.getBd_date() %>",
			"type" : "video",
			"files" : [
<%
		int cnt = 0;
		for(int j = 0; j < files.size(); j++){
			FileVO fvo = files.get(j);
			
			if(vo.getBd_num() == fvo.getBd_num()){
				if(cnt>0) out.print(",");
%>
					"<%= fvo.getFiles_path() %>"
<%
			cnt++;
			}
		}
%>
					]
		}
<%
	if(i + 1==video.size() && !photo.isEmpty()){
		out.print(",");
	}
	}
}
	
%>

<%
	for(int i = 0; i < photo.size(); i++){
		BoardVO vo = photo.get(i);
		if(i>0) out.print(",");
%>			
		{
			"num" : "<%= vo.getBd_num() %>",
			"title" : "<%= vo.getBd_title() %>",
			"date" : "<%= vo.getBd_date() %>",
			"type" : "photo",
			"files" : [
<%
		int cnt = 0;
		for(int j = 0; j < files.size(); j++){
			FileVO fvo = files.get(j);
			
			if(vo.getBd_num() == fvo.getBd_num()){
				if(cnt>0) out.print(",");
%>
					"<%= fvo.getFiles_path() %>"
<%
			cnt++;
			}
		}
%>
					]
		}
<%
	}
%>
]