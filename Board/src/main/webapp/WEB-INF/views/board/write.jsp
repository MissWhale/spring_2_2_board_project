<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
	<head>
		<title>코드 공유 게시판 : 작성</title>
		<link rel="stylesheet" href="/resources/design.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/resources/read.css" type="text/css" media="screen" />
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
			<div id="selwrite_box" >
				<label for="theme" >idle Fingers</label>
				<select name="theme" id="theme">
					<option value="ace/theme/chrome">Chrome</option>
					<option value="ace/theme/clouds">Clouds</option>
					<option value="ace/theme/crimson_editor">Crimson Editor</option>
					<option value="ace/theme/dawn">Dawn</option>
					<option value="ace/theme/dreamweaver">Dreamweaver</option>
					<option value="ace/theme/eclipse">Eclipse</option>
					<option value="ace/theme/github">GitHub</option>
					<option value="ace/theme/iplastic">IPlastic</option>
					<option value="ace/theme/solarized_light">Solarized Light</option>
					<option value="ace/theme/textmate">TextMate</option>
					<option value="ace/theme/tomorrow">Tomorrow</option>
					<option value="ace/theme/xcode">XCode</option>
					<option value="ace/theme/kuroir">Kuroir</option>
					<option value="ace/theme/katzenmilch">KatzenMilch</option>
					<option value="ace/theme/sqlserver">SQL Server</option>
					<option value="ace/theme/ambiance">Ambiance</option>
					<option value="ace/theme/chaos">Chaos</option>
					<option value="ace/theme/clouds_midnight">Clouds Midnight</option>
					<option value="ace/theme/dracula">Dracula</option>
					<option value="ace/theme/cobalt">Cobalt</option>
					<option value="ace/theme/gruvbox">Gruvbox</option>
					<option value="ace/theme/gob">Green on Black</option>
					<option value="ace/theme/idle_fingers">idle Fingers</option>
					<option value="ace/theme/kr_theme">krTheme</option>
					<option value="ace/theme/merbivore">Merbivore</option>
					<option value="ace/theme/merbivore_soft">Merbivore Soft</option>
					<option value="ace/theme/mono_industrial">Mono Industrial</option>
					<option value="ace/theme/monokai">Monokai</option>
					<option value="ace/theme/pastel_on_dark">Pastel on dark</option>
					<option value="ace/theme/solarized_dark">Solarized Dark</option>
					<option value="ace/theme/terminal">Terminal</option>
					<option value="ace/theme/tomorrow_night">Tomorrow Night</option>
					<option value="ace/theme/tomorrow_night_blue">Tomorrow Night Blue</option>
					<option value="ace/theme/tomorrow_night_bright">Tomorrow Night Bright</option>
					<option value="ace/theme/tomorrow_night_eighties">Tomorrow Night 80s</option>
					<option value="ace/theme/twilight">Twilight</option>
					<option value="ace/theme/vibrant_ink">Vibrant Ink</option>
				</select> 
			</div>
			<div style="margin-left:8%; width:90%;">
				<div class="in_block">
					<input type="text" name="title" style="height: 30px;" placeholder="제목">
				</div>		
				<div style="margin-top: 20px;" >
					<textarea name="body" id="writebody" style="height:200px;" placeholder="내용"></textarea>
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
			var select1 = $("select#theme");
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
			select1.change(function(){
				var select_name = $(this).children("option:selected").text();
				editor.setTheme($(this).children("option:selected")[0].value);
				$(this).siblings("label").text(select_name);
			});	
		</script>
	</body>
</html>