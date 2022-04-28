<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So? Would You?</title>
<style>

table{
	border-collapse: collapse;
	border-color: lightgray;
}
td{
	text-align : center;
	height : 50px;
	font-size: 15px;
}
.td1{
	width: 45px;
}
.td2{
	width: 120px;
}
.td3{
	width: 100px;
}
.td4{
	width: 120px;
}
.td5{
	width: 180px;
	font-size: 14px;
}
.td6{
	width: 45px;
	font-size: 14px;
}
.td7{
	width: 45px;
	font-size: 14px;
}
.td8{
	width: 45px;
	font-size: 14px;
}
.td0{
	width: 45px;
	font-size: 14px;
}


</style>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$.ajax({
		url: '<%= request.getContextPath() %>/AdminMember.do',
		type: 'post',
		success: function(res){
			str="<tr>";
			$.each(res, function(i, v){
				str += `<td class="td1">\${v.num}</td>`;
				str += `<td class="td2">\${v.mem_id}</td>`;
				str += `<td class="td3">\${v.mem_name}</td>`;
				str += `<td class="td4">\${v.mem_nick}</td>`;
				str += `<td class="td5">\${v.mem_mail}</td>`;
				str += `<td class="td6">\${v.warn_cnt}</td>`;
				str += `<td class="td7">\${v.ban}</td>`;
				str += `<td class="td8">\${v.premium}</td>`;
				str += `<td class="td0">\${v.mem_resign}</td></tr>`; 
				
			})
			$('.tab').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
})

</script>
</head>
<body>
	<h4>회원목록</h4>
	<div class="member">
		<table border="1">
			<tbody>
				<tr>
					<td class="td1">회원<br>번호</td>
					<td class="td2">ID</td>
					<td class="td3">이름</td>
					<td class="td4">닉네임</td>
					<td class="td5">이메일</td>
					<td class="td6">경고<br>횟수</td>
					<td class="td7">정지<br>여부</td>
					<td class="td8">유료<br>결제<br>여부</td>
					<td class="td0">탈퇴<br>여부</td>
				</tr>
				
			</tbody>
			</table>
			<table border="1" class="tab">
			
			</table>
		
		
	</div>


</body>
</html>