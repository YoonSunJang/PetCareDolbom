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
          	<p class="breadcrumbs mb-2"><span>Information <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">공지사항(상세)</h1>
          </div>
        </div>
      </div>
    </section>
<section class="ftco-section bg-light">
    <div class="container">
    <form method="post" name="table input" action="content.do">
		<table>
			<tr>
				<td>신고자 이메일</td>
				<td><a href="/admin/useroperatingemail.do?email=${report.rep_remail}">${report.rep_remail}</a></td>
			</tr>
			<tr>
				<td>작성자 이메일</td>
				<td><a href="/admin/useroperatingemail.do?email=${report.rep_wemail}">${report.rep_wemail}</a></td>
			</tr>
			<tr>
				<td>신고 일자</td>
				<td>${report.rep_date}</td>
			</tr>
			<tr>
				<td>처리 상태</td>
				<td>
				<select id="rep_state" name="rep_state">
				<option value="미처리">미처리</option>
				<option value="처리중">처리중</option>
				<option value="처리완료">처리완료</option>
				</select>
				<input type="hidden" name="rep_seq" id="rep_seq" value="${report.rep_seq}">
				</td>
			</tr>
			<tr>
				<td>처리 일자</td>
				<td>${report.rep_pdate}</td>
			</tr>
			<tr>
				<td>글 번호</td>
				<td><a href="/dolbom/content.do?dol_seq=${report.rep_wseq}">${report.rep_wseq}</a></td>
			</tr>
			<tr>
				<td>신고 사유</td>
				<td>${report.rep_reason}</td>
			</tr>
			<tr>
				<td>신고 내용</td>
				<td>${report.rep_content}</td>
			</tr>
			<tr>
				<td>
					<div class="updatebtn">
						<button type="submit" class="btn btn-info btn-lg">전송</button>
						<input type="button" class="btn btn-info btn-lg" value="삭제" onClick="location.href='/report/delete.do?rep_seq=${report.rep_seq}'">
						<input type="button" class="btn btn-info btn-lg" value="목록으로" onClick="location.href='/report/list.do'">
					</div>
				</td>
			</tr>
		</table>
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
  
  <script>
$(document).ready(function(){
	$("#rep_state").val("${report.rep_state}").prop("selected", true);
});

</script>
  
</body>
</html>