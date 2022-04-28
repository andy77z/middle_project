/**
 * 
 */




//회원이 1:1 글쓰기
function MyQnAWrite(){
	$.ajax({
		url : '/soju/DiQnaInsert.do',
		data: fdata,
		type : 'post',
		success : function(res){
			//alert(res.sw);
			
			//form1안의 내용 지우기 
			$('.intxt').val("");
			
			alert("1:1 문의가 작성되었습니다.");
			
			MyQnAList(1);
		},
		error : function(xhr){
			//alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

//(관리자) 1:1 문의 보기 답변대기
function adminList(){
	$.ajax({
		url : '/soju/AdminQnaList.do',
		type : 'post',
		success : function(res){
			  code = '<div class="panel-group" id="accordion">';
			  $.each(res.datas, function(i, v){    
				   code += '<div class="panel panel-default">';
				   code += '<div class="panel-heading">';
				   code += '<h4 class="panel-title">';
				   code += '<a idx="'+ v.num +'" name="list" class="action"  data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.num + '"><div class="subsub">' + v.subject + '</div></br><div class="subdate">'+v.Myid + " / "  + v.date + '</div> </a> ';
				   code += '</h4>';
				   code += '</div>';
				   code += '<div id="collapse' + v.num + '" class="panel-collapse collapse">';
				   code += '<div class="panel-body pbody">';
				   code += '<br>';
				   code += '<p class="p3 listp3">';
				   code += v.content;
				   code += '</p>';
				   code += '<br>';
				   code += '<p class="p4">';
				   code += '<textarea rows="" cols="100"></textarea>';
				   code += '<input idx="' + v.num + '" type="button" value="등록" name="reply" class="action" >';
				   code += '</p>';
				 
				   code += '</div>';
				   code += '</div>';
				   code += '</div>';
			  })
			  code += '</div>';
			  
			  $('.list').html(code);
		  },
		error : function(xhr){
			//alert("상태 : " +xhr.status);
		},
		dataType : 'json'
	  })//ajax 끝	
}	  

//(관리자) 1:1 답변완료
function adminList2(){
	$.ajax({
		url : '/soju/AdminQnaListtt.do',
		type : 'post',
		success : function(res){
			code = '<div class="panel-group" id="accordion">';
			$.each(res.datas, function(i, v){    
				code += '<div class="panel panel-default">';
				code += '<div class="panel-heading">';
				code += '<h4 class="panel-title">';
				code += '<a idx="'+ v.num +'" name="list" class="action"  data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.num + '"><div class="subsub">' + v.subject + '</div></br><div class="subdate">' +v.Myid + " / " + v.date + '</div> </a> ';
				code += '</h4>';
				code += '</div>';
				code += '<div id="collapse' + v.num + '" class="panel-collapse collapse">';
				code += '<div class="panel-body pbody">';
				code += '<br>';
				code += '<p class="p3 listp3">';
				code += v.content;
				code += '</p>';
				code += '<br>';
				code += '<p class="p4">';
				code += '<textarea rows="" cols="100"></textarea>';
				code += '<input idx="' + v.num + '" type="button" value="등록" name="reply" class="action" >';
				code += '</p>';
				
				code += '</div>';
				code += '</div>';
				code += '</div>';
			})
			code += '</div>';
			
			$('.list').html(code);
		},
		error : function(xhr){
			//alert("상태 : " +xhr.status);
		},
		dataType : 'json'
	})//ajax 끝	
}	  


//(회원)내가 쓴 1:1 문의 보기
function MyQnAList(userId){
	$.ajax({
		url : '/soju/MyQnaList.do',
		data : {"userId" : userId} ,
		type : 'post',
		success : function(res){
			  code = '<div class="panel-group" id="accordion">';
			  $.each(res.datas, function(i, v){    
				   code += '<div class="panel panel-default">';
				   code += '<div class="panel-heading">';
				   code += '<h4 class="panel-title">';
				   code += '<a idx="'+ v.num +'" name="list" class="action"  data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.num + '"><div class="subsub">' + v.subject + '</div></br><div class="subdate">' + v.date + '</div> </a> ';
				   code += '</h4>';
				   code += '</div>';
				   code += '<div id="collapse' + v.num + '" class="panel-collapse collapse">';
				   code += '<div class="panel-body pbody">';
				   
				   code += '<br>';
				   code += '<p class="p3 listp3">';
				   code += v.content;
				   code += '</p>';
				   code += '<br>';
				   
				   code += '</div>';
				   code += '</div>';
				   code += '</div>';
			  })
			  code += '</div>';
			  
			  $('.list').html(code);
		  },
		error : function(xhr){
			//alert("상태 : " +xhr.status);
		},
		dataType : 'json'
	  })//ajax 끝	
}	  
	  
	  //1:1문의 쓴거 목록 
	  function replyList(brep){ //brep : 댓글등록버튼 또는 제목 클릭 
		//idx의 해당하는 댓글을 가져온다. 
		$.ajax({
			url : '/soju/MyQnaReplyList.do',
			type : 'post',
			data : { 'bonum' : idx},
			success : function(res){
				rcode = "";
				
				$(brep).parents('.panel').find('.pbody').find('.repl').remove();
				
				$.each(res, function(i, v){
					rcode += '<br>';
					rcode += '<div class="panel-body repl">';
					
						if(v.adate != "null" && v.ans != "null"){
						
						rcode += '<p class="p1">';
						rcode += '<span class="dq_adate">'+v.adate+'</span>';
						rcode += '</p>';
						
						rcode += '<p class="p3">';
						rcode += '&nbsp&nbsp'+v.ans;
						rcode += '</p>';
						
						}else{
							rcode += '<br>작성된 답변이 없습니다.<br><br>'; }
					
					rcode += '</div>';
					rcode += '<br>';
				})//each 끝
				
				$(brep).parents('.panel').find('.pbody').append(rcode);
			},
			error : function(xhr){
				//alert("상태 -- " + xhr.status)
			},
			dataType : 'json'
		})
	 }
	
	  
	//1:1문의 댓글달기
	function replyInsert(brep){ 
		$.ajax({
			url : '/soju/MyQnaReplyInsert.do',
			type : 'post',
			data : reply, //bonum,ans
			success : function(res){
				//성공 - res.sw
				//alert(res.sw);
				
				//댓글 리스트 출력 
				replyList(brep);
				
				//댓글 입력내용 지우기
				$('textarea').val("");
				
			},
			error : function(xhr){
				//alert("상태 ->> " + xhr.status);
			}, 
			dataType : 'json'
		})
	}//1:1문의 댓글달기 끝 	  
	  
	  
	  
