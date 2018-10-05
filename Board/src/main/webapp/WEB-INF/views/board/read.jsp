<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
	<head>
		<title>코드 공유 게시판 : 게시글</title>
		<link rel="stylesheet" href="/resources/design.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/resources/read.css" type="text/css" media="screen" />
		<script src="/resources/autosize.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.9/ace.js"></script>
		<script src="//code.jquery.com/jquery.min.js"></script>
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
		<div id='cssmenu' style="height: 40px;position: relative;top: 30px;"></div>
		<form style="margin-top:50px" >
			<div style="margin-left:8%; width:90%;">
				<div style="clear:both;"></div>			
				<div class="in_block">
					<label style="font-size: 20px;">${post.title}</label>
					<label style="margin-left: 20px;margin-right: 20px;">|</label>
					<c:choose>
							<c:when test="${post.language == '1'}">
								<label>C</label>
							</c:when>
							<c:when test="${post.language == '2'}">
								<label>C++</label>
							</c:when>
							<c:when test="${post.language == '3'}">
								<label>C#</label>
							</c:when>
							<c:when test="${post.language == '4'}">
								<label>Python</label>
							</c:when>
							<c:when test="${post.language == '5'}">
								<label>JAVA</label>
							</c:when>
							<c:when test="${post.language == '6'}">
								<label>CSS</label>
							</c:when>
							<c:when test="${post.language == '7'}">
								<label>HTML</label>
							</c:when>
							<c:when test="${post.language == '8'}">
								<label>JSON</label>
							</c:when>
							<c:when test="${post.language == '9'}">
								<label>JavaScript</label>
							</c:when>
							<c:when test="${post.language == '10'}">
								<label>PHP</label>
							</c:when>
							<c:when test="${post.language == '11'}">
								<label>SQL</label>
							</c:when>
							<c:when test="${post.language == '12'}">
								<label>AutoHotkey</label>
							</c:when>
					</c:choose>
					<div id="reghit">
						<label><fmt:formatDate value="${post.reg_date}" pattern="yyyy-MM-dd" /></label>
						<label style="margin-left: 20px;margin-right: 20px">|</label>
						<label >${post.hits}</label>
					</div>
				</div>
				<hr />
				<div class="in_block">
					<label>${post.id}</label>
				</div>
				<div style="margin-top: 20px;">
					<c:choose>
							<c:when test="${post.body != null }">
									<textarea name="body" id="writebody" style="height:200px;" readonly ><c:out value="${post.body}"></c:out></textarea>
							</c:when>
					</c:choose>
					<textarea name="code" data-editor="sql"  id="input" data-gutter="1" rows="15"><c:out value="${post.code}"></c:out></textarea>
				</div>
				<br />
			</div>
		</form>
		<div>
			<c:choose>
				<c:when test="${!empty comment}">
					<c:forEach items="${comment }" var="comment">
						<div id="comment">
							<textarea class="comme" readonly autocomplete="off" style="background: #FEFAE2;">${comment.com_cont}</textarea>
							<c:choose>
								<c:when test="${comment.com_code  != null}">
									<textarea class="comme" id="${comment.com_no}"   data-editor="sql"  data-gutter="1" readonly autocomplete="off" style="margin-top: 0px;">${comment.com_code}</textarea>
									<script>
									var textcode = $('#${comment.com_no}').hide();
									var editDiv1 = $('<div>', {
									// position: 'absolute',
									width: textcode.width(),
									height: textcode.height(),
									'class': textcode.attr('class'),
									}).insertBefore(textcode);
									editDiv1.css("margin-left","20px");
									var editor1 = ace.edit(editDiv1[0]);
									editor1.session.setValue(textcode.val());
									if(${post.language}==1) editor1.getSession().setMode("ace/mode/c_cpp");
									else if(${post.language}==2) editor1.getSession().setMode("ace/mode/c_cpp");
									else if(${post.language}==3) editor1.getSession().setMode("ace/mode/csharp");
									else if(${post.language}==4) editor1.getSession().setMode("ace/mode/python");
									else if(${post.language}==5) editor1.getSession().setMode("ace/mode/java");
									else if(${post.language}==6) editor1.getSession().setMode("ace/mode/css");
									else if(${post.language}==7) editor1.getSession().setMode("ace/mode/html");
									else if(${post.language}==8) editor1.getSession().setMode("ace/mode/json");
									else if(${post.language}==9) editor1.getSession().setMode("ace/mode/javascript");
									else if(${post.language}==10) editor1.getSession().setMode("ace/mode/php");
									else if(${post.language}==11) editor1.getSession().setMode("ace/mode/sql");
									else if(${post.language}==12) editor1.getSession().setMode("ace/mode/autohotkey");
									</script>
								</c:when>
							</c:choose>	
							<label>${comment.id}</label>
							<c:choose>
								<c:when test="${id==comment.id}">
									<button  id="comment_modify" value="${comment.com_no}">수정</button>
									<button  id="comment_delete" value="${comment.com_no}">삭제</button>
								</c:when>
							</c:choose>
						</div>				
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div id="nocomment">
						<label>댓글이 없습니다.</label>
					</div>					
				</c:otherwise>
			</c:choose>		
		</div>
		<div id="commentin">
			<c:choose>
				<c:when test='${session == "yes"}'>
					<!-- <input type="text" id="new_comment" autocomplete="off"> -->
					<textarea id="new_comment" autocomplete="off" placeholder="내용"  ></textarea>
					<textarea id="new_comcode" autocomplete="off" placeholder="코드" ></textarea>
					<button type="button"  id="comment_add">댓글 달기</button>
				</c:when>
			</c:choose>
		</div>
		<div id="btnlist">
			<c:choose>
				<c:when	test="${id == post.id}">
					<button type="button" onclick='alter()'>수정</button>
					<button type="button" onclick='del_post(<c:out value="${post.bno}"></c:out>)'>삭제</button>	
				</c:when>
			</c:choose>	
			<button type="button" onclick='back()'>목록</button>
		</div>
		<script>
			var textarea = $('#input');
			var mode = textarea.data('editor');
			var editDiv = $('<div>', {
			position: 'absolute',
			width: textarea.width(),
			height: textarea.height(),
			'class': textarea.attr('class')
			}).insertBefore(textarea);
			var editor = ace.edit(editDiv[0]);
			// console.log(editor);
			autosize(document.querySelectorAll('#new_comment'));
			autosize(document.querySelectorAll('#new_comcode'));
			autosize(document.querySelectorAll('#writebody'));
			autosize(document.querySelectorAll('.comme'));
			autosize(document.querySelectorAll('.comment'));
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
					else if(${post.language}=="12") editor.getSession().setMode("ace/mode/autohotkey");
					editor.setOptions({
						fontSize: "16pt",
					});
					editor.setTheme("ace/theme/idle_fingers");
					editor.setReadOnly(true);
					textarea.closest('form').submit(function() {
					textarea.val(editor.getSession().getValue());
					})
				});
			});

			function del_post(no) {
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post");
				form.setAttribute("action", "delete");

				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "bno");
				hiddenField.setAttribute("value", no);
				form.appendChild(hiddenField);
				
				document.body.appendChild(form);
				
				form.submit();
			}
			
			function back() {
				href = "/?currentPageNo=" + ${cri.currentPageNo} + "&maxPost=" + ${cri.maxPost};
				href += "&search=" + "${search.search}" + "&searchType=" + "${search.searchType}";
				location.href = href;
			}
			
			function alter() {
				href = "modify?bno=" + ${post.bno};
				href += "&currentPageNo=" + ${cri.currentPageNo} + "&maxPost=" + ${cri.maxPost};
				href += "&search=" + "${search.search}" + "&searchType=" + "${search.searchType}";
				location.href = href;
			}
			
			$("#comment_add").click(function(){
				if($("#new_comment").val() == ""){
					alert('댓글 내용을 입력하세요.');
					return false;
				}
			    $.ajax({
			        url : "/commentInput",
			        type : "POST",
			        cache : false,
			        data : "bno=" + ${post.bno} + "&com_cont=" +encodeURIComponent($("#new_comment").val())+"&com_code=" +encodeURIComponent($("#new_comcode").val()),
			        success : function(response){
			        	if(response.result == 1)
						location.reload();
			        }
			    });
			});
			$(document).on("click","button[id='comment_delete']", function(){
				var no = $(this).val();
			    $.ajax({
			        url : "/commentDelete",
			        type : "POST",
			        cache : false,
			        data : "com_no=" + no,
			        success : function(response){
			        	if(response.result == 1){
							$("#new_comment").val() == ""
							location.reload();
						}
			        }
			    });
			});
			var check = false;
			$(document).on("click","button[id='comment_modify']", function(){
				$(this).next().hide();
				$(this).html("수정완료");
				$(this).css("width","100px");
				$(this).prev().prev().css("border", "1px solid black").attr("readonly",false);
				$(this).attr('id', "comment_modify_ok");
				if(check == false)
				{
					$(this).bind('click', function(){
						var no = $(this).val();
						var post = $(this).prev().prev().val();
						if(post == ""){
							alert('댓글 내용을 입력하세요.');
							return false;
						}
					    $.ajax({
					        url : "/commentModify",
					        type : "POST",
					        cache : false,
					        data : "com_no=" + no + "&com_cont=" + post,
					        success : function(response){
					        	if(response.result == 1){
									$("#new_comment").val() == ""
									location.reload();
								}
					        }
					    });					
					});
				}
				check = true;
			});	
		</script>
	</body>
</html>
