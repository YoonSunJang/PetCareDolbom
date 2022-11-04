<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/jquery.timepicker.css">
<link rel="stylesheet" href="/css/flaticon.css">
<link rel="stylesheet" href="/css/style.css">
<!-- 부트스트랩 아이콘 스타일시트 추가-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light " id="ftco-navbar">
    <div class="container">
	    <div class="logo">
	    	<a href="/" class="imgLogoHref"><img src="/images/logo.png" class="imgLogo" style="width:200px;"></a>
	    	<!-- <a href="/" class="imgLogoHref"><img src="/images/logo2.png" class="imgLogo" style="width:200px;"></a> -->
	    </div>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="bi bi-list"></span>
      </button>
      <div class="button">
   		<c:choose>
   			<c:when test="${sessionScope.member.email != null || sessionScope.sessionId.nickname != null}">
   				<span onClick="openChat();" class="fa fa-comments-o" ><i class="sr-only">chat</i></span>
   				<span class="bi bi-box-arrow-right" type="submit" id="logout-Btn" onclick="location.href = '/member/logout.do'" ></span>
   				<span class="bi bi-person-fill" id="mypage-Btn" type="submit" onclick="location.href = '/member/mypage.do?m_seq=${sessionScope.member.m_seq}'"></span>
   			</c:when>
   			<c:otherwise>
   				<span class="bi bi-box-arrow-in-right mr-1" type="submit" id="login-Btn" onclick="location.href = '/member/login.do'"></span>
   				<span class="bi bi-person-plus-fill" type="submit" id="signup-Btn" onclick="location.href = '/member/goSignupM.do'"></span>
   			</c:otherwise>
   		</c:choose>
	  </div>
	<div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
        	<li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">우리동네돌보미</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="/dolbom" id="dolbom">돌보미 찾기</a>
			      <a class="dropdown-item" href="/dolbom/form" id="dolbom">돌보미 신청</a>
			      <a class="dropdown-item" href="/dolbom/list.do" id="dolbom">돌보미 리스트</a>
			    </div>
			</li>
        	<li class="nav-item"><a href="/review/list.do" class="nav-link" id="review">돌보미 후기</a></li>
        	<li class="nav-item"><a class="nav-link" id="market" style="cursor: pointer;">나눔마켓</a></li>
          	<li class="nav-item"><a href="/freeboard/galleryList" class="nav-link" id="freeboard">갤러리</a></li>
			<li class="nav-item"><a href="/info/list.do" class="nav-link" id="info">공지사항</a></li>
          	<li class="nav-item"><a href="/admin/main.do" class="nav-link" id="admin">관리자</a></li>    	
        </ul>
      </div>
    </div>
  </nav>
  <!-- END nav -->
  <script type="text/javascript">
  		const sessionAttrs = ["key", "word", "pageNum"];
        $(function () {
        	var url = $(location).attr("href").split('/')[3];
        	console.log("url"+url);
        	if(url=='dolbom'){
        		$('#'+url).parent().parent().toggleClass('active');
        	}else{
        		$('#'+url).parent().toggleClass('active');
        	}
           	$("#market").on("click", function(){
           		if($(location).attr("href").includes("market")) removeSession();
       			location.href="/market";
           	})
            if(!$(location).attr("href").includes("market")){
            	removeSession();
            }
        });     
        function removeSession(){
        	$.ajax({
    			url : "/market/removeSession.json",
    			type : "DELETE",
    			data : {
    				sessionAttrs : sessionAttrs
    			},
    			success : function(data){
    			}
    		});
        }
        function openChat(){
        	window.open("/room", '우리동네 돌보미 채팅', 'width=450px,height=475px,scrollbars=yes,location=no');
        }
  </script>
  