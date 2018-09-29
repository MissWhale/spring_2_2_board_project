<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
	<head>
		<title>글 읽기</title>
		<link rel="stylesheet" href="/resources/design.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/resources/read.css" type="text/css" media="screen" />
		<style>
			form > .in_block {text-align:left;}
			input[type="button"] {width:70px;height:35px;}
			input[type="submit"] {width:70px;height:35px;}
		</style>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.9/ace.js"></script>
		<!-- <script src="ace/ext-language_tools.js"></script> -->
	</head>
	<body>
		<div>
			<div id="top">
				<a href="/" id="logo">웹 코드 에디터</a>
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
		<div id='cssmenu' style="height: 40px;position: relative;top: 60px;"></div>
		<form method="post" onsubmit="return checking_form()" id="write">
			<div id="select_box" class="selbox">
				<c:choose>
					<c:when test="${post.language == '1'}">
						<label for="color" style="top:6px">C</label>
					</c:when>
					<c:when test="${post.language == '2'}">
						<label for="color" style="top:6px">C++</label>
					</c:when>
					<c:when test="${post.language == '3'}">
						<label for="color" style="top:6px">C#</label>
					</c:when>
					<c:when test="${post.language == '4'}">
						<label for="color" style="top:6px">Python</label>
					</c:when>
					<c:when test="${post.language == '5'}">
						<label for="color" style="top:6px">JAVA</label>
					</c:when>
					<c:when test="${post.language == '6'}">
						<label for="color" style="top:6px">CSS</label>
					</c:when>
					<c:when test="${post.language == '7'}">
						<label for="color" style="top:6px">HTML</label>
					</c:when>
					<c:when test="${post.language == '8'}">
						<label for="color" style="top:6px">JSON</label>
					</c:when>
					<c:when test="${post.language == '9'}">
						<label for="color" style="top:6px">JavaScript</label>
					</c:when>
					<c:when test="${post.language == '10'}">
						<label for="color" style="top:6px">PHP</label>
					</c:when>
					<c:when test="${post.language == '11'}">
						<label for="color" style="top:6px">SQL</label>
					</c:when>
				</c:choose>
					<select name="language" id="color" style="min-height: 30px;height:30px">
						<option value="1">C</option>
						<option value="2">C++</option>
						<option value="3">C#</option>
						<option value="4">Python</option>
						<option value="5">JAVA</option>
						<option value="6">CSS</option>
						<option value="7">HTML</option>
						<option value="8">JSON</option>
						<option value="9">JavaScript</option>
						<option value="10">PHP</option>
						<option value="11">SQL</option>
					</select> 
			</div>
			<div style="margin-left:8%; width:90%;">
				<input type="hidden" value="${post.bno}" name="bno">
				<div class="in_block">
					<input type="text" name="title" style="height: 30px;" value="<c:out value="${post.title}"></c:out>" name="title">
					<!-- <input type="text" style="width:90%;" value="<c:out value="${post.title}"></c:out>" name="title"> -->
				</div>
				<div style="margin-top: 20px;">
					<!-- <textarea rows="20" name="body" style="margin-top: 20px;"><c:out value="${post.body}"></c:out></textarea> -->
					<textarea name="body" data-editor="sql"  id="input" data-gutter="1" rows="15" ><c:out value="${post.body}"></c:out></textarea>
					<!-- <textarea rows="20" style="width:90%;" name="body"><c:out value="${post.body}"></c:out></textarea> -->
				</div>
				<div id="wrbtn">		
					<button type="button" onclick="checking_form()">완료</button>
					<button type="button" onclick='back()'>취소</button>
				</div>
				<!-- <div style="float:right; position:relative; left:-6%;">		
					<input type="submit" value="완료">
					&nbsp;&nbsp;&nbsp;			
					<input type="button" value="취소" onclick='back()'>
				</div> -->
			</div>
		</form>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script>
			var select = $("select#color");
			var textarea = $('textarea[data-editor]');
			var mode = textarea.data('editor');
			var editDiv = $('<div>', {
			position: 'absolute',
			width: textarea.width()+6,
			height: textarea.height(),
			'class': textarea.attr('class')
			}).insertBefore(textarea);
			var editor = ace.edit(editDiv[0]);

			select.change(function(){
				var select_name = $(this).children("option:selected").text();
				if(select_name=="C" || select_name=="C++" ) editor.getSession().setMode("ace/mode/c_cpp");
				else if(select_name=="C#") editor.getSession().setMode("ace/mode/csharp");
				else if(select_name=="Python") editor.getSession().setMode("ace/mode/python");
				else if(select_name=="JAVA") editor.getSession().setMode("ace/mode/java");
				else if(select_name=="CSS") editor.getSession().setMode("ace/mode/css");
				else if(select_name=="HTML") editor.getSession().setMode("ace/mode/html");
				else if(select_name=="JSON") editor.getSession().setMode("ace/mode/json");
				else if(select_name=="JavaScript") editor.getSession().setMode("ace/mode/javascript");
				else if(select_name=="PHP") editor.getSession().setMode("ace/mode/php");
				else if(select_name=="SQL") editor.getSession().setMode("ace/mode/sql");
				$(this).siblings("label").text(select_name);
			});
			$(function() {
				$('textarea[data-editor]').each(function() {
					textarea.css('display', 'none');
					editor.renderer.setShowGutter(textarea.data('gutter'));
					editor.getSession().setValue(textarea.val());
					if(${post.language}=="1") editor.getSession().setMode("ace/mode/c_cpp");
					else if(${post.language}=="2") editor.getSession().setMode("ace/mode/c_cpp");
					else if(${post.language}=="3") editor.getSession().setMode("ace/mode/csharp");
					else if(${post.language}=="4") editor.getSession().setMode("ace/mode/python");
					else if(${post.language}=="5") editor.getSession().setMode("ace/mode/java");
					else if(${post.language}=="6") editor.getSession().setMode("ace/mode/css");
					else if(${post.language}=="7") editor.getSession().setMode("ace/mode/html");
					else if(${post.language}=="8") editor.getSession().setMode("ace/mode/json");
					else if(${post.language}=="9") editor.getSession().setMode("ace/mode/javascript");
					else if(${post.language}=="10") editor.getSession().setMode("ace/mode/php");
					else if(${post.language}=="11") editor.getSession().setMode("ace/mode/sql");
					editor.setTheme("ace/theme/idle_fingers");
					editor.setOptions({
						fontSize: "16pt",
					});
					editor.setTheme("ace/theme/idle_fingers");
					console.log(textarea.prev());
					// textarea.prev().css("width","1603.63px");
					// textarea.prev().css("min-height","600px");
					// textarea.prev().css("max-height","1000px");
					// copy back to textarea on form submit...
					textarea.closest('form').submit(function() {
					textarea.val(editor.getSession().getValue());
					})
				});
			});
			function back() {
				href = "/?currentPageNo=" + ${cri.currentPageNo} + "&maxPost=" + ${cri.maxPost};
				href += "&search=" + "${search.search}" + "&searchType=" + "${search.searchType}";
				location.href = href;
			}
			function checking_form() {
				var form = document.forms[0];
				var title=form.title.value;
				var body=form.body.value;
				if(title == ""){
					alert('제목을 적어주세요');
					return false;
				}else if(title.length >50){
					alert("제목은 최대 50글자까지 가능합니다")
					return false;
				}
				if(body == ""){
					alert('내용을 채워주세요');
					return false;
				}
				form.body.value=editor.getValue();
				form.submit();
			}			
		</script>
	</body>
</html>
