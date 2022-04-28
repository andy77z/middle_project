
<%@page import="soju.vo.PayVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
   //ArtBoardList서블릿에서 request의 자료 공유
   
   List<PayVO> list = (List<PayVO>)request.getAttribute("paymentList");
%> 
[
 <%
    for(int i = 0; i < list.size(); i++){
    	PayVO vo = list.get(i);
    	if(i > 0)out.print(",");
  %>
    {
     "pay_num"  :"<%= vo.getPay_num() %>",
     "pay_name"  :"<%= vo.getPay_name() %>",
     "pay_date"  :"<%= vo.getPay_date() %>",
     "pay_price" :"<%= vo.getPay_price() %>",
     "refund":"<%= vo.getRefund() %>",
     "agc_num":"<%= vo.getAgc_num() %>"
    }
 <%
    }
 %>
]
