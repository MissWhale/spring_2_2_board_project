<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
	<link rel="stylesheet" href="/resources/design.css" type="text/css"media="screen" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<title>코드 공유 게시판</title>
	<style>
		.clear {
			clear: both;
		}

		td:nth-child(1), td:nth-child(3), td:nth-child(4), td:nth-child(5),td:nth-child(6)  {
			width: 10%;
		}

		th:nth-child(1), th:nth-child(3), th:nth-child(4), th:nth-child(5),th:nth-child(6) {
			width: 10%;
		}

		a {
			text-decoration: none;
		}

		select {
			width: 100px;
			font-size: 16px;
		}

		input[type="submit"] {
			width: 90px;
		}

		a+div>form>* {
			display: inline;
			vertical-align: middle;
			height: 27px;
		}
	</style>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div>
		<div id="top">
			<a href="/" id="logo"><img src="/resources/logo.png" ></a>
			<div id="btn">
				<c:choose>
					<c:when test='${session == "yes"}'>
						<a style="font-size: 18px;"><c:out
							value="${id}님"></c:out></a>
						<a href="/logout" class="button">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="/login/login" class="button">로그인</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<img id="main" src="/resources/main.jpg">
	<div id='cssmenu'>
	</div>
	<div id="search">
		<form method="get" id="langsearch">
			<div id="select_box" style="top: 42px;left: -150px;margin-top: -40px;">
				<label for="collang" id="langname">All</label>
					<select name="language" id="collang">
					<option value="none" >All</option>
						<c:forEach items="${langs}" var="lang">
							<c:choose>
								<c:when test="${search.language==lang.language}">
									<option value="${lang.language}" selected>${lang.language}</option>
									<script>$("#langname")[0].innerText="${lang.language}"</script>
								</c:when>
								<c:otherwise>
									<option value="${lang.language}">${lang.language}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select> 
			</div>
			<div id="select_box">
				<label for="color">제목</label>
					<select name="searchType" id="color">
						<option value="title"
							<c:if test="${search.searchType == 'title'}">selected</c:if>>제목</option>
						<option value="id"
							<c:if test="${search.searchType == 'id'}">selected</c:if>>작성자</option>
					</select> 
			</div>
			<div class="textbox">
			<label for="ex_input">검색어</label>
				<input type="text" id="ex_input" name="search" value="${search.search }" >
				<button type="submit" class="search" style="margin: 20px auto;border-radius: 4px; padding: 7px 15px; border-style: none;height: 42px; width: 60px;transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);">검색</button>
			</div>
		</form>  
	</div>
	<br />
	<div style="width: 85%; margin-left:8%;">
		<table class="mytable" style="width: 100%;margin-top:-2.5%">
			<thead>
				<tr style="height: 40px; border-bottom: 3px solid black;">
					<th>번호</th>
					<th>제목</th>
					<th>Language</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty page}">
						<c:forEach items="${page}" var="board">
							<tr style="text-align: center; height: 35px;">
								<td>${board.bno}</td>
								<td style="text-align: left;"><a href="javascript:read_page_process(${board.bno})">${board.title}</a></td>
								<td>${board.language}</td>
								<td>${board.id}</td>
								<td><fmt:formatDate value="${board.reg_date}"
										pattern="yyyy-MM-dd" /></td>
								<td>${board.hits}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr style="text-align: center; height: 35px;">
							<td colspan="6">게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<br />
		<div class="paging">
			<c:if test="${pager.numberOfRecords != 0}">
				<div style="width: 50%; margin: 0 auto; text-align: center;">
					<c:if test="${pager.currentPageNo != 1}">
						<a class="direction prev"
							href="javascript:page_locate(${pager.prevPageNo}, ${pager.maxPost})"></a>
					</c:if>
					&nbsp;
					<c:forEach var="i" begin="${pager.startPageNo}"
						end="${pager.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i != pager.currentPageNo}">
								<a class="${i}" href="javascript:page_locate(${i}, ${pager.maxPost})"> <c:out
										value="${i}"></c:out>
								</a>&nbsp;
								</c:when>
							<c:otherwise>
								<a class="${i}" href="javascript:page_locate(${i}, ${pager.maxPost})">
								<c:out 
									value="${i}"></c:out></a>
									&nbsp;
								</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pager.currentPageNo < pager.nextPageNo}">
						<a class="direction next"
							href="javascript:page_locate(${pager.nextPageNo}, ${pager.maxPost})"></a>
					</c:if>
				</div>
			</c:if>
		</div>
		<br />
		<div id="btn" style="float: left;width: 90px; height: 30px;">
			<c:choose>
				<c:when test='${session == "yes"}'>
					<a href="#" class="button" onclick="new_write()">글 작성</a>
				</c:when>
			</c:choose>
		</div>
		<div class="clear"></div>
	</div>
	<script>
		function new_write() {
			href = "/board/write?";
			href += "&currentPageNo=" + ${pager.currentPageNo}+"&maxPost=" + ${pager.maxPost};
			href += "&search=" + "${search.search}" + "&searchType="+ "${search.searchType}";
			location.href = href;
		}
		function page_locate(page, perpagenum) {
			href = "?currentPageNo=" + page + "&maxPost=" + perpagenum;
			href += "&search=" + "${search.search}" + "&searchType="
					+ "${search.searchType}";
			location.href = href;
		}
		function read_page_process(bno) {
			href = "board/read?bno=" + bno;
			href += "&currentPageNo=" + ${pager.currentPageNo}+"&maxPost=" + ${pager.maxPost};
			href += "&search=" + "${search.search}" + "&searchType="+ "${search.searchType}";
			location.href = href;
		}
		// jQuery(document).ready(function(){
		    
		var select = $("select#color");
		select.change(function(){
		    var select_name = $(this).children("option:selected").text();
		    $(this).siblings("label").text(select_name);
		});
		var langsel = $("select#collang");
		langsel.change(function(){
		    var select_name = $(this).children("option:selected").text();
			$(this).siblings("label").text(select_name);
			console.log(select_name);
			$("#langsearch").submit();
			// $.ajax({
			// 	url : "/",
			// 	type : "POST",
			// 	cache : false,
			// 	data : "language="+select_name,
			// 	success : function(response){
			// 		console.log(response);
			// 	}
			// });	
		});
		// });
		$(document).ready(function() { 
			var placeholderTarget = $('.textbox input[type="text"]'); 
			//포커스시
			placeholderTarget.on('focus', function(){ 
				$(this).siblings('label').fadeOut('fast'); 
			}); 
			//포커스아웃시
			placeholderTarget.on('focusout', function(){ 
				if($(this).val() == ''){ 
					$(this).siblings('label').fadeIn('fast'); 
					} 
				}); 
			});
		if($('.textbox input[type="text"]').val()!=''){
			$('.textbox input[type="text"]').siblings('label').fadeOut('fast'); 
		};
		var target="."+${pager.currentPageNo}
		$(target).css("color","#fff");
		$(target).css("background","#1278ed");
		$(target).css("border","#1px solid #4c8500");

	</script>
</body>
</html>