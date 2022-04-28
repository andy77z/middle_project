<%@page import="soju.vo.ReplyVO"%>
<%@page import="soju.vo.FileVO"%>
<%@page import="soju.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<BoardVO> board = (List<BoardVO>)request.getAttribute("board");
	List<FileVO> files = (List<FileVO>)request.getAttribute("files");
	List<ReplyVO> reply = (List<ReplyVO>)request.getAttribute("reply");
	String bdlike = (String) request.getAttribute("bdlike");
	List<Integer> rplike = (List<Integer>) request.getAttribute("rplike");
%>
<%
	for(int i = 0; i < board.size(); i++){
		BoardVO bvo = board.get(i);
		if(i > 0) out.print(",");
%>
		{
			"num" : "<%= bvo.getBd_num() %>",
			"title" : "<%= bvo.getBd_title() %>",
			"writer" : "<%= bvo.getBd_nick() %>",
			"bd_profile" : "<%= bvo.getBd_profile() %>",
			"id" : "<%= bvo.getBd_id() %>",
			"date" : "<%= bvo.getBd_date() %>",
			"cont" : "<%= bvo.getBd_cont().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
			"like" : "<%= bvo.getBd_like() %>",
			"recnt" : "<%= bvo.getBd_reply_cnt() %>",
			"on" : "<%= bdlike %>",
			"files" : [
<%
	for(int j = 0; j < files.size(); j++){
		FileVO fvo = files.get(j);
		if(j > 0) out.print(",");
%>
			"<%=fvo.getFiles_path() %>"
<%
	}
%>
					  ],
			"reply" : [
<%
	for(int k = 0; k < reply.size(); k++){
		ReplyVO rvo = reply.get(k);
		if(k > 0) out.print(",");
%>
			{
				"rp_profile" : "<%= rvo.getRp_profile() %>",
				"rp_id" : "<%= rvo.getRp_id() %>",
			 	"rp_nick" : "<%= rvo.getRp_nick() %>",
			 	"rp_cont" : "<%= rvo.getRp_cont().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
			 	"rp_date" : "<%= rvo.getRp_date() %>",
			 	"rp_like" : "<%= rvo.getRp_like() %>",
			 	"rp_warn" : "<%= rvo.getRp_warn() %>",
			 	"rp_num" : "<%= rvo.getRp_num() %>",
			 	"rp_on" : 
<%
 	if(!rplike.isEmpty()){
 		boolean flag = false;
	 	for(int j = 0; j < rplike.size(); j++){
	 		int num = rplike.get(j);
	 		if(rvo.getRp_num()==num){
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
			}
<%
	}
%>
					  ]
		}
<%
	}
%>