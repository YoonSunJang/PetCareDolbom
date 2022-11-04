<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	table.infoview{
    		width:100%;
    		border-collapse: collapse;
  			border-spacing: 1px;
  			text-align: left;
  			line-height: 1.5;
  			border-top: 3px solid black;
    	}
    	table.infoview th{
  			padding: 10px;
  			font-weight: bold;
  			vertical-align: top;
  			text-align: center;
    	}
    	table.infoview thead{
    		border-bottom: 2px solid black;
    	}
    	table.infoview td {
  		padding: 10px;
  		vertical-align: top;
  		border-bottom: 1px solid #ccc;
		}
		#tablecontent{
			text-align: center;
		}
		.listpage{
			margin:auto;
		}
		#writeBtn{
			float:right;
		}
    </style>
  </head>
  <body>
<%@include file="../header.jsp" %>
    <script>
    function fn_paging(cp) {
    	console.log("cp:"+cp);
    	location.href = "/info/list.do?cp=" + cp;
    	}
    </script>
    <section class="hero-wrap hero-wrap-2">;
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span>Information <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">공지사항</h1>
          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section bg-light">
    <div class="container">
    <table class="infoview">
    <thead>
    <tr>
    	<th>번호</th>
	    <th>제목</th>
	    <th>작성자</th>
	    <th>작성일</th>
	    <th>수정일</th>
	    <th><input type="checkbox" onClick="allClick()" id="checkall"></th>
	</tr>
    </thead>
    <tbody>
    <c:choose>
    <c:when test="${empty listpinS&&empty listVo}">
    <tr>
    <td id="tablecontent" colspan="6">공지사항이 없습니다</td>
    </tr>
    </c:when>
    <c:otherwise>
    <c:forEach items="${listpinS}" var="listpinS">
    <tr>
    <td id="tablecontent">${listpinS.n_seq}</td>
    <td id="tablecontent"><a href="infocontent.do?n_seq=${listpinS.n_seq}">${listpinS.title}</a></td>
    <td id="tablecontent">${listpinS.admin}</td>
    <td id="tablecontent">${listpinS.wdate}</td>
    <td id="tablecontent">${listpinS.udate}</td>
    <td id="tablecontent"><input type="checkbox" name="checkseq" value="${listpinS.n_seq}"></td>
    </tr>
    </c:forEach>
    <c:forEach items="${listVo.list}" var="infolist">
    <tr>
    <td id="tablecontent">${infolist.n_seq}</td>
    <td id="tablecontent"><a href="infocontent.do?n_seq=${infolist.n_seq}">${infolist.title}</a></td>
    <td id="tablecontent">${infolist.admin}</td>
    <td id="tablecontent">${infolist.wdate}</td>
    <td id="tablecontent">${infolist.udate}</td>
    <td id="tablecontent"><input type="checkbox" name="checkseq" value="${infolist.n_seq}"></td>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    </tbody>
    </table>
    <div class="listpage">
    <c:choose>
    <c:when test="${empty listVo}">
    </c:when>
    <c:otherwise>
    <c:if test="${listVo.currentRange ne 1}">
    	<a href="#" onClick="fn_paging(1)">[처음]</a>
    </c:if>
    <c:if test="${listVo.cp ne 1}">
		<a href="#" onClick="fn_paging('${listVo.prevPage }')">[이전]</a> 
	</c:if>
	<c:forEach var="i" begin="${listVo.startPage }" end="${listVo.endPage }">
	<c:choose>
    	<c:when test="${i eq  listVo.cp}">
        	<span style="font-weight: bold;"><a href="#" onClick="fn_paging('${i}')">${i}</a></span> 
		</c:when>
        <c:otherwise>
            <a href="#" onClick="fn_paging('${i}')">${i}</a> 
		</c:otherwise>
	</c:choose>
    	</c:forEach>
        	<c:if test="${listVo.cp ne listVo.totalPageCount && listVo.totalPageCount > 0}">
            	<a href="#" onClick="fn_paging('${listVo.nextPage }')">[다음]</a> 
            </c:if>
	<c:if test="${listVo.currentRange ne listVo.rangeCount && listVo.rangeCount > 0}">
    	<a href="#" onClick="fn_paging('${listVo.totalPageCount }')">[끝]</a> 
	</c:if>
	</c:otherwise>
	</c:choose>
	<button id="writeBtn" onClick="location.href='/info/infowrite.do'">글쓰기</button>
	<span><button type="button" id="deletechecked" onClick="deletechecked()">일괄 삭제</button></span>
	</div>
	<form action="list.do">
	<div>
	<select name="catgo" id="catgo">
	<option value="title">제목</option>
	<option value="wdate">작성일</option>
	<option value="udate">수정일</option>
	</select>
    <input type="text" name="infokeyword" id="infokeyword">
    <input type="hidden" name="infosearchModeStr" id="infosearchModeStr" value="T">
	<input type="hidden" name="infocp" id="infocp" value="1">
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
		
		$.get("/info/checkdelete.do", v, function(data){
			location.href="/info/list.do";
		});
	};
  </script>
    
  </body>
</html>