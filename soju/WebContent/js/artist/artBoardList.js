/**

 * 
 */
		
function getArtist(){
	$.ajax({
		url : '/soju/getArtist.do',
		data : {"art_num":art_num},
		type : 'post',
		success : function(res) {
			$('.aname p').text(res.art_name);
			$('.wever').text(res.sub_cnt);
			$('.aprofile img').attr('src', "/soju/images/"+res.art_photo);
			getCate_num();
		},
		error : function (xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function getCate_num(){
	$.ajax({
		url : '/soju/getCateNum.do',
		data : {"art_num":art_num,
				"cate_name":cate_name},
		type : 'post',
		success : function(res) {
			cate_num = res.cate_num;
			$('input[name=cate_num]').val(cate_num);
			artBoardList();
		},
		error : function (xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function artBoardList(){
	$.ajax({
		url : '/soju/ArtBoardList.do',
		type : 'get',
		data : {"artNum" : art_num}, 
		success : function(res){
			code = "";
			$.each(res, function(i, v){
			bd_num = v.bd_num;	
			
			console.log(idx);
			code += '<article class="arti" id="' + bd_num  +'">';
			code += '<div class="artList">';
			code += '<div class="artHead">';
			code += '<div class="artImgDiv">';
			code += '<img class="artImg" src="../images/BLACKPINK.jpg">';
			code += '</div>';
			code += '<div class="artInfo">';
			code += '<h5 class="artName">'+ v.bd_nick +'</h5>';
			
			
			//드롭다운
			code += '<div class="dropdown">';
			code += '<button class="moreBtn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">더보기';  
			code += '<span class="caret"></span></button>';  
			code += '<ul class="dropdown-menu dropdown-menu-right">';  
//			code += '<li><a href="#">댓글신고</a></li>';
			
			//글 작성자와 로그인한 아이디와 같으면
//			if(v.bd_nick==art_name){
				code += '<li><button class="dropdownBtn" name="updateBtn" type="submit">수정</button></li>';
				code += '<li><button class="dropdownBtn" name="deleteBtn" type="submit">삭제</button></li>';
			//글 작성자와 로그인한 아이디가 다르면
//			}else{
				code += '<li><button class="dropdownBtn" name="reportBtn" type="submit">';
				code +=	'<img class="reportImg"src="../images/report.png">신고</button></li>';
//			}
			  
			code += '</ul>';  
			code += '</div>';  
			
			//드롭다운 종료
			
			code += '<span class="artDate">'+ v.bd_date +'</span>';
			code += '</div>';
			code += '</div>';
			code += '<div class="artContent">';
			code += ''+ v.bd_cont +'';
			code += '</div>';
			code += '<div class="contentImgDiv">';
			code += '<a class="artContentDetail" href="https://www.weverse.io/blackpink/artist/1677660896843606?photoId=272501602">';
			code += '<img class="artContentImg" src="../images/BLACKPINK.jpg">';
			code += '</a>';
			code += '</div>';
			code += '<div class="artReact">';
			code += '<div class="artReactLike">';
			code += '<label aria-disabled="false" role="button">';
			code += '<input class="reactLikeCheck" type="checkbox">';
			code += '<img class="likeBtn';
				if(v.on=="on") code += ' on"';
				else code += '"';
			code +=	' src="../images/star.png">';
			code += '<span class="reactCount">'+ v.bd_like +'</span>';
			code += '</label> ';
			code += '</div>';
			code += '<div class="artReactReply">';
			code += '<label aria-disabled="false" role="button">';
			code += '<input class="reactReplyCheck" type="checkbox">';
			code += '<img class="replBtn" src="../images/reply.png">';
			code += '<span class="reactCount">'+ v.bd_reply_cnt +'</span>';
			code += '</label> ';
			code += '</div>';
			code += '</div>';
			code += '<div class="artReplyList">';
			code += '<div class="moreReply">';
			code += '<button data-toggle="modal" data-target="#intro" value="' + v.bd_num+ '" class="moreRepBtn btn-info" type="button" >댓글 더보기</button>';
			code += '</div>';
			code += '<div class="userReply">';
			code += '<div class="userProfileDiv">';
			code += '<img class="userProfile" src="../images/BLACKPINK.jpg">';
			code += '</div>';
			code += '<div class="replyWriteDiv">';
			code += '<form class="replyForm form-control">';
			code += '<textarea class="replyWrite" cols="50" rows="1" placeholder="댓글을 입력하세요..."></textarea>';
			code += '<button class="loadRepBtn btn-link" value="' + v.bd_num+ '" type="button">게시</button>';
			code += '</form>';
			code += '</div>';
			code += '</div>';
			code += '</div> ';
			code += '</article>';
			
//			$('.section2').html(code);
			$('.three').html(code);
			
		
			
//			artReplyList(bdNum);
			})
			
	},
	 error : function(xhr){
		 alert("상태 :" + xhr.status);
	 },
	 dataType : 'json'
	})
}

//게시글 상세  modal에 댓글리스트 출력
function artBoardDetail_reply(idx){
	$.ajax({
		url : '/soju/ArtReplyList.do',
		type : 'get',
		data : {"bdNum" : idx},
		success : function(res){
			rcode = '';
			$.each(res, function(i, v){
				
				rcode += '<div class="artReplyImg">';
				rcode += '<img class ="repImg" src="../images/BLACKPINK.jpg">';
				rcode += '</div>';
				rcode += '<div class="repInfo" rdx='+ v.rp_num +'>';
				rcode += '<span class="repName">'+ v.rp_nick +'</span>';
				
				//드롭다운
				rcode += '<div class="dropdown">';
				rcode += '<button class="moreBtn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">더보기';  
				rcode += '<span class="caret"></span></button>';  
				rcode += '<ul class="dropdown-menu dropdown-menu-right">';  
//				rcode += '<li><a href="#">댓글신고</a></li>';
				
				//글 작성자와 로그인한 아이디와 같으면
//				if(v.bd_nick==art_name){
					rcode += '<li><button class="dropdownBtn" name="updateBtn" type="submit">수정</button></li>';
					rcode += '<li><button class="dropdownBtn" name="deleteBtn" type="submit">삭제</button></li>';
				//글 작성자와 로그인한 아이디가 다르면
//				}else{
					rcode += '<li><button class="dropdownBtn" name="reportBtn" type="submit">';
					rcode +=	'<img class="reportImg"src="../images/report.png">신고</button></li>';
//				}
				  
				rcode += '</ul>';  
				rcode += '</div>';  
				
				//드롭다운 종료
				
				
				rcode += '<span class="artReply">'+ v.rp_cont +'</span> ';
				rcode += '</div>';
				rcode += '<div class=artReplyLike>';
				rcode += '<label aria-disabled="false" role="button">';
				
				rcode += '<input class="reactLikeCheck" type="checkbox">';
				rcode += '<img class="likeBtn';
					if(v.on=="on") rcode += ' on"';
					else rcode += '"';
				rcode +=	' src="../images/star.png">';
				rcode += '<span class="reactCount">'+ v.rp_like +'</span>';
				rcode += '</label>';
				rcode += '<span class="repDate">'+ v.rp_date +'</span>';
				rcode += '</div>';

				$('.artReplyList').html(rcode);
          	});
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})	
}
			
	







//게시글 상세 modal에 게시글 리스트 추가

function artBoardDetail(idx){
	$.ajax({
		url : '/soju/ArtBoardDetail.do',
		type : 'get',
		data : {"bdNum" : idx}, 
		success : function(res){
			
			$('#intro').modal('show');
			
			$('.artName').text(res[0].bd_nick);
			$('.artDate').text(res[0].bd_date);
			$('.artContent').text(res[0].bd_cont);
			$('.artReactLikeCnt').text(res[0].bd_like);
			$('.artReactReplyCnt').text(res[0].bd_reply_cnt);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})	
}

function insertReply(){
	$.ajax({
		url : '/soju/ArtReplyInsert.do',
		type : 'post',
		data : reply,
		success : function(res){
			alert(res.sw);
			
			// append를 위한 rcode
			rcode = '';
			$.each(res, function(i, v){
				
				rcode += '<div class="artReplyImg">';
				rcode += '<img class ="repImg" src="../images/BLACKPINK.jpg">';
				rcode += '</div>';
				alert(v.rp_nick);
				rcode += '<div class="repInfo" rdx='+ v.rp_num +'>';
				rcode += '<span class="repName">'+ v.rp_nick +'</span>';
				
				//드롭다운
				rcode += '<div class="dropdown">';
				rcode += '<button class="moreBtn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">더보기';  
				rcode += '<span class="caret"></span></button>';  
				rcode += '<ul class="dropdown-menu dropdown-menu-right">';  
//				rcode += '<li><a href="#">댓글신고</a></li>';
				
				//글 작성자와 로그인한 아이디와 같으면
//				if(v.bd_nick==art_name){
					rcode += '<li><button class="dropdownBtn" name="updateBtn" type="submit">수정</button></li>';
					rcode += '<li><button class="dropdownBtn" name="deleteBtn" type="submit">삭제</button></li>';
				//글 작성자와 로그인한 아이디가 다르면
//				}else{
					rcode += '<li><button class="dropdownBtn" name="reportBtn" type="submit">';
					rcode +=	'<img class="reportImg"src="../images/report.png">신고</button></li>';
//				}
				  
				rcode += '</ul>';  
				rcode += '</div>';  
				
				//드롭다운 종료
				
				
				rcode += '<span class="artReply">'+ v.rp_cont +'</span> ';
				rcode += '</div>';
				rcode += '<div class=artReplyLike>';
				rcode += '<label aria-disabled="false" role="button">';
				
//				rcode += '<input class="replyLikeCheck" type="checkbox">';
//				rcode += '<img src="../images/star.png">';
//				rcode += '<span>'+ v.rp_like +'</span>';
				
				rcode += '<input class="reactLikeCheck" type="checkbox">';
				rcode += '<img class="likeBtn';
					if(v.on=="on") rcode += ' on"';
					else rcode += '"';
				rcode +=	' src="../images/star.png">';
				rcode += '<span class="reactCount">'+ v.rp_like +'</span>';
				rcode += '</label>';
				rcode += '<span class="repDate">'+ v.rp_date +'</span>';
				rcode += '</div>';

				$('.artReplyList').append(rcode);
			});
		},
		error : function(xhr){
			alert("상태: " + xhr.status);
		},
		dataType : 'json'
		
	});
};