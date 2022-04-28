<%@page import="soju.vo.SubscribeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So? Would You?</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script>
	$(function(){
		$('.sub').on('click',function(){
			location.href = '<%=request.getContextPath()%>/insertSub.do';
		})
		
		$('.back').on('click',function(){
			location.href = '<%=request.getContextPath()%>/jsp/main/loginMain.jsp';
		})
	})
</script>
<style>
/*  .box{
 	position : relative;
 	width: 60%;
 	height: auto;
 	min-height: 100px;
 	background-color: rgb(214, 234, 248, 0.3);
 	border-radius: 0px 12px 12px;
 	overflow: auto;
 	font-size: 15px;
 } */
 .msg{
 	margin: 30px 30px 0px 30px;
 	text-align: center;
 	font-weight: bold;
 	color: #2D3337;
 }
 .btn{
 	margin: 20px 0px 30px;
 	text-align: center;
 }
 .sub, .back{
 	background-color: #C8D9E4;
 	border: none;
 	padding: 8px;
 	border-radius: 5px;
 	font-weight: bold;
 	color: #2D3337;
 	cursor: pointer;
 }
 .sub{
 	margin-right: 10px;
 }
 .back{
 	margin-left: 10px;
 }
 .box{
 	position:absolute; 
 	width:40%; 
 	height: auto;
 	min-height: 100px;
 	background-color: rgb(214, 234, 248, 0.3);
 	border-radius: 0px 12px 12px;
 	top:40%; 
 	left:32%; 
 	margin-top:-50px; 
 	margin-left:-50px;
 	font-size: 15px;

 }
</style>
</head>
<body>
	<div class="box">
		<div class="msg">해당 아티스트를 구독하지 않았습니다. 구독 하시겠습니까?</div>
		<div class="btn">
			<input class="sub" type="button" value="구독하기!!!">
			<input class="back" type="button" value="돌아가기...">
		</div>
	</div>
</body>
</html>