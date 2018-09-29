<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
	<head>
		<title>글 읽기</title>
		<link rel="stylesheet" href="/resources/design.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/resources/read.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/resources/prism.css" type="text/css" media="screen" />
		<!-- <script src="/resources/highlight.pack.js"></script> -->
		<!-- <link rel="stylesheet" href="/resources/rainbow.css" type="text/css"> -->
		<!-- <link rel="stylesheet" href="/resources/codemirror/codemirror/lib/neo.css" type="text/css" media="screen" /> - -->
		<!-- <script>hljs.configure({useBR: true});hljs.initHighlightingOnLoad();</script> -->
		<!-- <link rel="stylesheet" href="/resources/codemirror.css">
		<script src="/resources/codemirror/codemirror/mode/clike/clike.js" type="text/javascript"></script>
		<script src="http://codemirror.net/lib/codemirror.js"></script>
		<script src="http://codemirror.net/addon/edit/matchbrackets.js"></script>
		<script src="https://codemirror.net/mode/css/css.js"></script>
		<!-- <script src="http://codemirror.net/addon/edit/continuecomment.js"></script> -->
		<!-- <script src="http://codemirror.net/mode/javascript/javascript.js"></script> -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.9/ace.js"></script>
		<script src="ace/ext-language_tools.js"></script>
		<style>
			form > .in_block {text-align:left;}
			/* span {position:relative;top:-270px;} */
			input[type="button"] {width:70px;height:35px;}
			input[type="submit"] {width:70px;height:35px;}
		</style>
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
		<form method="post" id="write">
			<!-- <input type="checkbox" name="chk_info" style="width: auto;margin-left: 150px;margin-top: 60px;" onclick="check(this)">자동인식 -->
			<div id="select_box" class="selbox">
				<label for="color" style="top:6px">C</label>
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
				<div class="in_block">
					<input type="text" name="title" style="height: 30px;">
				</div>		
				<!-- <div class="in_block">
					<label>${post.title}</label>
				</div> -->
				<div style="margin-top: 20px;" >
					<textarea name="body" data-editor="sql"  id="writetext" data-gutter="1" rows="15" ></textarea>
					<!-- <textarea rows="20" class="codemirror" name="body" style="margin-top: 20px;"></textarea> -->
				</div>
				<!-- javascript css csharp java python json c_cpp sql-->
				<div id="wrbtn">		
					<button type="button" onclick='checking_form()'>완료</button>
					<button type="button" onclick='back()'>취소</button>
				</div>
				<br />
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
			// function check(box){
			// 	if(box.checked == true){
			// 		// console.log("체크");
			// 		$('#color').attr('disabled', true);
			// 	}else{
			// 		// console.log("해제");
			// 		$('#color').attr('disabled', false);
			// 	}
			// }
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
				console.log(form.body.value);
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
				//  javascript css  java json  sql
		        	$(this).siblings("label").text(select_name);
			});
			$(function() {
				$('textarea[data-editor]').each(function() {
					textarea.css('display', 'none');
					editor.renderer.setShowGutter(textarea.data('gutter'));
					editor.getSession().setValue(textarea.val());
					editor.getSession().setMode("ace/mode/c_cpp");
					// editor.setTheme("ace/theme/idle_fingers");
					editor.setOptions({
						fontSize: "16pt",
						// theme:"ace/theme/iPlastic"
						// height:"500px",
						// width:"1617.63px"
					});
					editor.setTheme("ace/theme/idle_fingers");
					console.log(textarea.prev());
					// textarea.prev().css("width","1617.63px");
					// textarea.prev().css("min-height","600px");
					// textarea.prev().css("max-height","1000px");
					// copy back to textarea on form submit...
					textarea.closest('form').submit(function() {
					textarea.val(editor.getSession().getValue());
					})
				});
			});
		</script>
	</body>
</html>