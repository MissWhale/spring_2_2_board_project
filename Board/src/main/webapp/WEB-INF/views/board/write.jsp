<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
	<head>
		<title>코드 공유 게시판 : 작성</title>
		<link rel="stylesheet" href="/resources/design.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/resources/read.css" type="text/css" media="screen" />
		<!-- <link rel="stylesheet" href="/resources/prism.css" type="text/css" media="screen" /> -->
		<script src="/resources/autosize.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.9/ace.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.1/ext-language_tools.js"></script>
		<style>
			form > .in_block {text-align:left;}
			input[type="button"] {width:70px;height:35px;}
			input[type="submit"] {width:70px;height:35px;}
		</style>
	</head>
	<body onload="init();">
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
		<div id='cssmenu' style="height: 40px;position: relative;top: 30px;"></div>
		<form method="post" id="write">
			<div id="select_box" class="selbox">
				<label for="color" style="top:10px">C</label>
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
						<option value="12">AutoHotkey</option>
					</select> 
			</div>
			<div style="margin-left:8%; width:90%;">
				<div class="in_block">
					<input type="text" name="title" style="height: 30px;">
				</div>		
				<div style="margin-top: 20px;" >
					<textarea name="body" id="writebody" style="height:200px;" ></textarea>
					<textarea name="code" data-editor="sql"  id="writecode" data-gutter="1" rows="15" ></textarea>
				</div>
				<div id="wrbtn">		
					<button type="button" onclick='checking_form()'>완료</button>
					<button type="button" onclick='back()'>취소</button>
				</div>
				<br />
			</div>
		</form>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script>
			function init(){
				if("${session}"!='yes'){
					alert("비정상적 접근입니다");
					location.href="/";
				}
			};
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
			autosize(document.querySelectorAll('#writebody'));
			function back() {
				href = "/?currentPageNo=" + ${cri.currentPageNo} + "&maxPost=" + ${cri.maxPost};
				href += "&search=" + "${search.search}" + "&searchType=" + "${search.searchType}";
				location.href = href;
			}
			function checking_form() {
				var form = document.forms[0];
				var title=form.title.value;
				form.code.value=editor.getValue();
				var code=form.code.value;
				if(title == ""){
					alert('제목을 적어주세요');
					return false;
				}else if(title.length >50){
					alert("제목은 최대 50글자까지 가능합니다")
					return false;
				}
				if(code == ""){
					alert('내용을 채워주세요');
					return false;
				}
				write.submit();
			}
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
				else if(select_name=="AutoHotkey") editor.getSession().setMode("ace/mode/autohotkey");
		        	$(this).siblings("label").text(select_name);
			});
			$(function() {
				$('textarea[data-editor]').each(function() {
					textarea.css('display', 'none');
					editor.renderer.setShowGutter(textarea.data('gutter'));
					editor.getSession().setValue(textarea.val());
					editor.getSession().setMode("ace/mode/c_cpp");
					editor.setOptions({
						fontSize: "16pt",
						enableBasicAutocompletion: true,
						enableSnippets: true,
						enableLiveAutocompletion: true
					});
					editor.setTheme("ace/theme/idle_fingers");
					textarea.closest('form').submit(function() {
					textarea.val(editor.getSession().getValue());
					})
				});
			});
		</script>
	</body>
</html>