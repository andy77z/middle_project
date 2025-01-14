/**
 * 
 */
function getArtist2(){
	$.ajax({
		url : '/soju/getArtist.do',
		data : {"art_num":art_num},
		type : 'post',
		success : function(res) {
			$('.aname p').text(res.art_name);
			$('.wever').text(res.sub_cnt);
			$('.aprofile img').attr('src', "/soju/profile.do?fileName="+res.art_photo);
			getMediaCate_num();
		},
		error : function (xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function getArtist(){
	$.ajax({
		url : '/soju/getArtist.do',
		data : {"art_num":art_num},
		type : 'post',
		success : function(res) {
			$('.aname p').text(res.art_name);
			$('.wever').text(res.sub_cnt);
			$('.aprofile img').attr('src', "/soju/profile.do?fileName="+res.art_photo);
			agc_num = res.agc_num;
			getCate_num();
		},
		error : function (xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function getArtistDV(){
	$.ajax({
		url : '/soju/getArtist.do',
		data : {"art_num":art_num},
		type : 'post',
		success : function(res) {
			$('.aname p').text(res.art_name);
			$('.wever').text(res.sub_cnt);
			$('.aprofile img').attr('src', "/soju/profile.do?fileName="+res.art_photo);
			getVideoDetail();
		},
		error : function (xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function getArtistDP(){
	$.ajax({
		url : '/soju/getArtist.do',
		data : {"art_num":art_num},
		type : 'post',
		success : function(res) {
			$('.aname p').text(res.art_name);
			$('.wever').text(res.sub_cnt);
			$('.aprofile img').attr('src', "/soju/profile.do?fileName="+res.art_photo);
			getPhotoDetail();
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
			if(cate_name=="video"){
				getVideoList();
			}else if(cate_name=="photo"){
				getPhotoList();
			}
		},
		error : function (xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function getMediaCate_num(){
	$.ajax({
		url : '/soju/getCateNumMedia.do',
		data : {"art_num":art_num,
				"cate_name":cate_name,
				"cate_name2":cate_name2},
		type : 'post',
		success : function(res) {
			cate_num = res.cate_num;
			cate_num2 = res.cate_num2;
			getMediaList();
		},
		error : function (xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function getMediaList(){
	$.ajax({
		url:'/soju/mediaList.do', //<<<<<여기부터하면됨
		data: {"cate_num" : cate_num,
			   "cate_num2" : cate_num2},
		type: 'post',
		success: function(res){
			str_v = "";
			str_p = "";
			vcnt = 0;
			pcnt = 0;
			$.each(res, function(i,v){
				if(v.type=="video"){
					if(vcnt > 3) return false;
					str_v += `<div class="list-video">`;
					str_v += `<div class="cont-video">`;
					str_v += `<a href="/soju/videoDetail.do?num=${v.num}">`;
					str_v += `<div class="thumb">`;
					str_v += `<div class="thumb-img" style="background-image: url('/soju/imageView.do?fileName=${v.files[0]}&fileType=video');"></div>`;
					str_v += `</div>`;
					str_v += `<div class="title">${v.title}</div>`;
					str_v += `<div class="date">${v.date}</div>`;
					str_v += `</a>`;
					str_v += `</div>`;
					str_v += `</div>`;
					vcnt++
				}else{
					if(pcnt > 3) return false;
					str_p += `<div class="list-video">`;
					str_p += `<div class="cont-video">`;
					str_p += `<a href="/soju/photoDetail.do?num=${v.num}">`;
					str_p += `<div class="thumb">`;
					str_p += `<div class="thumb-img" style="background-image: url('/soju/imageView.do?fileName=${v.files[0]}&fileType=photo');"></div>`;
					str_p += `</div>`;
					str_p += `<div class="title">${v.title}</div>`;
					str_p += `<div class="date">${v.date}</div>`;
					str_p += `</a>`;
					str_p += `</div>`;
					str_p += `</div>`;
					pcnt++
				}
			});
			$('.video-list').html(str_v);
			$('.photo-list').html(str_p);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	});
}

function getPhotoList(){
	$.ajax({
		url:'/soju/allList.do',
		data: {"cate_num" : cate_num},
		type: 'post',
		success: function(res){
			
			str = "";
			str += `<h2 class="categoryname">사진</h2>`;
			if(agc_num==loginAgcNum){
				str += `<button type="button" class="btn btn btn-sm action add" name="video" data-toggle="modal" data-target="#addphoto">`;
				str += `추가</button>`;
			}
			$('.category').html(str);
			
			str = "";
			$.each(res, function(i,v){
					str += `<div class="list-video">`;
					str += `<div class="cont-video">`;
					str += `<a href="/soju/photoDetail.do?num=${v.num}">`;
					str += `<div class="thumb">`;
					str += `<div class="thumb-img" style="background-image: url('/soju/imageView.do?fileName=${v.files[0]}&fileType=photo');"></div>`;
					str += `</div>`;
					str += `<div class="title">${v.title}</div>`;
					str += `<div class="date">${v.date}</div>`;
					str += `</a>`;
					str += `</div>`;
					str += `</div>`;
			});
			$('.list').html(str);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	});
}

function getVideoList(){
	$.ajax({
		url:'/soju/allList.do',
		data: {"cate_num" : cate_num},
		type: 'post',
		success: function(res){
			
			str = "";
			str += `<h2 class="categoryname">영상</h2>`;
			if(agc_num==loginAgcNum){
				str += `<button type="button" class="btn btn btn-sm action add" name="video" data-toggle="modal" data-target="#addvideo">`;
				str += `추가</button>`;
			}
			$('.category').html(str);
			
			str = "";
			$.each(res, function(i,v){
					str += `<div class="list-video">`;
					str += `<div class="cont-video">`;
					str += `<a href="/soju/videoDetail.do?num=${v.num}">`;
					str += `<div class="thumb">`;
					str += `<div class="thumb-img" style="background-image: url('/soju/imageView.do?fileName=${v.files[0]}&fileType=video');"></div>`;
					str += `</div>`;
					str += `<div class="title">${v.title}</div>`;
					str += `<div class="date">${v.date}</div>`;
					str += `</a>`;
					str += `</div>`;
					str += `</div>`;
			});
			$('.list').html(str);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	});
}

function getPhotoDetail(){
		$.ajax({
			url:'/soju/photoContent.do',
			data: {"num" : num,
				   "user_id" : user_id},
			type: 'post',
			success: function(res){
				$('.title').attr('bd_num', res.num);
				$('.title').text(res.title);
				$('.date span').text(res.date);
				$('.writer').text(res.writer);
				$('.writer').attr('id',res.id);
				str = "";
				if(res.id==user_id){
					str += `<button type="button" class="btn btn btn-sm action delete">`
					str += `삭제</button>`
					str += `<button type="button" class="btn btn btn-sm action modify" data-toggle="modal" data-target="#modifydetail">`
					str += `수정</button>`
				}
				$('.title-box').append(str);
				$('.content').html(res.cont);
				
				str = "";
				$.each(res.files, function(i,v){
					str += `<div class="images">`
					str += `<img class="image" src="/soju/imageView.do?fileName=${v}&fileType=photo">`
					str += `</div>`
				})
				str += `<p class="bottom"></p>` <!-- 마지막사진밑에? -->
				$('.image-box').html(str);
				
				str = "";
				str += '<div class="artReact">';
		        str += '<div class="artReactLike">';
		        str += '<label aria-disabled="false" role="button">';
		        str += '<input class="reactLikeCheck" name="bdlike" type="checkbox">';
		        str += '<img class="likeBtn';
		            if(res.on=="on") str += ' on"';
		            else str += '"';
		        str += ' src="/soju/images/star.png">';
		        str += '<span class="reactCount">'+ res.like +'</span>';
		        str += '</label> ';
		        str += '</div>';
		        $('.count-box').append(str);
			
				str = "";
				$.each(res.reply, function(i, v){
					str += `<div class="one-reply" idx="${v.rp_num}">`;
					str += `<div class="profile">`;
					str += `<img src="/soju/profile.do?fileName=${v.rp_profile}">`;
					str += `</div>`;
					str += `<div class="reply-box">`;
					str += `<div class="reply-writer">${v.rp_nick}</div>`;
					str += `<div class="reply-date">${v.rp_date}</div>`;
//						str += `<div class="warn">`;
//						str += `신고 : <span>${v.rp_warn}</span>`;
//						str += `</div>`;
					str += '<div class="artReact">';
			        str += '<div class="artReactLike">';
			        str += '<label aria-disabled="false" role="button">';
			        str += '<input class="reactLikeCheck" name="rplike" type="checkbox">';
			        str += '<img class="likeBtn';
			            if(v.rp_on=="on") str += ' on"';
			            else str += '"';
			        str +=   ' src="/soju/images/star.png">';
			        str += '<span class="reactCount">'+ v.rp_like +'</span>';
			        str += '</label> ';
			        str += '</div>';
//						str += `<div class="like">`;
//						str += `좋아요 : <span>${v.rp_like}</span>`;
//						str += `</div>`;
					str += `</div>`;
					str += `<br>`;
					str += `<div style="display:inline-block; float : right;">`;
				    if(user_id==v.rp_id){
				    	str += `<button type="button" idx="${v.rp_num}" name="rdele" class="sbut rdelete">삭제</button>`;
				    }
				    str += `</div>`
					str += `<div class="reply-content">${v.rp_cont}</div>`;
					str += `</div>`;
					str += `</div>`;
				})
				$('.reply-list').html(str);
			},
			error: function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType: 'json'
		})
}

function getVideoDetail(){
	$.ajax({
		url:'/soju/photoContent.do',
		data: {"num" : num,
			   "user_id" : user_id},
		type: 'post',
		success: function(res){
			$('.title').attr('bd_num', res.num);
			$('.title').text(res.title);
			$('.date span').text(res.date);
			$('.writer').text(res.writer);
			$('.writer').attr('id',res.id);
			$('.content').html(res.cont);
			$('.like-count').text(res.like);
			$('.video').attr('src', "/soju/imageView.do?fileName=" + res.files  + "&fileType=video");
			
			str = "";
			if(res.id==user_id){
				str += `<button type="button" class="btn btn btn-sm action delete">`
				str += `삭제</button>`
				str += `<button type="button" class="btn btn btn-sm action modify" data-toggle="modal" data-target="#modifydetail">`
				str += `수정</button>`
			}
			$('.title-box').append(str);
			
			str = "";
			str += '<div class="artReact">';
	        str += '<div class="artReactLike">';
	        str += '<label aria-disabled="false" role="button">';
	        str += '<input class="reactLikeCheck" name="bdlike" type="checkbox">';
	        str += '<img class="likeBtn';
	            if(res.on=="on") str += ' on"';
	            else str += '"';
	        str += ' src="/soju/images/star.png">';
	        str += '<span class="reactCount">'+ res.like +'</span>';
	        str += '</label> ';
	        str += '</div>';
	        $('.count-box').append(str);
	        
			str = "";
			$.each(res.reply, function(i, v){
				str += `<div class="one-reply" idx="${v.rp_num}">`;
				str += `<div class="profile">`;
				str += `<img src="/soju/profile.do?fileName=${v.rp_profile}">`;
				str += `</div>`;
				str += `<div class="reply-box">`;
				str += `<div class="reply-writer">${v.rp_nick}</div>`;
				str += `<div class="reply-date">${v.rp_date}</div>`;
//				str += `<div class="warn">`;
//				str += `신고 : <span>${v.rp_warn}</span>`;
//				str += `</div>`;
				str += '<div class="artReact">';
		        str += '<div class="artReactLike">';
		        str += '<label aria-disabled="false" role="button">';
		        str += '<input class="reactLikeCheck" name="rplike" type="checkbox">';
		        str += '<img class="likeBtn';
		            if(v.rp_on=="on") str += ' on"';
		            else str += '"';
		        str +=   ' src="/soju/images/star.png">';
		        str += '<span class="reactCount">'+ v.rp_like +'</span>';
		        str += '</label> ';
		        str += '</div>';
//				str += `<div class="like">`;
//				str += `좋아요 : <span>${v.rp_like}</span>`;
//				str += `</div>`;
				str += `</div>`;
				str += `<br>`;
				str += `<div style="display:inline-block; float : right;">`;
			    if(user_id==v.rp_id){
			    	str += `<button type="button" idx="${v.rp_num}" name="rdele" class="sbut rdelete">삭제</button>`;
			    }
			    str += `</div>`
				str += `<div class="reply-content">${v.rp_cont}</div>`;
				str += `</div>`;
				str += `</div>`;
			})
			$('.reply-list').html(str);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

function deletePhoto(){
	$.ajax({
		url:'/soju/deleteMedia.do',
		data: {"num" : num},
		type: 'post',
		success: function(res){
			if(res.sw=="성공") {
				alert("게시글을 삭제했습니다.");
				location.href = '/soju/jsp/media/photoAll.jsp';
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

function deleteVideo(){
	$.ajax({
		url:'/soju/deleteMedia.do',
		data: {"num" : num},
		type: 'post',
		success: function(res){
			if(res.sw=="성공") {
				alert("게시글을 삭제했습니다.");
				location.href = '/soju/jsp/media/videoAll.jsp';
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

function insertPhotoReply(){
	$.ajax({
		url:'/soju/ReplyInsert.do',
		data: reply,
		type: 'post',
		success: function(res){
			if(res.sw=="성공") {
				$('.textbox').val("");
				$('.title-box button').remove();
				$('.count-box').empty();
				getPhotoDetail();
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

function insertVideoReply(){
	$.ajax({
		url:'/soju/ReplyInsert.do',
		data: reply,
		type: 'post',
		success: function(res){
			if(res.sw=="성공") {
				$('.textbox').val("");
				$('.title-box button').remove();
				$('.count-box').empty();
				getVideoDetail();
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

function deleteReply(del) {
	$.ajax({
		url : '/soju/DeleteReply.do',
		type : 'get',
		data : {"rp_num" : idx},
		success : function(res) {
				$(del).parents('.one-reply').remove();
		},
		error : function(xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
		
	})
}

function updateBoard(){
	$.ajax({
		url:'/soju/updateBoard.do',
		data: data,
		type: 'post',
		success: function(res){
			if(res.sw=="성공") {
				title = $('input[name=bd_title]').val();
				$('.title').text(title);
				content = $('.modibox').val();
				content = content.replace(/\r/g, "").replace(/\n/g, "<br>");
				$('.content').html(content);
				
				//모달창에 입력내용 지우기
				$('.modibox').text("");
				
				//모달창 닫기
				$('#modifydetail').modal('hide');
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}

function bd_like(btn){
	$.ajax({
		url:'/soju/bd_like.do',
		type : 'post',
		data : {"bd_num" : bn,
				"user_id" : user_id},
		success : function(res) {
			if(res.sw=="성공"){
				cnt = $(btn).next().next();
				$(cnt).text(parseInt($(cnt).text()) + 1);
			}
		},
		error : function(xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function bd_likeD(btn){
	$.ajax({
		url:'/soju/bd_likeD.do',
		type : 'post',
		data : {"bd_num" : bn,
				"user_id" : user_id},
		success : function(res) {
			if(res.sw=="성공"){
				cnt = $(btn).next().next();
				$(cnt).text(parseInt($(cnt).text()) - 1);
			}
		},
		error : function(xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function rp_like(btn){
	$.ajax({
		url:'/soju/rp_like.do',
		type : 'post',
		data : {"rp_num" : rn,
				"user_id" : user_id},
		success : function(res) {
			if(res.sw=="성공"){
				cnt = $(btn).next().next();
				$(cnt).text(parseInt($(cnt).text()) + 1);
			}
		},
		error : function(xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function rp_likeD(btn){
	$.ajax({
		url:'/soju/rp_likeD.do',
		type : 'post',
		data : {"rp_num" : rn,
				"user_id" : user_id},
		success : function(res) {
			if(res.sw=="성공"){
				cnt = $(btn).next().next();
				$(cnt).text(parseInt($(cnt).text()) - 1);
			}
		},
		error : function(xhr) {
			alert(xhr.status)
		}
		,dataType : 'json'
	})
}