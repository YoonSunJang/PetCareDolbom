<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
    <title>Pet Care</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
    <!-- 수정/삭제 -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>      
    <!-- 수정/삭제 끝-->
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
    <!-- 부트스트랩 아이콘 스타일시트 추가-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/85570877c4.js" crossorigin="anonymous"></script>
  
  <style>
  #content{
  margin:20px;
  padding:10px;
  }
   .employer_info{
 	width: 100%;
     position: relative;
   	border-bottom: 1px solid #ccc;
   	clear: both;
   	padding:10px;
    }
    .photo{
    padding:10px;
    margin-right:10px;
    width: 200px;
    height: 200px;
    /*overflow:hidden;*/
    float: left;
    /*margin: 10px auto;
    text-align: center;
    object-fit: cover;
    border-radius: 50%;*/
    }
    .photo .profile_img{
    width:100%;
    height:100%;
    object-fit:cover;
    border-radius:10%;
    }
    .btn_wrap{
    /*text-align: right;*/
    position: relative;
    margin: 10px 0;
    top: 0;
    padding: 10px;
    right: 10px;
    bottom: 20px;
    }
    strong.title {
    display: block;
    color: #f24c59;
    font-size: 20px;
    padding-bottom: 10px;
    font-weight: 700;
    margin-top: 10px;
    }
    .employer_text{
    width: 100%;
    position: relative;
    border-bottom: 1px solid #ccc;
    padding: 0 10px;
    clear: both;
    }
    .petinfo{
    width: 100%;
    position: relative;
    border-bottom: 1px solid #ccc;
    padding: 10px;
    clear: both;
    }
    .comments{
    position: relative;
    padding: 10px 0;
    clear: both;
    }
    .petinfo .card {
    border-radius: 10px;
    margin: 10px;
	}

	.petinfo .card .card-header .profile_img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin: 10px auto;
    border: 5px solid #ccc;
    border-radius: 50%;
	}

	.petinfo .card h3 {
	 font-size: 20px;
	 font-weight: 700;
	}

	.petinfo .card p {
	 font-size: 16px;
	 color: #000;
	}
	a.blog-img{
	border-radius:50%;
	}
	.category {
    padding: 5px 10px;
    background: #e6e6e6;
    color: #000000;
    text-transform: uppercase;
    font-size: 13px;
    letter-spacing: .1em;
    font-weight: 400;
    border-radius: 4px;
	}
	.dropdown-menu{
   		min-width:4rem;
	}
	.modal-bg {display:none;width:100%;height:100%;position:fixed;top:0;left:0;right:0;background: rgba(0, 0, 0, 0.6);z-index:999;}
	.modal-wrap {display:none;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);width:500px;height:200px;background:white;opacity:0.9;z-index:1000;text-align:center;border-radius: 5px;}
	.modal-wrap-report{display:none;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);width:300px;height:500px;background:white;opacity:0.9;z-index:1000;text-align:center;border-radius: 5px;}
	.modal-message{width:80%;margin:auto;}
	.modal-message .countText{text-align:right;}
 	#heart{
   		color:#ff2b53;
   		font-size:1.3rem;
   	}
   	#heart:hover{
   		opacity:0.5;
   	}
  
  </style>
  <script>
  	  const b_seq = "${dolbom.dol_seq}";
	  $(function(){
		  //var date = new Date();
		  //var year = date.getFullYear();
		  //var byear = ${d}
		  //console.log(year);
		  $(".container").on("click", "#update, #delete", function(){
			  
		  });
		  var likesSwitch = ${hasLike};
		  if(likesSwitch) $("#heart").removeClass("bi-heart").addClass("bi-heart-fill");
		  console.log("likesSwitch" + likesSwitch);
		  $("#heart").on("click", function(){
  			var type = "";
  			console.log(likesSwitch);
  			if(!likesSwitch){
  				type = "plus";
  				likesSwitch = true;
  			}else if(likesSwitch){
  				type = "minus";
  				likesSwitch = false;
  			} 			
  			$.ajax({
  				url: "/dolbom/likes.json",
  				type: "POST",
  				data:{
  					b_seq: b_seq,
  					type:type,
  					email: "${sessionScope.email}"
  				},
  				success: function(likes){
  					if(!likesSwitch){
  						$("#heart").removeClass("bi-heart-fill").addClass("bi-heart");
  					}else{
  						$("#heart").removeClass("bi-heart").addClass("bi-heart-fill");
  					}
  					$("#heart_Data").html("&nbsp;"+likes);
  				}
  			})
  			
  		})
	  });
  </script>
  </head>
  <body>
<%@include file="../header.jsp" %>
    
    <section class="hero-wrap hero-wrap-2" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span>Pet Care<i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">우리동네 돌보미</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container" style="height:800px;">
    	<div class="d-flex flex-row justify-content-end mr-5">
    	<c:if test="${checkWriter eq 'Y'}">
		    		<div class="btn-group">
						<button class="btn p-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<span class="bi bi-three-dots"></span>
						</button>
						<ul id="${dolbom.dol_seq}" class="dropdown-menu">
							<li id="update" class="btn text-secondary p-0"><a class="dropdown-item bi bi-eraser-fill" href="javascript:checkUpdate()"> 수정</a></li>
							<li id="delete" class="btn text-secondary p-0"><a class="dropdown-item bi bi-x-lg" href="javascript:checkDelete()"> 삭제</a></li>
						</ul>
					</div>	
				</c:if>
				</div>
    	<div class="row mt-0" id="content" style="height:90%;">
    		<div class="col-lg-8 p-3 col-lg-8 bg-white shadow">
	    		<div class="employer_info">
	    			<div class="row">
	    			<div class="col-11">
	    			<c:if test="${dolbom.category eq '요청'}">
	    				<strong class="title">돌봄이 필요해요</strong>
	    			</c:if>
	    			<c:if test="${dolbom.category eq '제공'}">
	    				<strong class="title">돌보미가 될게요</strong>
	    			</c:if>
	    			</div>
	    			<div class="col-1 p-2" style="text-align:center;"><i id="heart" class="bi bi-heart"></i></div>
	    			</div>
	    			
	    			<div class="photo">
	    				<c:choose>
    						<c:when test="${empty fnames[0]}">
    							<img class="profile_img" src="/images/altimg_puppy.png">
    						</c:when>
    						<c:otherwise>
   								<img class="profile_img" src="/dolbom/display?imgName=${fnames[0]}">
   							</c:otherwise>
    					</c:choose>
	    			</div>
	    			<div class="info">
	    				<!-- 
	    				<div style="display: inline-block;width:100px;text-align:center;margin-right:200px;">
	    				<span class="category">	    					
	    					돌봄 ${dolbom.category}
						</span>
						</div> -->	
	    				<!-- <p class="kind"><strong>돌봄 종류&nbsp;</strong></p> -->
	    				
	    				<c:forEach items="${kind}" var="kind">
	    				<c:choose>
	    					<c:when test="${kind eq '산책'}">
		    				<div style="display: inline-block;width:100px;border:1px solid gray;text-align:center;border-radius: 10px;margin:10px 10px 10px 0;">
		    					<span><i class="bi bi-tree"></i>${kind}</span>
		    				</div>
		    				</c:when>
		    				<c:when test="${kind eq '방문돌봄'}">
		    				<div style="display: inline-block;width:100px;border:1px solid gray;text-align:center;border-radius: 10px;margin:10px 10px 10px 0;">
		    					<span><i class="bi bi-bell"></i>${kind}</span>
		    				</div>
		    				</c:when>
		    				<c:when test="${kind eq '위탁돌봄'}">
		    				<div style="display: inline-block;width:100px;border:1px solid gray;text-align:center;border-radius: 10px;margin:10px 10px 10px 0;">
		    					<span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-heart" viewBox="0 0 16 16">
								  <path d="M8 6.982C9.664 5.309 13.825 8.236 8 12 2.175 8.236 6.336 5.309 8 6.982Z"/>
								  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.707L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.646a.5.5 0 0 0 .708-.707L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
							</svg>${kind}</span>
		    				</div>
		    				</c:when>
	    				</c:choose>
	    				</c:forEach>	
	    				<div class="date">
		    				<span class="workdate"><strong>돌봄 날짜&nbsp;&nbsp;</strong>${dolbom.header}</span><br>
		    				<c:if test="${dolbom.category eq '제공'}">
		    				<span class="worktime"><strong>돌봄 시간&nbsp;&nbsp;</strong>
		    				${dolbom.workstime}~${dolbom.worketime}</span>
		    				</c:if>
	    				</div>
	    				<div class="wdate"><strong>등록일&nbsp;&nbsp;</strong>${dolbom.wdate}</div>
	    				<div>
	    					<span class="writer">${dolbom.nickname}</span>
	    					&nbsp;·&nbsp;
	    					<span class="region">${dolbom.region}</span>	
	    				</div>
	    				<div class="row justify-content-between">
							<div class="col-12 px-0">
								<span class="bi bi-chat-left-dots"></span>
								<span>${dolbom.chat}</span>&nbsp;&nbsp;
								<!--<span class="bi bi-eye text-black"></span>
								 <span>조회수</span>&nbsp;&nbsp; -->
								<span class="bi bi-heart-fill text-danger" style="font-size:14px"></span>
								<span id="heart_Data">${dolbom.likes}</span>
							</div>
						</div>
	    			</div>
	    			<!-- <i class="fa-solid fa-light-emergency-on"></i> -->
	    			<div class="btn_wrap" style="padding:0;text-align:right;">
	    			
	    				<button type="submit" class="btn btn-info btn-lg" id="chatBtn" onclick="check();" style="background-color:#F34A4A;">채팅</button>	
		    			<button type="submit" class="btn btn-info btn-lg" id="declaration"style="background-color:gray;" onClick="openReport();">신고</button>
		    		</div>
    			</div>
    			<div class="employer_text">
					<c:if test="${dolbom.category eq '요청'}">
	    				<strong class="title">이런 도움이 필요해요</strong>
	    			</c:if>
	    			<c:if test="${dolbom.category eq '제공'}">
	    				<strong class="title">이런 도움을 드릴게요</strong>
	    			</c:if>
    			<div>${dolbom.content}</div>
    		</div>
    		</div>
    		<!-- col 끝 -->
    		<div class="col-lg-4 p-3 sidebar bg-white shadow">
	    		<div>
	    			<c:if test="${dolbom.category eq '요청'}">
	    				<strong class="title">반려동물 정보</strong>
	    				
	    				<c:forEach items="${plist}" var="pl" varStatus="status">
	    				<div class="block-21 d-flex" style="margin:10px;">
		    				<c:choose>
		    				<c:when test="${empty pfnames[status.index]}">
		    					<a class="blog-img mr-4" style="background-image: url(/images/altimg_puppy.png)"></a>
	    					</c:when>
	    					<c:otherwise>
	    						<a class="blog-img mr-4" style="background-image: url(/dolbom/display?imgName=${pfnames[status.index]})"></a>
	    					</c:otherwise>
	    					</c:choose>
						<div class="text">
							<h3 class="heading m-0">${pl.name}<span>
								<c:if test="${pl.sex eq 'M'}"><i class="bi bi-gender-male" style="color:#4697e3;font-weight:bold;"></i></c:if>
								<c:if test="${pl.sex eq 'F'}"><i class="bi bi-gender-female" style="color:#e36fd9;font-weight:bold;"></i></c:if>
							</span></h3>
							<div class="recentContents">
							  <div><span class="icon-person">${pl.kind}&nbsp;|&nbsp;${pl.breed}&nbsp;|&nbsp;${pl.big}</span></div>
							  <div><span class="icon-calendar">${pl.age}&nbsp;살&nbsp;|&nbsp;중성화
							  <c:if test="${pl.cut eq 'Y'}">O</c:if>
							  <c:if test="${pl.cut eq 'N'}">X</c:if></span>
							  </div>
							</div>
						</div>
						</div>
						</c:forEach>
	    			</c:if>
	    			<c:if test="${dolbom.category eq '제공'}">
		    			<strong class="title">돌봄스케줄</strong>
		    			<table class="table table-hover">
			    			<thead class="thead">
			    			<tr>
			    				<th>돌봄 시간</th>
			    				<th>상태</th>
			    			</tr>
			    			<tbody>
			    			<c:choose>
			    				<c:when test="${empty dlist}">
				    				<tr>	
				    					<td colspan="2" align="center">진행중인 스케줄이 없어요</td>
				    					
				    				</tr>
			    				</c:when>
					    		<c:otherwise>   			
			    					<c:forEach items="${dlist}" var="dl">
				    					<tr>
					    					<td>${dl.workdate}</td>
							    			<td>${dl.state}</td>
						    			</tr>
					    			</c:forEach>
				    			</c:otherwise>			
				    			</c:choose>
			    			</tbody>
		    			</table>
		    		</c:if>
	    		</div>
    		</div>
			   			
    	</div>
    	
    	<!-- 
    	<c:if test="${checkWriter eq 'Y'}">
	    	<div class="btn_wrap" style="text-align:right; margin:0">
	    		<button type="submit" onclick="checkUpdate();">수정</button>
	    		<button type="submit" onclick="checkDelete();">삭제</button>
	    	</div>
	    </c:if>
	     -->
    	</div>    	
    </section>
    
	<div class="modal-bg" onClick="popClose();"></div>
	<div class="modal-wrap">
		<div class="modal-title" style="background: linear-gradient(45deg, #207dff 0%, #00bd55 100%);opacity:0.5;">
			<h5 style="color:white;">우리동네 돌보미 채팅</h5>
		</div>	
		<div class="modal-message">
			<c:if test="${dolbom.category eq '제공'}">
			<c:choose>
				<c:when test="${empty times}">
					<p style="position: absolute;top:40%;left:28%;">돌봄 신청글을 먼저 작성해주세요.</p>
					<div style="position: absolute;top:80%;left:43%;">
						<button onclick="location.href='/dolbom/form';">작성하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<span>돌봄 시간 및 종류를 선택해주세요</span>
					</div>
					<div>
						<select id="workdateKind">
						<c:forEach items="${times}" var="tlist">
							<option><span id="header">${tlist.header}</span>/
								<span id="kind">${tlist.kind}</span>/
								<span style="visibility: hidden;">${tlist.dol_seq}</span> 
							</option>
						</c:forEach>
						</select>
					</div>
					<div style="position: absolute;top:80%;left:43%;">
					 <button class="submitMsgBtn" onClick="submitMsg('${dolbom.category}');">채팅하기</button>
					</div>
				</c:otherwise>
			</c:choose>
			</c:if>
			<c:if test="${dolbom.category eq '요청'}">
				<div>
					<span>돌봄 시간 및 종류를 확인해주세요</span>
				</div>
				<div style="padding:5px;font-size:1.2rem;">
					<span id="header">${dolbom.header}</span>/<span id="kind">${dolbom.kind}</span>
				</div>
				<div style="position: absolute;top:80%;left:43%;">
					 <button class="submitMsgBtn" onClick="submitMsg('${dolbom.category}');">채팅하기</button>
				</div>
			</c:if>
		</div>
		<input type="hidden" id="dol_seq" name="dol_seq" value="${dolbom.dol_seq}">
		<input type="hidden" id="category" name="category" value="${dolbom.category}">
	</div>
	
	<div class="modal-wrap-report">
		<div class="modal-title" style="background: linear-gradient(45deg, #207dff 0%, #00bd55 100%);opacity:0.5;">
			<h5 style="color:white;">우리동네 돌보미 신고하기</h5>
		</div>
		<div class="modal-message">
			<form method="post" action="/report.do" name="report">
			<table>
			<tr>
			<td>작성자 닉네임</td>
			<td id="rep_wemail">${dolbom.email}</td>
			</tr>
			<tr>
			<td>신고자 닉네임</td>
			<td id="rep_remail">${sessionScope.email}</td>
			</tr>
			<tr>
			<td>
			<div id="selectdiv">
			<span>신고 사유</span>
			<select id="rep_reason" name="rep_reason">
				<option value="약속파기">약속파기</option>
				<option value="욕설/비방">욕설/비방</option>
				<option value="음란물/혐오스러운 사진">음란물/혐오스러운 사진</option>
				<option value="홍보/상업성">홍보/상업성</option>
				<option value="도배">도배</option>
			</select>
			</div>
			</td>
			</tr>
			<tr><td><textarea id="rep_content" name="rep_content" placeholder="구체적인 신고 사유를 입력해주세요"></textarea></td></tr>
			<tr><td><div id="btns">
			<input type="hidden" id="rep_wemail" name="rep_wemail" value="${dolbom.email}">
			<input type="hidden" id="rep_remail" name="rep_remail" value="${sessionScope.email}">
			<input type="hidden" id="rep_wseq" name="rep_wseq" value="${dolbom.dol_seq}">
			<input type="hidden" id="rep_state" name="rep_state" value="미처리">
			<button class="sendBtn" id="sendBtn">전송</button>
			<button type="button" onclick="popClose();">닫기</button>
			</div>
			</td></tr>
			</table>
			</form>
		</div>
	</div>
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<script>
	function openReport(){
		var email = "${dolbom.email}";
		var userEmail = "${sessionScope.email}";
		var dolSeq = "${dolbom.dol_seq}";
		//console.log(email);
		//console.log(userEmail);
		//console.log(dolSeq);
		if(userEmail!=""){
			if(email!=userEmail){
				popOpenReport();
				//url='/report.do?rep_wemail='+email+'&rep_remail='+userEmail+'&rep_wseq='+dolSeq;
				//window.open(url, '신고', 'width=300px,height=500px,scrollbars=yes');
			}else{
				alert("본인 신고는 불가합니다.");
				return false;
			}		
		}else{
			alert("로그인 후 이용해주세요!");
		}
	}
	function popOpenReport(){
		var modalPopReport = $('.modal-wrap-report');
	    var modalBg = $('.modal-bg'); 	
	    $(modalPopReport).show();
	    $(modalBg).show();
	}
	function checkUpdate(){
		var dol_seq = $("#dol_seq").val();
		var category = $("#category").val();
		if(category=="제공"){
			location.href="/dolbom/he_update?dol_seq="+dol_seq;
		}else if(category=="요청"){
			location.href="/dolbom/re_update?dol_seq="+dol_seq;
		}else{
			return false;
		}
	}
	function checkDelete(){
		var dol_seq = $("#dol_seq").val();
		if(confirm("정말 삭제할까요?") == true){
			location.href="/dolbom/delete?dol_seq="+dol_seq;
		}else{
			return false;
		}
	}
	function checkDuplicate(){
		$.ajax({
			url: "../dolbom/checkDuplicate.json",
			type: "GET",
			data:{dol_seq:$("#dol_seq").val()},
			success: function(results){
				if(results.msg=='new'){
					popOpen();
				}else{
					window.open(results.url, '채팅', 'width=700px,height=800px,scrollbars=yes');
				}
			}
		});
	}
	function checkMe(){
		var email = "${dolbom.email}";
		$.ajax({
			url: "../dolbom/checkMe.json",
			type: "GET",
			data:{writer:email},
			success: function(data){
				if(data==true){
					alert("본인에게 채팅할 수 없어요.");
				}else{
					checkDuplicate();
					//popOpen();
				}
			}
		});
	}
	/*돕기/요청버튼 클릭시 로그인 체크*/
	function check(){
		if(${not empty sessionScope.email}){
			checkMe();
		}else{
			alert("로그인 후 이용해주세요!");
		}
	}
	/*메세지 텍스트 입력 수*/
	/*$(document).on('keyup', '#textMsg', function(e){
		var textMsg = $(this).val();    
		$('#cntSPAN').text(getBytes(textMsg));
	});
	
	function getBytes(str){
		var cnt = 0;
		for(var i =0; i<str.length;i++) {
			cnt += (str.charCodeAt(i) >128) ? 2 : 1;
		}
		return cnt;
	}*/

	/*메세지 모달 팝업 창*/
	function popOpen() {	
	    var modalPop = $('.modal-wrap');
	    var modalBg = $('.modal-bg'); 	
	    $(modalPop).show();
	    $(modalBg).show();
	
	}
	function popClose() {
	   var modalPop = $('.modal-wrap');
	   var modalPopReport = $('.modal-wrap-report');
	   var modalBg = $('.modal-bg');	
	   $(modalPop).hide();
	   $(modalPopReport).hide();
	   $(modalBg).hide();
	}
	/*메세지 전송*/
	function submitMsg(category){
		if(category == '제공'){
			var workdateKind = $("#workdateKind option:selected").val();
			var header = workdateKind.split('/')[0];
			var kind = workdateKind.split('/')[1].trim();
			var rdol_seq = workdateKind.split('/')[2].trim();
			var rN = header+"/"+kind;
			createRoom(rN, category, rdol_seq);
		}else{
			var kind = $("#kind").text();
			var header = $("#header").text();
			var dol_seq = $("#dol_seq").val();
			var rN = header+"/"+kind;
			createRoom(rN, category, dol_seq);
		}
		$.ajax({
	    	url: "../dolbom/requestdolbom.json",
			type: "POST",
			data: {dol_seq:$("#dol_seq").val(),rdol_seq:rdol_seq,kind:kind,header:header},
			success:function(data){
				alert("요청성공!");
				popClose();
			}
			
		});
	}
	function createRoom(rN, category, dol_seq){
		var c_b_seq_offer = "${dolbom.dol_seq}";
		var msg = {roomName : rN, email:"${sessionScope.email}", gemail:"${dolbom.email}", category:category, c_b_seq:dol_seq, c_b_seq_offer:c_b_seq_offer};
		console.log("createRoom");
		commonAjax('/createRoom.json', msg, 'post');
	}
	
	function commonAjax(url, parameter, type, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				console.log(res);
				checkDuplicate();
			},
			error : function(err){
				console.log('error');
			}
		});
	}
</script>

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
  <script src="/js/main.js"></script>

    <%@include file="../footer.jsp" %>
  </body>
</html>
