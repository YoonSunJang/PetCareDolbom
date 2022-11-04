<%@ page contentType="text/html; charset=utf-8" %>
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
    	table.userview{
    		width:100%;
    		border-collapse: collapse;
  			border-spacing: 1px;
  			text-align: left;
  			line-height: 1.5;
  			border-top: 3px solid black;
  			margin : 20px 10px;
    	}
    	table.userview th{
  			padding: 10px;
  			font-weight: bold;
  			vertical-align: top;
  			text-align: center;
    	}
    	table.userview thead{
    		border-bottom: 2px solid black;
    	}
    	table.userview td {
  		padding: 10px;
  		vertical-align: top;
  		border-bottom: 1px solid #ccc;
		}
		#tablecontent{
			text-align: center;
		}
    </style>
  </head>
  <body>
<%@include file="../header.jsp" %>

    
    <section class="ftco-section bg-light">
    <div class="container">
    <div class="admincontainer">
    <table class="userview">
    <thead>
    <tr>
    	<th>이름</th>
	    <th>닉네임</th>
	    <th>이메일</th>
	    <th>성별</th>
	    <th>가입일</th>
	    <th><button onClick="allClick()" id="checkall">일괄 선택</button></th>
	</tr>
    </thead>
    <tbody>
    <c:choose>
    <c:when test="${empty memberVo.list}">
    	<td id="tablecontent" colspan="5">검색결과가 없습니다</td>
    </c:when>
    <c:otherwise>
    <c:forEach items="${memberVo.list}" var="userlist">
    <tr>
    <td id="tablecontent">${userlist.name}</td>
    <td id="tablecontent">${userlist.nickname}</td>
    <td id="tablecontent"><a href="/admin/useroperating.do?m_seq=${userlist.m_seq}">${userlist.email}</a></td>
    <td id="tablecontent">${userlist.gender}</td>
    <td id="tablecontent">${userlist.joindate}</td>
    <td id="tablecontent"><input type="checkbox" name="checkseq" value="${userlist.m_seq}"></td>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    </tbody>
    </table>
    <span><button type="button" id="deletechecked" onClick="deletechecked()">일괄 삭제</button></span>
    <c:choose>
    <c:when test="${empty memberVo}">
    </c:when>
    <c:otherwise>
    <c:if test="${memberVo.currentRange ne 1}">
    	<a href="#" onClick="fn_paging(1)">[처음]</a>
    </c:if>
    <c:if test="${memberVo.cp ne 1}">
    	<a href="#" onClick="fn_paging('${memberVo.prevPage}')">이전</a>
    </c:if>
    <c:forEach var="i" begin="${memberVo.startPage}" end="${memberVo.endPage}">
    	<c:choose>
    		<c:when test ="${i eq memberVo.cp}">
    			<span style="font-weight: bold;"><a href="#" onClick="fn_paging('${i}')">${i}</a></span>
    		</c:when>
    		<c:otherwise>
    			<a href="#" onClick="fn_paging('${i}')">${i}</a>
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
    <c:if test="${memberVo.cp ne memberVo.totalPageCount && memberVo.totalPageCount>0}">
    	<a href="#" onClick="fn_paging('${memberVo.nextPage}')">[다음]</a>
    </c:if>
    <c:if test="${memberVo.currentRange ne memberVo.rangeCount && memberVo.rangeCount>0}">
    	<a href="#" onClick="fn_paging('${memberVo.totalPageCount}')">[끝]</a>
    </c:if>
    </c:otherwise>
    </c:choose>
    <form action="userlist.do">
    <div>
    <select name="usercatgo" id="usercatgo">
    <c:choose>
    <c:when test="${sessionScope.usercatgo eq 'email'}">
    <option value="email" selected>이메일</option>
    <option value="joindate">가입일</option>
    <option value="nickname">닉네임</option>
    </c:when>
    <c:when test="${sessionScope.usercatgo eq 'joindate'}">
    <option value="email">이메일</option>
    <option value="joindate" selected>가입일</option>
    <option value="nickname">닉네임</option>
    </c:when>
    <c:when test="${sessionScope.usercatgo eq 'nickname'}">
    <option value="email">이메일</option>
    <option value="joindate">가입일</option>
    <option value="nickname" selected>닉네임</option>
    </c:when>
    <c:otherwise>
    <option value="email" selected>이메일</option>
    <option value="joindate">가입일</option>
    <option value="nickname">닉네임</option>
    </c:otherwise>
    </c:choose>
    </select>
    <input type="text" name="userkeyword" id="userkeyword">
    <input type="hidden" name="usersearchModeStr" id="usersearchModeStr" value="T">
	<input type="hidden" name="usercp" id="usercp" value="1">
	<button type="submit" id="searchBtn">검색</button>
    </div>
    </form>
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
  	function fn_paging(cp) {
	  	console.log("cp:"+cp);
	  	location.href = "/info/list.do?cp=" + cp;
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
		$.get("/admin/checkdelete.do", v, function(data){
			location.href="/admin/userlist.do";
		});
	};
  </script>
    
  </body>
</html>