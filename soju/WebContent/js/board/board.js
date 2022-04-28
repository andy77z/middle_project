/**
 * 
 */

function bd_like(bn){
	$.ajax({
		url:'/soju/bd_like.do',
		type : 'post',
		data : {"bd_num" : bn,
				"user_id" : user_id},
		success : function(res) {
			if(res.sw=="성공"){
				cnt = $(bn).next().next();
				$(cnt).text($(cnt).text() + 1);
			}
		},
		error : function(xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function bd_likeD(bn){
	$.ajax({
		url:'/soju/bd_likeD.do',
		type : 'post',
		data : {"bd_num" : bn,
				"user_id" : user_id},
		success : function(res) {
			if(res.sw=="성공"){
				cnt = $(bn).next().next();
				$(cnt).text($(cnt).text() - 1);
			}
		},
		error : function(xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function rp_like(rn){
	$.ajax({
		url:'/soju/rp_like.do',
		type : 'post',
		data : {"rp_num" : rn,
				"user_id" : user_id},
		success : function(res) {
			if(res.sw=="성공"){
				cnt = $(rn).next().next();
				$(cnt).text($(cnt).text() + 1);
			}
		},
		error : function(xhr) {
			alert(xhr.status)
		},
		dataType : 'json'
	})
}

function rp_likeD(rn){
	$.ajax({
		url:'/soju/rp_likeD.do',
		type : 'post',
		data : {"rp_num" : rn,
				"user_id" : user_id},
		success : function(res) {
			if(res.sw=="성공"){
				cnt = $(rn).next().next();
				$(cnt).text($(cnt).text() - 1);
			}
		},
		error : function(xhr) {
			alert(xhr.status)
		}
		,dataType : 'json'
	})
}