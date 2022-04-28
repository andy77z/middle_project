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
	width: 100px;
}
.td5{
	width: 150px;
}
.td6{
	width: 100px;
}
.td7{
	width: 100px;
}
.td8{
	width: 45px;
}
</style>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$.ajax({
		url: '<%= request.getContextPath() %>/AdminArtistList.do',
		type: 'post',
		success: function(res){
			str="<tr>";
			$.each(res, function(i, v){
				str += `<td class="td1">\${v.art_num}</td>`;
				str += `<td class="td2">\${v.art_id}</td>`;
				str += `<td class="td3">\${v.art_name}</td>`;
				/* str += `<td class="td4">\${v.gr_name}</td>`; */
				str += `<td class="td5">\${v.art_mail}</td>`;
				str += `<td class="td6">\${v.sub_cnt}</td>`;
				str += `<td class="td7">\${v.agc_num}</td>`;
				str += `<td class="td8">\${v.art_resign}</td></tr>`;
				
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
<h4>아티스트 계정관리</h4>
	<div class="member">
		<table border="1">
			<tbody>
				<tr>
					<td class="td1">아티<br>스트<br>번호</td>
					<td class="td2">ID</td>
					<td class="td3">아티스트<br>명</td>
					<!-- <td class="td4">그룹명</td> -->
					<td class="td5">이메일</td>
					<td class="td6">구독자<br>수</td>
					<td class="td7">소속사</td>
					<td class="td8">탈퇴<br>여부</td>
					
				</tr>
				
			</tbody>
			</table>
			<table border="1" class="tab">
			
			</table>
		
		
	</div>
</body>
</html>