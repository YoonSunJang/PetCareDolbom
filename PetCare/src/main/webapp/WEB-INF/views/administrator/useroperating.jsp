<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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

  </head>
  <body>
<%@include file="../header.jsp" %>
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span>Operation <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">관리</h1>
          </div>
        </div>
      </div>
    </section>
<section class="ftco-section bg-light">
    <div class="container">
    <form method="post" name="input" action="update.do">
		<table>
			<tr>
				<td><input type="hidden" id="m_seq" name="m_seq" value="${member.m_seq}">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${member.gender}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email" name="email" value="${member.email}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" id="pwd" name="pwd" value="${member.pwd}"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" id="nickname" name="nickname" value="${member.nickname}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="phone" name="phone" value="${member.phone}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="addr" name="addr" value="${member.addr}"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td>${member.joindate}</td>
			</tr>
			<tr>
				<td>만족도</td>
				<td><input type="text" id="sat" name="sat" value="${member.sat}"></td>
			</tr>
		</table>
		<div class="updatebtn">
			<button type="submit" class="btn btn-info btn-lg">수정</button>
			<input type="button" class="btn btn-info btn-lg" value="회원탈퇴" onClick="location.href='/admin/delete.do?m_seq=${member.m_seq}'">
			<input type="button" class="btn btn-info btn-lg" value="목록으로" onClick="location.href='/admin/userlist.do'">
		</div>
		</form>
	</div>
</section>
<%@include file="../footer.jsp" %>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/js/jquery.min.js"></script>
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
  
</body>
</html>