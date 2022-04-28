<%@page import="soju.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   List<BoardVO> list = (List<BoardVO>)request.getAttribute("artBoardDetail");
 %>
[
 <%
    for(int i = 0; i < list.size(); i++){
    	BoardVO vo = list.get(i);
    	if(i > 0)out.print(",");
  %>
    {
     "bd_num"   :"<%= vo.getBd_num() %>",
     "bd_title"  :"<%= vo.getBd_title() %>",
     "bd_cont"  :"<%= vo.getBd_cont().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
     "bd_id"  :"<%= vo.getBd_id() %>",
     "bd_date"  :"<%= vo.getBd_date() %>",
     "bd_like"  :"<%= vo.getBd_like() %>",
     "bd_warn"  :"<%= vo.getBd_warn() %>",
     "cate_num" :"<%= vo.getCate_num() %>",
     "bd_reply_cnt":"<%= vo.getBd_reply_cnt() %>"
    
    }
 <%
    }
 %>
]
