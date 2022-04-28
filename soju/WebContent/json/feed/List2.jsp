<%@page import="soju.vo.FileVO"%>
<%@page import="soju.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<BoardVO> board = (List<BoardVO>)request.getAttribute("board");
	List<FileVO> files = (List<FileVO>)request.getAttribute("files");
	List<Integer> like = (List<Integer>)request.getAttribute("like");
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
			"profile" : "<%= vo.getBd_profile() %>",
			"date" : "<%= vo.getBd_date() %>",
			"id" : "<%=vo.getBd_id() %>",
			"nick" : "<%=vo.getBd_nick() %>",
			"cont" : "<%=vo.getBd_cont().replaceAll("\r","").replaceAll("\n","<br>")%>",
    		"bd_like" : "<%=vo.getBd_like() %>",
    		"on" : 
<%
 	if(!like.isEmpty()){
 		boolean flag = false;
	 	for(int j = 0; j < like.size(); j++){
	 		int num = like.get(j);
	 		if(vo.getBd_num()==num){
	 			flag = true;		
 			}
 		}
	 	if(flag){
%>
		"on"
<%
	 	}else{
%>
		"off"
<%
	 	}
 	}else{
 %>
 		"off"
 <%
    }
 %>
    		
    		,
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