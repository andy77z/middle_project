<%@page import="soju.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	List<MemberVO> list = (List<MemberVO>)request.getAttribute("listmember");
%>

[

<%
	int i = 0;
	for(MemberVO vo : list){
		if(i > 0) out.print(",");
%>

		{
			"num" : "<%= vo.getMem_num() %>",
			"mem_id" : "<%= vo.getMem_id() %>",
			"mem_name" : "<%= vo.getMem_name() %>",
			"mem_nick" : "<%= vo.getMem_nick() %>",
			"mem_mail" : "<%= vo.getMem_mail() %>",
			"warn_cnt" : "<%= vo.getWarn_cnt() %>",
			"ban" : "<%= vo.getBan() %>",
			"premium" : "<%= vo.getPremium() %>",
			"mem_photo" :" <%= vo.getMem_photo() %>",
			"mem_resign" : "<%= vo.getMem_resign() %>"
		}
<%
	i++;
	}
%>



]

