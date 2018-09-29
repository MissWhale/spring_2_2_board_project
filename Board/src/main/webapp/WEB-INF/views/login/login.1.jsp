<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="stylesheet" href="/resources/login.css" type="text/css"media="screen" />
<body>
	<div style="margin-top: -16px;">
			<div>
				<p style="width: 8%; text-align: left; font-size: 20px; margin-left: 8%; margin-bottom: 10px; float: left">웹 코드 에디터</p>
			</div>
			<div id="top" style="float: right; margin-top: 21px; margin-right: 132px;">
				<c:choose>
					<c:when test='${session == "yes"}'>
						<a href="/logout" class="button">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="/login/login" class="button">로그인</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
			<img src="/resources/main.jpg" style="height: 400px; width: 85%; margin-left: 8%; margin-right: 8%;">
		<div>
		<div id='cssmenu'>
				<ul>
				   <li class='active'><a href='#'><span>공지사항</span></a></li>
				   <li><a href='#'><span>코드게시판</span></a></li>
				</ul>
		</div>
		<div class="form">
			<ul class="tab-group">
				<li class="tab active">
					<a href="#login">로그인</a>
				</li>
				<li class="tab">
					<a id="regi" href="#signup">회원가입</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="login">
					<h1>Login!!</h1>
					<form action="/login" method="post">
						<div class="field-wrap">
							<label>아이디
									<span class="req">*</span>
							</label>
							<input type="text" name="username" autocomplete="off" />
						</div>
						<div class="field-wrap">
							<label>비밀번호
								<span class="req">*</span>
							</label>
							<input type="password" name="password" autocomplete="off" />
						</div>
						<button class="button button-block">로그인</button>
						<button class="button button-block" style="margin-top: 15px;">아이디/비밀번호 찾기</button>
					</form>
				</div>
				<div id="signup">
					<h1 id="status">Sign Up!!</h1>
					<form action="/register" method="post">
						<div class="top-row">
							<div class="field-wrap">
								<label>아이디
									<span class="req">*</span>
								</label>
								<input type="text" name="username" autocomplete="off" />
							</div>
							<div class="field-wrap"></div>
						</div>
						<div class="field-wrap">
							<label>이메일
								<span class="req">*</span>
							</label>
							<input type="text" name="email" autocomplete="off" />
						</div>
						<div class="field-wrap">
								<label>비밀번호
									<span class="req">*</span>
								</label>
								<input type="password" name="password" autocomplete="off" />
						</div>
						<div class="field-wrap">
								<label>비밀번호 확인
									<span class="req">*</span>
								</label>
								<input type="password" name="passwordok" autocomplete="off" />
						</div>
						<div class="field-wrap">
								<label>이름
									<span class="req">*</span>
								</label>
								<input type="text" name="nick" autocomplete="off" />
						</div>
						<button type="submit" class="button button-block">회원가입</button>
					</form>
				</div>
			</div>
		</div>
		</div>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
		function check() {
			var result = '<c:out value="${check}"></c:out>';
			if(result == 'no')
				alert("아이디나 패스워드가 틀립니다.");			
		}
		check();
		var stat=$('#status')["0"].innerHTML
       		if (stat=="아이디중복"){
            	$('#regi').trigger("click");
		}
		$('.form').find('input, textarea').on('keyup blur focus', function (e) {
			
			var $this = $(this),
				label = $this.prev('label');
		
				if (e.type === 'keyup') {
					if ($this.val() === '') {
					label.removeClass('active highlight');
				} else {
					label.addClass('active highlight');
				}
			} else if (e.type === 'blur') {
				if( $this.val() === '' ) {
					label.removeClass('active highlight'); 
					} else {
					label.removeClass('highlight');   
					}   
			} else if (e.type === 'focus') {
				
				if( $this.val() === '' ) {
					label.removeClass('highlight'); 
					} 
				else if( $this.val() !== '' ) {
					label.addClass('highlight');
					}
			}
		
		});
  
		$('.tab a').on('click', function (e) {
			e.preventDefault();
			
			$(this).parent().addClass('active');
			$(this).parent().siblings().removeClass('active');
			
			target = $(this).attr('href');
		
			$('.tab-content > div').not(target).hide();
			
			$(target).fadeIn(600);
			
		});	
	</script>         
</body>

</html>


