<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
	<head>
    <title>Pet Care</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">   
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/animate.css">   
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/css/jquery.timepicker.css">
    <link rel="stylesheet" href="/css/flaticon.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery.min.js"></script>
    
    <style>
    
    .admincontainer {
	  width: 100%;
	  padding-right: 15px;
	  padding-left: 15px;
	  margin-right: auto;
	  margin-left: auto; }
	  @media (min-width: 576px) {
	    .admincontainer {
	      max-width: 80%; } }
	  @media (min-width: 768px) {
	    .admincontainer {
	      max-width: 80%; } }
	  @media (min-width: 992px) {
	    .admincontainer {
	      max-width: 80%; } }
	  @media (min-width: 1200px) {
	    .admincontainer {
	      max-width: 80%; } }
    
    .boardview{
    	width:100%;
    }
    .boardview thead{
    	text-align: center;
    	border:1px solid black;
    	font-weight: bold;
	  	vertical-align: top;
	  	border-right: 1px solid #ccc;
	  	border-bottom: 2px solid #ccc;
	  	border-top: 1px solid #fff;
	  	border-left: 1px solid #fff;
	  	background: #EEF2F3;
    }
    #addition{
    	float:right;
    }
    table.boardview td {
	  	padding: 5px;
	 	vertical-align: top;
	  	border-right: 1px solid #ccc;
	  	border-left: 1px solid #ccc;
	  	border-bottom: 1px solid #ccc;
	  	text-align: center;
	  	white-space: nowrap;
	}
	.admin-main-board{
	  	border-radius: 16px;
	  	box-shadow: inset 0 0 8px #D6E6F5;
		padding: 2em 2em; 
		margin: 2em 0; 
		font-weight: bold; 
		color: #000000; 
		background: #FFF; 
		border: solid 3px #D6E6F5;
	}
	.opcategory{
		display:flex;
		justify-content: space-between;
		align-items:flex-end;
	}
	.deletebtn{
		display:flex;
		flex-direction:row-reverse;
	}
	.admincontainer{
		margin-bottom : 2.5rem;
	}
    </style>
  </head>
  <body>
<%@include file="../header.jsp" %>

    
    <section class="ftco-section bg-light">
    <div class="container">
    <div class="notation">
    	<h3>신고/문의 현황판</h3>
    	<div class="admin-main-board">
    	돌보미0 돌봄 후기0 나눔 마켓2 <br>자유게시판3 공지사항1 신고3
    	</div>
    </div>
    <div class="admincontainer">
    <div class="opcategory">
    	<h3>공지사항</h3><a href="../info/list.do" id="addition">더보기</a>
    </div>
    	<table class="boardview">
    	<thead>
    	<tr>
    	<th>글 번호</th>
    	<th>작성자</th>
    	<th>글 제목</th>
    	<th>작성일자</th>
    	<th><input type="checkbox" onClick="allClick(this)" id="checkall" name="info" value="info"></th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${listinfo}" var="info" begin="0" end="2">
    	<tr>
    	<td>${info.n_seq}</td>
    	<td>${info.admin}</td>
    	<td><a href="info/list.do?n_seq=${info.n_seq}">${info.title}</a></td>
    	<td>${info.wdate}</td>
    	<td><input type="checkbox" name="infocheckseq" value="${info.n_seq}"></td>
    	</tr>
    	</c:forEach>
    	<c:if test="${fn:length(listinfo) < 3}">
    	<c:forEach begin="0" end="${2-fn:length(listinfo)}">
    	<tr>
    	<td colspan="8">내역이 존재하지 않습니다</td>
    	</tr>
    	</c:forEach>
    	</c:if>
    	</tbody>
    	</table>
    	<div class="deletebtn">
    	<button type="button" id="deletechecked" onClick="deletechecked()">일괄 삭제</button>
    	</div>
    </div>
    <div class="admincontainer">
    <div class="opcategory">
    	<h3>유저관리</h3>
    	<a href="../admin/userlist.do" id="addition">더보기</a>
    </div>
    	<table class="boardview">
    	<thead>
    	<tr>
    	<th>식별번호</th>
    	<th>이름</th>
    	<th>이메일</th>
    	<th>닉네임</th>
    	<th>가입일</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${listmember}" var="member" begin="0" end="2">
    	<tr>
    	<td>${member.m_seq}</td>
    	<td>${member.name}</td>
    	<td><a href="useroperating.do?m_seq=${member.m_seq}">${member.email}</a></td>
    	<td>${member.nickname}</td>
    	<td>${member.joindate}</td>
    	</tr>
    	</c:forEach>
    	<c:if test="${fn:length(listmember) < 3}">
    	<c:forEach begin="0" end="${2-fn:length(listmember)}">
    	<tr>
    	<td colspan="8">내역이 존재하지 않습니다</td>
    	</tr>
    	</c:forEach>
    	</c:if>
    	</tbody>
    	</table>
    	<div class="deletebtn">
    	</div>
    </div>
    <div class="admincontainer">
    <div class="opcategory">
    	<h3>신고</h3>
    	<a href="../report/list.do" id="addition">더보기</a>
    </div>
    	<table class="boardview">
    	<thead>
    	<tr>
    	<th>글 번호</th>
    	<th>신고자</th>
    	<th>작성자</th>
    	<th>신고 사유</th>
    	<th>글 링크</th>
    	<th>처리 상태</th>
    	<th>신고 일자</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${listreport}" var="report" begin="0" end="2">
    	<tr>
    	<td>${report.rep_seq}</td>
    	<td><a href="/admin/useroperatingemail.do?email=${report.rep_remail}">${report.rep_remail}</a></td>
    	<td><a href="/admin/useroperatingemail.do?email=${report.rep_wemail}">${report.rep_wemail}</a></td>
    	<td><a href="/report/content.do?rep_seq=${report.rep_seq}">${report.rep_reason}</a></td>
    	<td><a href="/dolbom/content.do?dol_seq=${report.rep_wseq}">${report.rep_wseq}</a></td>
    	<td>${report.rep_state}</td>
    	<td>${report.rep_date}</td>
    	</tr>
    	</c:forEach>
    	<c:if test="${fn:length(listreport) < 3}">
    	<c:forEach begin="0" end="${2-fn:length(listreport)}">
    	<tr>
    	<td colspan="8">내역이 존재하지 않습니다</td>
    	</tr>
    	</c:forEach>
    	</c:if>
    	</tbody>
    	</table>
    	<div class="deletebtn">
    	</div>
    </div>
    </div>
    </section>



  
  
  <%@include file="../footer.jsp" %>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  
  <script src="/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/js/popper.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/jquery.easing.1.3.js"></script>
  <script src="/js/jquery.waypoints.min.js"></script>
  <script src="/js/jquery.stellar.min.js"></script>
  <script src="/js/jquery.animateNumber.min.js"></script>
  <script src="/js/bootstrap-datepicker.js"></script>
  <script src="/js/jquery.timepicker.min.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/jquery.magnific-popup.min.js"></script>
  <script src="/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/js/google-map.js"></script>
  <script src="/js/main.js"></script>
  <script>
 	var del_list = new Array();
 	var checkval = $("input[name=checkseq]");
	var size;
	function allClick(category){
		var checkall = $("#checkall");
		checkval = $("input[name="+category.value+"checkseq]");
		size = checkval.length;
		if(checkall.attr('name') == category.value+'-checked'){
			$(checkval).prop("checked", false);
			checkall.attr("name",category.value);
			del_list = new Array();
		}else{
			del_list = new Array();
			$(checkval).prop("checked", true);
			checkall.attr("name",""+category.value+"-checked");
			for(i=0;i<size;i++){
				var checkvalue = checkval.eq(i).attr("value");
				del_list.push(checkvalue);
			}
		}
	}
	checkval.change(function(){
		size = checkval.length;
		del_list = new Array();
		for(i=0;i<size;i++){
			if(checkval[i].checked==true){
				var checkvalue = checkval.eq(i).attr("value");
				del_list.push(checkvalue);
			}
		}
		console.log(del_list);
	});
	function deletechecked(){
		var v = {"del_list":del_list};
		
		$.get("/info/checkdelete.do", v, function(data){
			location.href="/info/list.do";
		});
	};
  </script>
    
  </body>
</html>