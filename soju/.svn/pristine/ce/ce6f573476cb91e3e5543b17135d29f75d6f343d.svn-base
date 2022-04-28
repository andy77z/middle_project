<%@page import="soju.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	List<ReplyVO> list = (List<ReplyVO>)request.getAttribute("list");
    	List<Integer> rplike = (List<Integer>)request.getAttribute("rplike");
    %>
    [
    	<%
    		for(int i = 0; i<list.size(); i++){
    			ReplyVO vo = list.get(i);
    			if(i>0) out.print(",");
    	%>
    		{
    			"bdnum" : "<%= vo.getBd_num() %>",
    			"id" : "<%= vo.getRp_id() %>",
    			"nick" : "<%= vo.getRp_nick() %>",
    			"profile" : "<%= vo.getRp_profile() %>",
    			"cont" : "<%= vo.getRp_cont().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
    			"date" : "<%= vo.getRp_date() %>",
    			"like" : "<%= vo.getRp_like() %>",
    			"warn" : "<%= vo.getRp_warn() %>",
    			"rpnum" : "<%=vo.getRp_num() %>",
    			"on" : 
<%
 	if(!rplike.isEmpty()){
 		boolean flag = false;
	 	for(int j = 0; j < rplike.size(); j++){
	 		int num = rplike.get(j);
	 		if(vo.getRp_num()==num){
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