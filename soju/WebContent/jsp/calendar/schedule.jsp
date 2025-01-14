<%@page import="soju.vo.AgencyVO"%>
<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');



body{
   width : 100%;
   height : 100%;
}
.root{
   position: relative;
   height: 100%
}
*, :after, :before{
   box-sizing: border-box;
}
div {
    display: block;
}
a{
   color: inherit;
   text-decoration: none;
}
img {
    vertical-align: middle;
}
button{
   padding: 0px;
   margin: 0px;
   appearance: none;
   background: none;
   border: none;
   cursor: pointer;
}
.header1{
   display: block;
   width: 100%;
   height: 75px;
}
.header11{
   position: fixed;
   display: flex;
   align-items: center;
   width: inherit;
   height: inherit;
   top: 0px;
   left: 0px;
   background-color: white;
   border-bottom: 1px solid lightgray;
   z-index: 1000;
   padding: 0px 32px 0px 26px; 
}
.header111{
   margin-right: auto;
   display: flex;
   align-items: center;
}
.mainlogo{
   margin-left: 16px;
   padding: 6px;
}
.header112{
   margin-left: auto;
   display: flex;
}
.header1122{
   position: relateve;
   margin: 0px 25px;
}


.bell{
   margin: 0px 25px;
}

.dropbtn2 {
  background-color: white;
  color: black;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn2:hover, .dropbtn2:focus {
  background-color: none;
}

.dropdown2 {
  float: right;
  position: relative;
  display: inline-block;
}

.dropdown-content2 {
  display: none;
  position: absolute;
  background-color: white;
  min-width: 120px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  right: 0;
  z-index: 1;
  border-radius: 8px;
}

.dropdown-content2 a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown2 a:hover {background-color: #ddd;}

.show2 {display: block;}

.dropbtn {
  color: black;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  right: 0;
  background-color: white;
  min-width: 120px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  border-radius: 8px;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: none;}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: none;
}
.notice1{
   margin: 0px auto;
   display: flex;
   flex-direction: column;
   width: 896px;
   padding: 0px 48px;
}

.notice2{
   padding: 0px;
   margin: 30px 0px 0px;
   list-style: none;
   min-height: 570px;
   border: 1px solid lightgray;
   border-radius: 8px;
}
.container *{
   /*border : 1px solid pink;*/
}
.container{
   /*border : 1px solid blue;*/
    min-height: 570px;
    border: 1px solid lightgray;
    border-radius: 8px;
   width : 700px;
   height : 700px;
   margin-top: 30px;
   margin-left: 30%;
}
h2{
    font-size: 1.5em;
    font-weight: 800;
    margin-left: 30%;
    margin-top: 50px;
}
.form-horizontal{
   padding-top: 40px;
}
#stitle{
   width: 300px;
}
.form-group input,.form-group textarea{
   margin-left: 150px;
   margin-bottom: 10px;
}
.form-group select{
   margin-left: 150px;
}
.form-group label{
   margin-left: 150px;
   margin-bottom: 20px;
   font-weight: bold;
}
.subbtn{
  padding: 7px 19px;
  border-radius: 2px;
  background-color: #4962B3;
  font-size: 12px;
  border: 1px solid #3e549a;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
  margin-left: 250px;
}
.pw2{
   width: 120px;
}

</style>
<%
   AgencyVO vo = (AgencyVO)session.getAttribute("loginUser");   
   String agcId = vo.getAgc_id();
%>

 <script>
 $(function(){
    
   //확인용
   $('#checkbtn').on('click',function(){
      artistval = $("#artist option:selected").val();
      typeval = $('input:radio[name="type"]:checked').val();
      titleval = $('#title').val();
      contentval = $('#content').val();
      sday = $('#start1').val();
       stime = $('#start2').val();
       startval = sday+" "+stime;
        
       eday = $('#end1').val();
       etime = $('#end2').val();
       endval = eday+" "+etime;
      allday = $('input:checkbox[id="aday"]').is(":checked");
           if(allday==true){
              alldayval = "0";
           }else{
              alldayval = "1";
           }
      console.log(artistval,typeval,titleval,contentval,
                   startval,endval,alldayval); 
   })
   //셀렉트 속에 id연동 아티스트 목록 띄우기
      $.ajax({
         url : '/soju/scheduleArtist.do', 
         data : {"agcId" : "<%=agcId%>"},
         type : 'get',
                success: function(res){
                str="";
                $.each(res, function(i, v){//i: 순서, v: 객체(isp파일의 vo)
               str += "<option value='" + v.art_num+ "'>"+ v.art_name + "</option>"; 
            })
            $('#artist').append(str);    
                },
                error : function(xhr){
                   alert("상태 : "+xhr.status);
                },
                dataType: 'json'
        })
         
     //전송버튼 눌렀을 때
     $('#subbtn').on('click',function(){

         //값 입력받기-아티스트번호,구분,제목,내용,시작일,종료일,종일여부
         //아티스트번호
         artistval = $("#artist option:selected").val();
         
         //구분
         typeval = $('input:radio[name="type"]:checked').val();
         
         //제목
         titleval = $('#title').val();
         
         //내용
         contentval = $('#content').val();
         
         //시작일,종료일
         sday = $('#start1').val();
         stime = $('#start2').val();
         startval = sday+" "+stime;
         
         eday = $('#end1').val();
         etime = $('#end2').val();
         endval = eday+" "+etime;
         
         //종일여부aday
         allday = $('input:checkbox[id="aday"]').is(":checked");
        if(allday==true){
           alldayval = "0";
        }else{
           alldayval = "1";
        }
        //전송하기       
        $.ajax({
             url : '/soju/insertSchedule.do',
             data : {"artist" : artistval,
                   "type" : typeval,
                   "title" : titleval,
                   "content" : contentval,
                   "start" : startval,
                   "end" : endval,
                   "allday" : alldayval
                   },
             type : 'post',
             success: function(res){
                alert(res.sw);
                //window.close();
             },
             error : function(xhr){
                alert("상태 : "+xhr.status);
             },
             dataType: 'json'
     })
     
     
        
     })
     
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
                     
            </div><!-- header11 -->
         </header><!-- header1 -->
         
            <h2 class="stitle">일정 등록</h2>
         <div class="container">
              <form class="form-horizontal" onsubmit="return false">
                
                
                <div class="form-group">
                     <label class="control-label col-sm-2" for="artist">아티스트 선택:</label><br>
                   <select id="artist"></select>
                  <br>
                </div>
                
                <div class="form-group">
                     <label class="control-label col-sm-2" for="type">일정 구분:</label><br>
                   <input type="radio" value="schedule" name="type" checked>일정
                  <input type="radio" value="event" name="type" >이벤트
                  <br>
                </div>
    
                <div class="form-group">
                   <label class="control-label col-sm-2" for="title">제목:</label><br>
                    <input type="text" class="form-control" id="title" placeholder="Enter title" name="cal_title">
                </div>
                
                <div class="form-group ">
                  <label class="control-label col-sm-2" for="content">일정 내용:</label><br>
                    <textarea class="form-control intxt" id="content" rows="10" cols="50" name="cal_cont" placeholder="Enter content"></textarea><br>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-2" for="start">시작일시:</label><br>
                    <input type="date" class="form-control" id="start1" name="cal_start1">
                    <input type="time" class="form-control" id="start2" name="cal_start2">  
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-2" for="end">종료일시:</label><br>
                    <input type="date" class="form-control" id="end1" name="cal_end1">
                    <input type="time" class="form-control" id="end2" name="cal_end2">  
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-2" for="allday">종일여부:</label>
                    <input type="checkbox" class="form-control" id="aday" name="allday" value="allday">종일   
                </div>
                
                <div class="form-group">        
                  <div class="col-sm-offset-2 col-sm-10">
                    <button id="subbtn" type="submit" class="subbtn btn-primary btn-lg">Submit</button>
                  <!--  <button id="checkbtn" type="button" class="subbtn btn-primary btn-lg">Check</button>   --> 
                  </div>
                </div>
              </form>
         </div>                  
         
      </div>
   </div>

</body>
</html>