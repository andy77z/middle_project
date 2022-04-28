<%@page import="java.util.List"%>
<%@page import="soju.vo.ReplyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
   List<ReplyVO> replList = (List<ReplyVO>)request.getAttribute("artReplList");
 %>
 [   
 <% 
        for(int i = 0; i < replList.size(); i++){
        	ReplyVO rvo = replList.get(i);
        	if(i > 0)out.print(",");
       %>
        {
         "rp_num" :"<%= rvo.getRp_num() %>",
         "rp_cont":"<%= rvo.getRp_cont().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
         "rp_nick":"<%= rvo.getRp_nick() %>",
         "rp_id":"<%= rvo.getRp_id() %>",
         "rp_date":"<%= rvo.getRp_date() %>",
         "rp_like":"<%= rvo.getRp_like() %>",
         "rp_warn":"<%= rvo.getRp_warn() %>",
         "bd_num" :"<%= rvo.getBd_num() %>",
         "rp_profile":"<%= rvo.getRp_profile() %>"
         }
 <%    
     }
 %>   
 ]