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
    	table.reportview{
    		width:100%;
    		border-collapse: collapse;
  			border-spacing: 1px;
  			text-align: left;
  			line-height: 1.5;
  			border-top: 3px solid black;
    	}
    	table.reportview th{
  			padding: 10px;
  			font-weight: bold;
  			vertical-align: top;
  			text-align: center;
    	}
    	table.reportview thead{
    		border-bottom: 2px solid black;
    	}
    	table.reportview td {
  		padding: 10px;
  		vertical-align: top;
  		border-bottom: 1px solid #ccc;
		}
		#tablecontent{
			text-align: center;
		}
		.sort{
			float:right;
			text-align: right;
		}
		#deletechecked{
			float:right;
			
		}
    </style>
  </head>
  <body>
<%@include file="../header.jsp" %>
    <script>
    function fn_paging(reportcp) {
    	console.log("reportcp:"+reportcp);
    	location.href = "/report/list.do?reportcp=" + reportcp;
    	}
    </script>
    <section class="hero-wrap hero-wrap-2" style="background-image: url('/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span>Report <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">신고목록</h1>
          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section bg-light">
    <div class="container">
    <c:if test="${!empty sessionScope.reportkeyword}">
    <span id="showkeyword">"${sessionScope.reportkeyword}"에 대한 검색결과입니다</span>
    </c:if>
    <span class="sort">
    	<a href="#" id="state_all" onClick="selectsort('처리')">전체보기</a> | <a href="#" id="state_before" onClick="selectsort('미처리')">미처리</a> | <a href="#" id="state_ing" onClick="selectsort('처리중')">처리중</a> | <a href="#" id="state_complete" onClick="selectsort('처리완료')">처리완료</a>
    </span>
    <table class="reportview">
    <thead>
    <tr>
    	<th>번호</th>
	    <th>원글 링크</th>
	    <th>신고자 이메일</th>
	    <th>신고 사유</th>
	    <th>작성자 이메일</th>
	    <th>처리 상태</th>
	    <th>신고일</th>
	    <th><button onClick="allClick()" id="checkall">일괄 선택</button></th>
	</tr>
    </thead>
    <tbody>
    <c:choose>
    <c:when test="${empty reportVo.list}">
    	<td id="tablecontent" colspan="8">검색결과가 없습니다</td>
    </c:when>
    <c:otherwise>
    <c:forEach items="${reportVo.list}" var="list">
    <tr>
    <td id="tablecontent">${list.rep_seq}</td>
    <c:choose>
    <c:when test="${fn:contains(list.rep_wseq,'DOL')}">
    <td id="tablecontent"><a href="/dolbom/content.do?dol_seq=${list.rep_wseq}">돌보미게시판</a></td>
    </c:when>
    <c:when test="${fn:contains(list.rep_wseq,'SM')}">
    <td id="tablecontent"><a href="/dolbom/content.do?dol_seq=${list.rep_wseq}">나눔마켓</a></td>
    </c:when>
    <c:when test="${fn:contains(list.rep_wseq,'CR')}">
    <td id="tablecontent"><a href="/dolbom/content.do?dol_seq=${list.rep_wseq}">후기</a></td>
    </c:when>
    <c:when test="${fn:contains(list.rep_wseq,'G')}">
    <td id="tablecontent"><a href="/dolbom/content.do?dol_seq=${list.rep_wseq}">갤러리</a></td>
    </c:when>
    </c:choose>
    <td id="tablecontent"><a href="/admin/useroperatingemail.do?email=${list.rep_remail}">${list.rep_remail}</a></td>
    <td id="tablecontent"><a href="/report/content.do?rep_seq=${list.rep_seq}">${list.rep_reason}</a></td>
    <td id="tablecontent"><a href="/admin/useroperatingemail.do?email=${list.rep_wemail}">${list.rep_wemail}</a></td>
    <td id="tablecontent">${list.rep_state}</td>
    <td id="tablecontent">${list.rep_date}</td>
    <td id="tablecontent"><input type="checkbox" name="checkseq" value="${list.rep_seq}"></td>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    </tbody>
    </table>
    <div>
    <span><button id="deletechecked" onClick="deletechecked()">일괄 삭제</button></span>
    <c:choose>
    <c:when test="${empty reportVo }">
    </c:when>
    <c:otherwise>
    <c:if test="${reportVo.currentRange ne 1}">
    	<a href="#" onClick="fn_paging(1)">[처음]</a>
	</c:if>
	<c:if test="${reportVo.cp ne 1}">
		<a href="#" onClick="fn_paging('${reportVo.prevPage}')">이전</a>
	</c:if>
	<c:forEach var="i" begin="${reportVo.startPage}" end="${reportVo.endPage}">
	<c:choose>
		<c:when test="${i eq reportVo.cp}">
			<span style="font-weight: bold;"><a href="#" onClick="fn_paging('${i}')">${i}</a></span>
		</c:when>
		<c:otherwise>
			<a href="#" onClick="fn_paging('${i}')">${i}</a>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${reportVo.cp ne reportVo.totalPageCount && reportVo.totalPageCount>0}">
		<a href="#" onClick="fn_paging('${reportVo.nextPage}')">[다음]</a>
	</c:if>
	<c:if test="${reportVo.currentRange ne reportVo.rangeCount && reportVo.rangeCount > 0}">
		<a href="#" onClick="fn_paging('${reportVo.totalPageCount}')">[끝]</a>
	</c:if>
	</c:otherwise>
	</c:choose>
	</div>
	<form action="list.do">
	<div>
	<select name="reportcatgo" id="reportcatgo">
	<c:choose>
	<c:when test="${sessionScope.reportcatgo eq 'rep_remail'}">
	<option value="rep_remail" selected>신고자</option>
	<option value="rep_wemail">작성자</option>
	<option value="rep_wseq">글 번호</option>
	</c:when>
	<c:when test="${sessionScope.reportcatgo eq 'rep_wemail'}">
	<option value="rep_remail">신고자</option>
	<option value="rep_wemail" selected>작성자</option>
	<option value="rep_wseq">글 번호</option>
	</c:when>
	<c:when test="${sessionScope.reportcatgo eq 'rep_wseq'}">
	<option value="rep_remail">신고자</option>
	<option value="rep_wemail">작성자</option>
	<option value="rep_wseq" selected>글 번호</option>
	</c:when>
	<c:otherwise>
	<option value="rep_remail" selected>신고자</option>
	<option value="rep_wemail">작성자</option>
	<option value="rep_wseq">글 번호</option>
	</c:otherwise>
	</c:choose>
	</select>
	<input type="text" name="reportkeyword" id="reportkeyword">
	<input type="hidden" name="reportsearchModeStr" id="reportsearchModeStr" value="T">
	<input type="hidden" name="reportcp" id="reportcp" value="1">
	<input type="hidden" name="rep_state" id="rep_state">
	<button type="submit" id="searchBtn">검색</button>
	</div>
	</form>
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
  function fn_paging(cp) {
  	console.log("cp:"+cp);
  	location.href = "/info/list.do?cp=" + cp;
  	}
  	function selectsort(sort){
  		document.getElementById("rep_state").value=sort;
  		console.log(sort);
  		var p = {
  			"rep_state" : sort,
  			"catgo": "${sessionScope.catgo}",
  			"keyword": "${sessionScope.keyword}"
  			};
  		$.get("/report/list.do", p, function(data){});
  		location.reload();
  	}
  	$(document).ready(function(){
  		//"${sessionScope.rep_state}"
  		if("${sessionScope.rep_state}" == $("#state_before").text()){
  			document.getElementById("state_before").style.fontWeight='bold';
  		}else if("${sessionScope.rep_state}" == $("#state_ing").text()){
  			document.getElementById("state_ing").style.fontWeight='bold';
  		}else if("${sessionScope.rep_state}" == $("#state_complete").text()){
  			document.getElementById("state_complete").style.fontWeight='bold';
  		}else{
  			document.getElementById("state_all").style.fontWeight='bold';
  		}
  	});
  	function send(){
		alert($("#catgo").val());
		alert($("#keyword").val());
		alert(sessionStorage.getItem("rep_state"));
		rep_state = sessionStorage.getItem("rep_state");
		$.ajax({
			url:"/report/list.do",
			type:"GET",
			data: {
				"rep_state": rep_state, 
				"catgo":$("#catgo").val(), 
				"keyword":$("#keyword").val(), 
				"cp":"1",
				"searchModeStr":"T"},
			success:function(data){
				console.log(data);
				alert(data);
			},
			error:function(data){
				alert("에러");
			}
		});
  	}
  	var del_list = new Array();
  	var checkval = $("input[name=checkseq]");
  	var size;
  	function allClick(){
  		var checkall = $("#checkall");
  		checkval = $("input[name=checkseq]");
  		size = checkval.length;
  		if(checkall.attr('name') == 'checkall-checked'){  			
  			$(checkval).prop("checked", false);
  			checkall.attr("name","checkall");
  			del_list = new Array();
  		}else{
  			del_list = new Array();
  			$(checkval).prop("checked", true);
  			checkall.attr("name","checkall-checked");
  			for(i=0;i<size;i++){
  				var checkvalue = checkval.eq(i).attr("value");
  				del_list.push(checkvalue);
  				console.log(del_list);
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
  		
  		$.get("/report/checkdelete.json", v, function(data){
  			alert(data);
  			if(data == true){
  			location.href="/report/list.do";
  			}else{
  				alert("삭제가 안되용");
  			}
  		});
  	};
  </script>
    
  </body>
</html>