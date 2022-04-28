<%@page import="soju.vo.FileVO"%>
<%@page import="soju.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<BoardVO> board = (List<BoardVO>)request.getAttribute("board");
	List<FileVO> files = (List<FileVO>)request.getAttribute("files");
%>
[
<%
	for(int i = 0; i < board.size(); i++){
		BoardVO vo = board.get(i);
		if(i>0) out.print(",");
%>			
		{
			"num" : "<%= vo.getBd_num() %>",
			"title" : "<%= vo.getBd_title() %>",
			"date" : "<%= vo.getBd_date() %>",
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