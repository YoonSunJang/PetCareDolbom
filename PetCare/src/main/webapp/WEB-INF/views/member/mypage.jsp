<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
    <title>My Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
    <link rel="stylesheet" href="/css/animate.css">    
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/flaticon.css">
    <link rel="stylesheet" href="/css/style.css">
    
    <script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js">
    </script>
    <script>
    $(function(){
		var email = "${sessionScope.member.email}";
		console.log("email: "+email);
		$.ajax({
			url: "../member/checkPet.do",
			type: "GET",
			data: {email: email},
			dataType: "json",
			success: function(data){
				print(data);
			}
		});			
		$('#deleteM').click(function(){
			$.ajax({
				url: "deleteM.do?m_seq=${sessionScope.member.m_seq}",
				type: "GET",
				success: function(){
					alert('goodbye ㅜㅜ');
					location.href='/';
				}
			});
		});
		
		var info = "${memberone}";
		$('#myinfo-Btn').click(function(){
			$.ajax({
				url: "myinfo.do",
				type: "post", 
				data: {info: info},
				success: function(data){
					alert('넘어감');
				}
			});
		});
		var imgsrc = $('#profile-image').attr('src');
		console.log('imgsrc: '+imgsrc.length);
		if(imgsrc.length == 24){
			$('#profile-image').attr('src', '/images/profile160.png');
		}
	});
    function print(results){
		var html;
		if(results.lists.length == 0){
			html += "<h5>등록된 펫이 없습니다</h5>";
			$("#container").html(html);
		}else{
			var today = new Date();    			
			html = '<div class="item"><div class="testimony-wrap py-4">';
			$.each(results.lists, function(idx, list){
				html += '<div class="text"><div class="d-flex align-items-center"><div class="user-img"'
				html += 'style="background-image: url(https://source.unsplash.com/user/erondu/400x300)"></div>'
				html += '<div class="pl-3"><p class="name">'+list.pet.name+'</p>'
				var age = today.getFullYear() - list.pet.byear;
				html += '<span class="position">'+age+' | </span>'
				html += '<span class="position">'+list.pet.big+' | </span>'
				html += '<span class="position">'+list.pet.sex+'</span>'
				html += '<button type="submit" id="updatePET-Btn" onclick="'+"location.href = '/member/updatePinfo.do?petseq="+list.pet.petseq+"'"+'">수정하기</button>';
				html += '<button type="submit" id="'+list.pet.petseq+'" class="deleteP")>삭제하기</button>';
				html += '</div></div><p class="mb-4">'+list.pet.memo+'</p></div>'
			});
			html += '</div></div>';
			$("#container").html(html);
			$('.deleteP').on("click", function(){
    			var petseq = $(this).attr('id');
    			console.log("#seq: "+petseq);
    			$.ajax({
    				url: "deleteP.do?petseq="+petseq,
    				type: "GET",
    				success: function(){
    					alert("정보가 삭제 되었습니다");
    					document.location.reload();
    				}
    			});
    		});
		}			
	}    	
    </script>   
    <style>
    section.hero-wrap.hero-wrap-2 {
		margin-top: 100px;
		z-index: 1;
	}
	
	#timesDiv {
		width: 60%;
		margin: 0px auto;
	}
	
	.card {
		width: 5rem;
	}
	
	#profile-image {
		width: 150px;
		height: 150px;
	}
	
	#name h4 {
		margin-right: 10px;
	}
	
	.table .bg-white {
		padding: 10px;
	}
	
	.myPageDiv {
		margin-bottom: 80px;
	}
	.bi .bi-gear-fill {
		padding-left:2px;
		font-size:15px;
		font-color:dbdbdb;
	}
	.custom-table {
  	min-width: 900px; 
  	}
    </style> 
  </head>
  <body>
	<%@include file="../header.jsp" %>
  <!-- 회원정보수정 -->
  <div class="hero-wrap">
	<div class="container" style="height:700px">
		<div class="overlay"></div>
			<div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true" style="height:800px">
				<div class="col-md-12 ftco-animate text-center">
					<div class="d-flex flex-column">
					<img src="/member/display?imgName=${profile[0].fname}" class="rounded-circle mx-auto d-block" id="profile-image" alt="">
						<div class="p-2">
							<div class="d-flex justify-content-center" id="greetDiv">
								<span class="name text-white"><h4>${memberone.nickname}님,반가워요!</h4></span>
								<span class="bi bi-gear-fill" id="myinfo-Btn" onclick="location.href = '/member/myinfo.do?m_seq=${sessionScope.member.m_seq}'"></span>
							</div>
							<span><i class="fa fa-map-marker" aria-hidden="true"></i>금천구 가산동</span> 
							<span><i class="fa fa-star" aria-hidden="true"></i>${memberone.sat}</span>
						</div>
						<div class="p-2 text-white rounded border border-white shadow" id="timesDiv">
							<div class="fa fa-hashtag" aria-hidden="true" id="diveDiv">GIVE	| 돌봄제공 : 2회</div>
							<div class="fa fa-hashtag" aria-hidden="true" id="takeDiv">Take | 돌봄요청 : 2회</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  <!-- -->
  <section class="ftco-section bg-light">
		<div class="container">
			<!--반려동물정보/carousel사용-->
			<div class="myPageDiv">
				<div class="d-flex justify-content-between mb-3 border-bottom">
					<span><h4>반려동물정보</h4></span>
				</div>
				<div class="pet-carousel">
					<div class="row ftco-animate">
						<div class="col-md-12">
							<div class="carousel-testimony owl-carousel ftco-owl">
								<div class="item">
									<div class="testimony-wrap py-4">
										<div class="d-flex align-items-center">
											<div class="user-img" style="background-image: url(/images/brandy.jpeg)"></div>
											<div class="pl-3">
												<span class="name">브랜디</span>
												<a class="bi bi-gear-fill" onclick="location.href = '/member/goSignupP.do'"></a>
												<div>
													<span class="position">3살&nbsp;|&nbsp;</span>
													<span class="position">중형&nbsp;|&nbsp;</span> 
													<span class="position">수컷</span>
													<span class="bi bi-gender-female"></span>
												</div>
											</div>
										</div>
										<p>(memo) 견과류알러지 있음</p>
									</div>
								</div>
								<div class="item">
									<div class="testimony-wrap py-4">
										<div class="d-flex align-items-center">
											<div class="user-img" style="background-image: url(/images/pepper.jpeg)"></div>
											<div class="pl-3">
												<span class="name">페퍼</span>
												<a class="bi bi-gear-fill" onclick="location.href = '/member/goSignupP.do'"></a>
												<div>
													<span class="position">1살&nbsp;|&nbsp;</span>
													<span class="position">중형&nbsp;|&nbsp;</span> 
													<span class="position">수컷</span>
													<span class="bi bi-gender-male"></span>
												</div>
											</div> 
										</div>
										<p>(memo) 아무거나 잘먹음</p>
									</div>
								</div>
								<div class="item">
									<div class="testimony-wrap py-4">
										<div class="d-flex justify-content-center px-3" style="border-style: dotted;">
											<a class="bi bi-plus-circle-fill" aria-hidden="true" style="font-size:50px;" onclick="location.href = '/member/goSignupP.do'"></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

      <!--돌봄 리스트-->
			<div class="myPageDiv">
				<div class="d-flex justify-content-between mb-3 border-bottom">
					<div><h4>돌봄리스트</h4></div>
					<span class="align-bottom"> 
						<a href=""><i class="fa fa-plus-square-o" aria-hidden="true"></i> 더보기</a>
					</span>
				</div>
				<div
					class="d-flex justify-content-between border border-primary mb-3 rounded rounded-3 text-primary shadow-sm"
					id="dolbomBox">
					<div class="p-2">aa님, {22/10/07 09:00~18:00 }</div>
					<div class="p-2 text-center">
						<b>도움제공 </b><i class="fa fa-angle-right" aria-hidden="true"></i>
					</div>
				</div>
				<div
					class="d-flex justify-content-between border border-primary mb-3 rounded rounded-3 text-primary shadow-sm">
					<div class="p-2">bb님, { 22/10/07 09:00~18:00 }</div>
					<div class="p-2 text-center">
						<b>도움요청 </b><i class="fa fa-angle-right" aria-hidden="true"></i>
					</div>
				</div>
				<div
					class="d-flex justify-content-between border border-primary mb-3 rounded rounded-3 text-primary shadow-sm">
					<div class="p-2">cc님, { 22/10/07 09:00~18:00 }</div>
					<div class="p-2 text-center">
						<b>도움요청 </b><i class="fa fa-angle-right" aria-hidden="true"></i>
					</div>
				</div>
			</div>

      <!--작성게시글-->
			<div class="myPageDiv">
				<div class="d-flex justify-content-between mb-3">
					<div><h4>작성게시글</h4></div>
				</div>
				<div class="table-responsive custom-table-responsive shadow-sm">
					<table class="table custom-table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">내용</th>
								<th scope="col">작성일자</th>
							</tr>
						</thead>
						<tbody>
							<tr scope="row">
								<td>#1</td>
								<td>
									<a href="#">
										<b>HELLO</b>
										<small class="d-block">ZZZZZZZZZZZZZzzzzzzzzzzzz</small>
									</a>
								</td>
								<td>2022.10.29</td>
							</tr>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
							<tr scope="row">
								<td>#1</td>
								<td>
									<a href="#">
										<b>HELLO</b>
										<small class="d-block">ZZZZZZZZZZZZZzzzzzzzzzzzz</small>
									</a>
								</td>
								<td>2022.10.29</td>
							</tr>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
							<tr scope="row">
								<td>#1</td>
								<td>
									<a href="#">
										<b>HELLO</b>
										<small class="d-block">ZZZZZZZZZZZZZzzzzzzzzzzzz</small>
									</a>
								</td>
								<td>2022.10.29</td>
							</tr>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

      <!--돌봄 후기-->
			<div class="myPageDiv">
				<div class="d-flex justify-content-between mb-3">
					<div><h4>돌봄후기</h4>	</div>
					<a href="#"><i class="fa fa-plus-square-o" aria-hidden="true"></i>더보기</a>
				</div>
				<div class="table-responsive custom-table-responsive shadow-sm">
					<table class="table custom-table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">내용</th>
								<th scope="col"><i class="bi bi-star-fill"></i></th>
								<th scope="col">작성일자</th>
							</tr>
						</thead>
						<tbody>
							<tr scope="row">
								<td>#1</td>
								<td><a href="#">HELLO<small class="d-block">ZZZZZZZZZZZZZzzzzzzzzzzzz</small></a></td>
								<td>4.5</td>
								<td>2022.10.29</td>
							</tr>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
							<tr scope="row">
								<td>#2</td>
								<td><a href="#">HELLO<small class="d-block">ZZZZZZZZZZZZZzzzzzzzzzzzz</small></a></td>
								<td>4.5</td>
								<td>2022.10.29</td>
							</tr>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
							<tr scope="row">
								<td>#3</td>
								<td><a href="#">HELLO<small class="d-block">ZZZZZZZZZZZZZzzzzzzzzzzzz</small></a></td>
								<td>4.5</td>
								<td>2022.10.29</td>
							</tr>
							<tr class="spacer">
								<td colspan="100"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<span id="deleteM" class="btn btn-link text-secondary p-0 ">회원탈퇴</span>
		</div>
	</section>
  
  <%@include file="../footer.jsp" %>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#F96D00" /></svg></div>

  <script src="/js/trim.js"></script>
  <script src="/js/jquery.min.js"></script>
  <script src="/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/js/popper.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/jquery.easing.1.3.js"></script>
  <script src="/js/jquery.waypoints.min.js"></script>
  <script src="/js/jquery.stellar.min.js"></script>
  <script src="/js/jquery.animateNumber.min.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/jquery.magnific-popup.min.js"></script>
  <script src="/js/scrollax.min.js"></script>
  <script src="/js/main.js"></script>
    
  </body>
</html>