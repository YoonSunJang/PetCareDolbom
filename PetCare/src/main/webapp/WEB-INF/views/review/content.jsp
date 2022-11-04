<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Pet Care</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>   
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
.carousel {
	margin-top: 1rem;    		
	margin-bottom: 1.4rem;    		   		
}
.carousel-item {
	width: 100%;
	height: 550px;
}
.d-block {
	height: 100%;
	width: 100%;
	object-fit: cover;
}
.imgs{
	width:100%;
}
[style="position: absolute; width: 4px; height: 100%; background-color: rgb(51, 150, 255); left: 50%; margin: 0px 0px 0px -2px;"]{
	background-color: #00bd56 !important;
}
</style>
</head>
<body>
<%@include file="../header.jsp"%>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/images/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="index.html">Home <i
							class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
						href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog
						Single <i class="ion-ios-arrow-forward"> </i>
					</span>
				</p>
				<h1 class="mb-0 bread">돌보미 후기</h1>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 ftco-animate">
				<!-- 
				<p>
				<c:forEach var="imgName" varStatus="status" items="${imgNames}">
					<img src="/review/display?imgName=${imgName.fname}" class="img-fluid">
					<!-- <img src="/images/image_1.jpg" alt="이미지 못 띄움" class="img-fluid">
				</c:forEach>				
				</p>
				 -->
				<!-- ------------------------------------------------------------------------------------------------------------------ -->
					<c:if test="${!empty imgNames}">
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-indicators">
						<c:forEach var="imgName" varStatus="status" items="${imgNames}">
							<c:choose>
							<c:when test="${status.index eq 0}">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="active" aria-current="true" aria-label="Slide ${status.index+1}"></button>
							</c:when>
							<c:otherwise>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" aria-current="true" aria-label="Slide ${status.index+1}"></button>
							</c:otherwise>
							</c:choose>
						</c:forEach>
						</div>
						<div class="carousel-inner rounded">
							<c:forEach var="imgName" varStatus="status" items="${imgNames}">
							<div class="carousel-item 
							<c:if test="${status.index eq 0}">active</c:if>">
								<img src="/market/display?imgName=${imgName.fname}" class="d-block">
							</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
						</button>
					</div>
					</c:if>
					<!-- ------------------------------------------------------------------------------------------------------------------ -->
				<div class="row bg-white shadow p-2 m-1">
					<h3 class="mb-3 border-bottom">${carereview.writer}님의 후기</h3>
					<!-- <h3 class="mb-3">돌보미: ${carereview.dolbomy}</h3> -->
					<h5>${carereview.content}</h5>
					<h2 class="mb-3 mt-5"></h2>
					<div style="text-align: center;">
						<c:if test="${carereview.writerEmail ==sessionScope.email}">
						<input type="button" class="btn btn-light rounded-pill px-4 text-secondary delete" value="삭제">
						<input type="button" class="btn text-black rounded-pill px-4 text-white" style="background-color:#a091f3" value="수정" onclick="location.href='update?cr_seq=${carereview.cr_seq}'">
						</c:if>
						<br><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
$(".delete").click(function(){
    if(confirm("삭제할까요?") == true){
    	location.href='del.do?cr_seq='+"${carereview.cr_seq}";
    }
    else{
        return ;
    }
});
</script>
<!-- .section -->
<%@include file="../footer.jsp"%>
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
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/js/google-map.js"></script>
<script src="/js/main.js"></script>

</body>
</html>