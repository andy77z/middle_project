<%@page import="soju.vo.ManagerVO"%>
<%@page import="soju.vo.AgencyVO"%>
<%@page import="soju.vo.ArtistVO"%>
<%@page import="soju.vo.MemberVO"%>
<%@page import="soju.vo.ReplyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>So? Would You?</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script src="<%= request.getContextPath() %>/js/feed/feed.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/feed/feed.css">

<%

	int type = (Integer)session.getAttribute("type");
	int artnum = (Integer)session.getAttribute("art_num");
	
	
	
	String userId = "";
	String userName = "";
	String userNick = "";
	String userEmail = "";
	String userPhoto = "";
	
	switch(type){
	case 1:
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		userId = mvo.getMem_id();
		userName = mvo.getMem_name();
		userNick = mvo.getMem_nick();
		userEmail = mvo.getMem_mail();
		userPhoto = mvo.getMem_photo();
		break;
	case 2:
		ArtistVO avo = (ArtistVO)session.getAttribute("loginUser");
		userId = avo.getArt_id();
		userName = avo.getArt_name();
		userNick = avo.getArt_name();
		userEmail = avo.getArt_mail();
		userPhoto = avo.getArt_photo();
		break;
	case 3:
		AgencyVO gvo = (AgencyVO)session.getAttribute("loginUser");
		userId = gvo.getAgc_id();
		userName = gvo.getAgc_name();
		userNick = gvo.getAgc_name();
		userEmail = gvo.getAgc_mail();
		userPhoto = gvo.getAgc_photo();
		break;
	case 4:
		ManagerVO nvo = (ManagerVO)session.getAttribute("loginUser");
		userId = nvo.getMng_id();
		userName = nvo.getMng_name();
		userNick = nvo.getMng_name();
		userEmail = "관리자";
		userPhoto = "메인로고.png";
		break;
	}
	
	
%>

<script>
function proc1(t){
	//event.preventDefault();
	
	
	if($('.amenu a').hasClass('fcolor')){
		
		$('.amenu a').removeClass('fcolor');
	}
	$(t).addClass('fcolor');
	
	name = $(t).attr('name');
	if(name=="feed"){
		location.href = '<%= request.getContextPath() %>/jsp/feed/feed0.jsp?art_num=<%= artnum %>&cate_name=' + name;
	}else if(name=="artist"){
		location.href = '<%= request.getContextPath() %>/jsp/artist/artist.jsp?art_num=<%= artnum %>&cate_name=' + name;
	}else if(name=="media"){
		location.href = '<%= request.getContextPath() %>/jsp/media/mediaMain.jsp?art_num=<%= artnum %>&cate_name=' + name;
	}else if(name=="chatting"){
		<% if(type==1){
			%>
			location.href = '<%= request.getContextPath() %>/jsp/ticket/buyTicket.jsp';
			<%
		}else{
			%>
			location.href = '<%= request.getContextPath() %>/jsp/chatting/webSocketGroupMutiChatting.jsp';
			<%
		} %>
	}else if(name=="calendar"){
		location.href = '<%= request.getContextPath() %>/jsp/calendar/calenderIndex.jsp?art_num=<%= artnum %>'
	}
}
</script>

<script>
 art_num = <%= artnum %>;
 user_profile = "<%= userPhoto %>";
 user_id = "<%= userId %>";
 cate_name = "feed";
 cate_num = 0;
 reply = {} 
 mreply= {}
  	$(function () {
  		
  		getArtist();
  		
  		//글을 입력해야지만 버튼 활성화 되는 코드
		$('.content').on('keyup', function () {
				con = $('.content').html().trim();
				if(con.length<1){
  					$('.complete').prop('disabled', true)
  					
				}else{
				$('.complete').prop('disabled', false)
// 				$('.complete').css("cursor", "pointer")
				}
		})
	
		//완료버튼을 누르면 form태그를 배열로 만들어주는 코드
		$('.postbtn').on('click', function () {
// 			fdata = $('.fbox form').serializeArray();
			$('#form').submit();
// 			feedUpload();
// 			fileUpload(); 파일 업로드...
		})
		
  		$('.start').on('click', '.sbut', function () {
			idx = $(this).attr('idx');
			name = $(this).attr('name');
			
			if(name=="dele"){//게시글 삭제
				if(confirm("정말 삭제하시겠습니까?") == true){
					deleteContent();
				}	
			}else if(name == "modi"){//게시글 수정
				//모달창에 수정할 내용을 가져오기
				post = $(this).parents('.post');
				cont = $(post).find('#cont1').html();
				content = cont.replace(/<br>/g, "\n").replace(/""/g, "\r");
				
				//모달창에 수정할 내용 출력하기
				$("#modifymodal").find(".marea").val(content);
 				
			}else if(name == "replyupload"){//댓글달기 
				//alert(idx +"번 댓글달기")
				text = $(this).prev().val(); //댓글 내용
				//console.log(text);
				
				//작성자 닉네임은 나중에 하기
				// 댓글DB에 값 넣기
				reply.bd_num = idx;
				reply.rp_cont = text;
				reply.rp_id = "<%= userId %>";
				reply.rp_nick = "<%= userNick %>";
				reply.rp_profile = "<%= userPhoto %>";
				
				insertReply(this); //댓글 게시 파라미터로 게시버튼 받음
			}else if(name == "list"){
				replyList();
			}else if(name == "rdele"){
				if(confirm("정말 삭제하시겠습니까?") == true){
					deleteReply(this);
				}
			}
/* 			else if(name == "rmodi"){
				//모달창에 수정할 내용을 가져오기
				reply = $(this).parents('#rep');
				cont = $(reply).find('span.rcon').html();
				oldtext = cont.replace(/<br>/g, "\n").replace(/""/g, "\r");
				
				//기존 댓글 내용 지우기
				$(this).parents('#rep').find('.rcon').empty();
				
				//댓글 수정폼 보이기 
				$('#rmodifymodal').show();
				
 				//모달창에 수정할 내용 출력하기
				$("#rmodifymodal").find(".mrarea").val(oldtext);
			} */
			
		})
		
 		// 글 수정 폼에서 수정 후 확인버튼 클릭
		$('.mbut').on('click', function () {
			//입력된 내용 가져오기 
			modicon = $('.marea').val();
			//서버로 전송 ajax
			modifyContent();
		})
		
/*		
		// 댓글수정 창에서 취소버튼
		$('.close').on('click', function () {
			//원래 댓글이 있던 자리에 기존 글 올리기
			$('.'+ idx).html(oldtext);
		})
		
		//댓글 수정창에서 확인버튼 클릭
		$('.mrbut').on('click', function () {
			rnum = $('.rmodify').attr('idx');
			//textarea에서 수정한 내용을 가져오기 -\r\n -> <br>
			oldtext = $('#rmodifymodal textarea').val();
			newtext = oldtext.replace(/\r/g, "").replace(/\n/g, "<br>");
			
			$('.'+ idx).html(newtext);
			
			//수정폼 닫기
			$('#rmodifymodal').modal('hide');
		
			//db수정을 위해 ajax처리하기 - oldtext, rp_num=idx
			mreply.rp_cont = newtext;
			mreply.rp_num = rnum;
			
			modifyReply(); 
			

		})*/
		
		//좋아요
		$(document).on("click", ".reactLikeCheck", function(){
		      b = $(this).prop('checked');
		      ltype = $(this).attr('name');
		      
		      if(b==true){
		    	  $(this).next().attr('class','likeBtn');
					 if(ltype=="bdlike"){
						 bn = $(this).parents('.post').attr('idx');
			        	 bd_likeD(this)
			         }else if(ltype=="rplike"){
			        	 rn = $(this).parents('#rb').find('.rcon').attr('idx');
			        	 rp_likeD(this)
			         }
		      }else{
				 $(this).next().attr('class','likeBtn on');
		         if(ltype=="bdlike"){
		        	 bn = $(this).parents('.post').attr('idx');
		        	 bd_like(this)
		         }else if(ltype=="rplike"){
		        	 rn = $(this).parents('#rb').find('.rcon').attr('idx');
		        	 rp_like(this)
		         }
		      }
		      
		   });
  		
  		
  		// 게시글 클릭하면 모달 나오게 
  		$(document).on("click", "#cont1", function(){
  			idx = $(this).attr("idx");
  			
// 			$('#largemodal').modal('show');
			
// 			w=$('#writer').text();
// 			$('.dtwr').text(w);
			
// 	        d = $('.date').first().text();
// 	        $('.dtdate').text(d);
			
// 	        c= $(this).html();
// 	        $('.dtcon').html(c);
	        
// 	        p = $(this).parents('.post').find('.myprofile img').attr('src');
// 	        console.log(p)
// 	        $('.modalprofile img').attr('src', p);
	        


// //   			detailFeed()
		  });

	})
 </script>
</head>
<body>
<div id="root">
	<div class="root1">
	
		<header class="header1">
			<div class="header11">
				<div class="header111">
					<a href="<%= request.getContextPath() %>/jsp/main/loginMain.jsp" class="mainlogo">
						<img src="<%= request.getContextPath() %>/images/logosample.png" alt="So? Would You?">
					</a>
				</div>
<%
	switch(type){
	case 1:
%>
						<!-- 팬 회원 -->
						<a href="<%= request.getContextPath() %>/jsp/main/mypage.jsp">
							<img class="my1" src="<%= request.getContextPath() %>/images/user.png" alt="my1" width="24" >
						</a>
						
						<div class="dropdown2">
							<button onclick="myFunction2()" class="dropbtn2">
								<img class="bell" src="<%= request.getContextPath() %>/images/bell.png" alt="bell" width="24" >
							</button>
							<div id="myDropdown2" class="dropdown-content2">
								<h5 style="text-align: center;">긴급점검중...</h5>
							</div>
						</div>
						
						
						<div class="dropdown">
	  						<button class="dropbtn">
	  							<img class="more" src="<%= request.getContextPath() %>/images/down-arrow.png" alt="more" width="24" >
	  						</button>
	  						<div class="dropdown-content">
								  <a href="<%= request.getContextPath() %>/jsp/main/alarm.jsp">알림설정</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/notice.jsp">공지사항</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/qna.jsp">문의</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/tiket.jsp">이용권관리</a>
						  	</div>
						</div>
						<!-- 아티스트 -->
<%
		break;
	case 2:
%>						
						<a href="<%= request.getContextPath() %>/jsp/main/mypage.jsp">
							<img class="my1" src="<%= request.getContextPath() %>/images/user.png" alt="my1" width="24" >
						</a>
						
						<div class="dropdown2">
							<button onclick="myFunction2()" class="dropbtn2">
								<img class="bell" src="<%= request.getContextPath() %>/images/bell.png" alt="bell" width="24" >
							</button>
							<div id="myDropdown2" class="dropdown-content2">
								<h5 style="text-align: center;">긴급점검중...</h5>
							</div>
						</div>
						
						<div class="dropdown">
	  						<button class="dropbtn">
	  							<img class="more" src="<%= request.getContextPath() %>/images/down-arrow.png" alt="more" width="24" >
	  						</button>
	  						<div class="dropdown-content">
								  <a href="<%= request.getContextPath() %>/jsp/main/notice.jsp">공지사항</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/qna.jsp">문의</a>
						  	</div>
						</div>
						<!-- 소속사 -->
<%
		break;
	case 3:
%>						
						<a href="<%= request.getContextPath() %>/jsp/main/mypage.jsp">
							<img class="my1" src="<%= request.getContextPath() %>/images/user.png" alt="my1" width="24" >
						</a>

						<div class="dropdown2">
							<button onclick="myFunction2()" class="dropbtn2">
								<img class="bell" src="<%= request.getContextPath() %>/images/bell.png" alt="bell" width="24" >
							</button>
							<div id="myDropdown2" class="dropdown-content2">
								<h5 style="text-align: center;">긴급점검중...</h5>
							</div>
						</div>
						
						<div class="dropdown">
	  						<button class="dropbtn">
	  							<img class="more" src="<%= request.getContextPath() %>/images/down-arrow.png" alt="more" width="24" >
	  						</button>
	  						<div class="dropdown-content">
								  <a href="<%= request.getContextPath() %>/jsp/calendar/schedule.jsp" target="_self">일정관리</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/notice.jsp">공지사항</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/qna.jsp">문의</a>
						  	</div>
						</div>
<%
		break;
	case 4:
%>
						<!-- 관리자 -->
						<div class="dropdown2">
							<button class="logout">
								<a href="<%=request.getContextPath() %>/Logout.do" target="_top">로그아웃</a>
							</button>
						</div>
						
						<div class="dropdown2">
							<button onclick="myFunction2()" class="dropbtn2">
								<img class="bell" src="<%= request.getContextPath() %>/images/bell.png" alt="bell" width="24" >
							</button>
							<div id="myDropdown2" class="dropdown-content2">
								<h5 style="text-align: center;">긴급점검중...</h5>
							</div>
						</div>
						
						<div class="dropdown">
	  						<button class="dropbtn">
	  							<img class="more" src="<%= request.getContextPath() %>/images/down-arrow.png" alt="more" width="24" >
	  						</button>
	  						<div class="dropdown-content">
								  <a href="<%= request.getContextPath() %>/jsp/main/adminMember.jsp" target="_self">회원관리</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/adminTiket.jsp" target="_self">결제관리</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/adminQna.jsp" target="_self">고객지원</a>
						  	</div>
						</div>
<%
		break;
	}
%>		
			</div><!-- header11 -->
		</header><!-- header1 -->
		
		<section class="big">
			<aside class="left">
				<div class="atitle">
		  			<a href="">
		    			<div class="aname"><p></p></div>
		    		</a>
		    		<div class="wever"></div>
		    		<div class="aprofile"><img src="" alt="banner"></div>
		  		
			  		<div class="artistmenu">
			    		<nav class="amenu">
			      			<a aria-current="page" name="feed" class="active" onclick="proc1(this)">Feed</a>
			    		</nav>
			    		<nav class="amenu">
			      			<a name="artist" onclick="proc1(this)">Artist</a>
			   			</nav>
			    		<nav class="amenu">
			      			<a name="media" onclick="proc1(this)">Media</a>
			    		</nav>
			    		<nav class="amenu">
			      			<a name="chatting" onclick="proc1(this)">Chatting</a>
			    		</nav>
			    		<nav class="amenu">
			      			<a name="calendar" onclick="proc1(this)">Calendar</a>
			    		</nav>
			  		</div>
			  	</div>
			</aside>
			<section class="center">
				<section class="content">
					<div style="position: relative;">
						<div style="overflow: visible; width: 0px;">
							<div class="one">
								<div class="two">
									<div class="three">
										<article class="arti">
											<div class="fpost">
												<div class="fbox">
													<h4>포스트 쓰기</h4><br>
													<div class="myprofile">
														<img src="<%=request.getContextPath() %>/profile.do?fileName=<%= userPhoto %>">
													</div>
													<form enctype="multipart/form-data" id="form" method="post" action="<%= request.getContextPath() %>/FileUpload.do">
													<div style="display: inline-block">
													<textarea name="bd_cont" class="content pwrite" placeholder="여기에 글자를 입력해주세요."></textarea><br>
													<input name="bd_id" value="<%= userId %>" type="hidden">
													<input name="bd_nick" value="<%= userNick %>" type="hidden">
													<input type="hidden" value="<%= userPhoto %>" name="bd_profile">
													<input type="hidden" value="" name="cate_num">
													<input type="hidden" value="feed" name="bd_title">
													</div>
													<br>
														<div style="float: right;">
															<label for="fup" style="cursor: pointer;"><img class="fimg" src="<%= request.getContextPath() %>/images/upload.png"></label>
															<input id="fup" name="inf" type="file" accept="image/*" multiple style="display: none;">
														</div><br><hr>
														<div>
															<button type="button" class="complete postbtn" disabled>완료</button>
														</div>
													</form>
												</div>
											</div>
											
											<div class="start">
												
											</div>
																						
										</article>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</section>
			<footer class="footer">
				<div class="sc-pYNsO cNiiyt">
					<div class="ftitle">
						<table class="fan">
							<tr>
								<td rowspan="2" class="fprofile">
									<div>
										<img src="<%=request.getContextPath() %>/profile.do?fileName=<%= userPhoto %>" alt="profile">
									</div>
								</td>
			          			<td class="rtd">
			            			<div class="nickname">
			              				<p class="fn"><%= userNick %></p>
			            			</div>
			            			
			            			<div class="userId">
			              				<p class="fn">(<%= userId %>)</p>
			           	 			</div>
			          			</td>
			        		</tr>
			      		</table>
					</div>
				</div>
			</footer>
		</section>	
		
	</div>
</div>
<!-- 피드 수정 Modal -->
  <div class="modal" id="modifymodal">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">포스트 수정</h4>
        </div>
        <div class="modal-body"><br>
	        <div class="profile">
				<img src="">
			</div>
			<div style="display: inline-block;">
          		<textarea class="content marea"></textarea>
          		<input type="button" value="확인" class="complete mbut">
        	</div>	
        </div>
        <div class="modal-footer">
          	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>



</body>
</html>