<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>코드 공유 게시판 : 로그인</title>
</head>
<link rel="stylesheet" href="/resources/login.css" type="text/css"media="screen" />
<link rel="stylesheet" href="/resources/design.css" type="text/css"media="screen" />
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
	<img id="main" src="/resources/main.jpg">
	<div>
		<div id='cssmenu' style="height: 40px;">
		</div>
		<div class="form">
			<ul class="tab-group">
				<li class="tab active">
					<a id="logi" href="#login" style="width:27%">로그인</a>
				</li>
				<li class="tab">
					<a id="regi" href="#signup" style="width:27%">회원가입</a>
				</li>
				<li class="tab">
					<a id="regi" href="#forgot" style="width:31%">ID/PASSWORD 찾기</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="login">
					<h1>Login!!</h1>
					<form action="/login/login" method="post" id="loginfrm">
						<div class="field-wrap">
							<label>아이디
									<span class="req">*</span>
							</label>
							<input type="text" id="loginid"name="id" autocomplete="off" style="ime-mode:disabled" onkeyup="trim(this);"/>
						</div>
						<div class="field-wrap">
							<label>비밀번호
								<span class="req">*</span>
							</label>
							<input type="password" id="loginpw" name="pw" autocomplete="off" style="ime-mode:disabled" onkeyup="trim(this);"/>
						</div>
						<button type="button" id="loginbtn" class="button button-block">로그인</button>
					</form>
				</div>
				<div id="signup" style="display: none;">
					<h1 id="status">Sign Up!!</h1>
					<form action="/login/register" method="post" id="regifrm">
						<div class="top-row">
							<div class="field-wrap">
								<label id="idlbl">아이디
									<span class="req">*</span>
								</label>
								<input type="text" id="idcheck" name="id" autocomplete="off" style="width:440px;ime-mode:disabled" onkeyup="trim(this);">
								<button type="button" class="button button-block" id="idck" style="float:right;width:150px;margin-top:-40px;height:40px;padding:0px;font-size:15px;">아이디 확인</button>
							</div>
							<div class="field-wrap"></div>
						</div>
						<div class="field-wrap">
							<label id="emaillbl">이메일
								<span class="req">*</span>
							</label>
							<input type="text" id="emailcheck" name="email" autocomplete="off" style="width:440px;ime-mode:disabled" onkeyup="trim(this);">
							<button type="button" class="button button-block" id="emailck" style="float:right;width:150px;margin-top:-40px;height:40px;padding:0px;font-size:15px;">이메일 확인</button>
						</div>
						<div class="field-wrap">
								<label>비밀번호
									<span class="req">*</span>
								</label>
								<input type="password" id="regipw" name="pw" autocomplete="off" style="ime-mode:disabled" onkeyup="trim(this);"/>
						</div>
						<div class="field-wrap">
								<label>비밀번호 확인
									<span class="req">*</span>
								</label>
								<input type="password" id="regipwok" name="pwok" autocomplete="off" style="ime-mode:disabled" onkeyup="trim(this);"/>
						</div>
						<div class="field-wrap">
								<label>이름
									<span class="req">*</span>
								</label>
								<input type="text" id="reginame" name="name" autocomplete="off" style="ime-mode:desativated" onkeyup="trim(this);"/>
						</div>
						<button type="button" id="registerbtn" class="button button-block">회원가입</button>
					</form>
				</div>
				<div id="forgot">
					<h1>ID찾기</h1>
					<form action="/login/login" method="post" id="idfrm">
						<div class="field-wrap">
							<label >이름
									<span class="req">*</span>
							</label>
							<input type="text" id="findname" name="id" autocomplete="off" onkeyup="trim(this);"/>
						</div>
						<div class="field-wrap">
							<label>이메일
								<span class="req">*</span>
							</label>
							<input type="text" id="findemail" name="pw" autocomplete="off" style="ime-mode:disabled" onkeyup="trim(this);"/>
						</div>
						<button type="button" id="idfind" class="button button-block">아이디찾기</button>
					</form>
					<h1>PASSWORD찾기</h1>
					<form action="/login/login" method="post" id="pwfrm">
						<div class="field-wrap">
							<label>이름
									<span class="req">*</span>
							</label>
							<input type="text" name="id" id="pwfindname" autocomplete="off" onkeyup="trim(this);"/>
						</div>
						<div class="field-wrap">
							<label>아이디
								<span class="req">*</span>
							</label>
							<input type="text" name="pw" id="pwfindid" autocomplete="off" style="ime-mode:disabled" onkeyup="trim(this);"/>
						</div>
						<div class="field-wrap">
							<label>이메일
								<span class="req">*</span>
							</label>
							<input type="text" name="pw" id="pwfindemail" autocomplete="off" style="ime-mode:disabled" onkeyup="trim(this);"/>
						</div>
						<button type="button" id="pwfind" class="button button-block">비밀번호찾기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
		var idsave=null;
		var emailsave=null;
		var ic="false";
		var ec="false";
		function success() {
			var result = '<c:out value="${success}"></c:out>';
			if(result == 'success')
				alert("회원가입에 성공하셧습니다.");	
		}
		function check() {
			var result = '<c:out value="${check}"></c:out>';
			if(result == 'no'){
				alert("아이디나 패스워드가 틀립니다.");	
			}
		}
		function init() {
			check();
			success();
		}
		function trim(obj){ //공백제거
			var a = $(obj).val().replace(/ /gi, '');
			$(obj).val(a);
    		}
		$("#loginbtn").click(function(){ //로그인
			if($('#loginid').val()==''){
				alert("아이디를 입력하세요.");
			}else if($('#loginpw').val()==''){
				alert("비밀번호를 입력하세요.");
			}else{
				$('#loginfrm').submit();
			}
		});
		$("#registerbtn").click(function(){ //회원가입
			if($('#idcheck').val()==''){
				alert("아이디를 입력하세요.");
			}else if($('#emailcheck').val()==''){
				alert("이메일을 입력하세요.");
			}else if($('#regipw').val()==''){
				alert("비밀번호를 입력하세요.");
			}else if($('#regipwok').val()==''){
				alert("비밀번호확인을 입력하세요.");
			}else if($('#reginame').val()==''){
				alert("이름을 입력하세요.");
			}else if($('#regipw').val().length>20 || $('#regipw').val().length<4){
				alert("비밀번호는 최소4자 최대20자까지 가능합니다.");
			}else if($('#regipw').val()!=$('#regipwok').val()){
				alert("비밀번호가 일치하지 않습니다.");
			}else if(idsave!=$('#idcheck').val()){
				alert("아이디중복을 다시 확인 해주세요.");
				$('#idck').attr('disabled', false);
				$('#idck').css("background-color","#3f8be9");
				$('#idcheck').css("border-color","red");
				$("#idlbl")[0].innerText="아이디중복을 다시 확인 해주세요.";
				ic="true";
			}else if(emailsave!=$('#emailcheck').val()){
				alert("이메일중복을 다시 확인 해주세요.");
				$('#emailck').attr('disabled', false);
				$('#emailck').css("background-color","#3f8be9");
				$('#emailcheck').css("border-color","red");
				$("#emaillbl")[0].innerText="이메일중복을 다시 확인 해주세요.";
				ec="true";
			}else{
				$('#regifrm').submit();
				// alert("성공");
			}
		});
		$("#idck").click(function(){ //아이디중복
			var text = $("#idcheck").val();
			var regexp = /[0-9a-zA-Z;\-]/; // 숫자,영문,특수문자
			// var regexp = /[0-9]/; // 숫자만
			// var regexp = /[a-zA-Z]/; // 영문만
			if(text.length>10 || text.length<4){
				alert("아이디는 최소4자 최대10자까지 가능합니다.");
				$('#idck').css("background-color","#3f8be9");
				return;
			}for( var i=0; i<text.length; i++){
				if(text.charAt(i) != " " && regexp.test(text.charAt(i)) == false ){
					alert("특수문자는 입력할 수 없습니다.");
					$('#idck').css("background-color","#3f8be9");
					return;
			}}
			$.ajax({
			    url : "/idcheck",
			    type : "POST",
			    cache : false,
			    data : "id="+$("#idcheck").val(),
			    success : function(response){
			    	if(response.result == 1){
						alert("중복된 아이디입니다.");
						$('#idck').css("background-color","#3f8be9");
					}
					else{
						alert("사용가능한 아이디입니다.");
						$('#idck').attr('disabled', true);
						$('#idck').css("background-color","#767f8a");
						$('#idcheck').css("border-color","#a0b3b0");
						$("#idlbl")[0].innerText="아이디";
						idsave=$("#idcheck").val();
						ic="false";
					}
			}});
		});
		function checkEmail(email) { //이메일정규식
			var regExp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; 
			// var regExp = /^[-!#$%&'*+./0-9=?A-Z^_a-z{|}~]+@[-!#$%&'*+/0-9=?A-Z^_a-z{|}~]+.[-!#$%&'*+./0-9=?A-Z^_a-z{|}~]+$/;
			if(regExp.test(email)) {
				return true;
			} else {
				return false;
		}}
		$("#emailck").click(function(){ //이메일중복
			if($('#emailcheck').val().length>30){
				alert("이메일은 30자까지 가능합니다.")
				return;
			}else if(!checkEmail($('#emailcheck').val())){
				alert("이메일형식을 제대로입력하세요.");
				$('#emailck').css("background-color","#3f8be9");
				return;
			}
			$.ajax({
			    url : "/emailcheck",
			    type : "POST",
			    cache : false,
			    data : "email="+$("#emailcheck").val(),
			    success : function(response){
			    	if(response.result == 1){
						alert("중복된 이메일입니다.");
						$('#emailck').css("background-color","#3f8be9");
					}
					else{
						alert("사용가능한 이메일입니다.");
						$('#emailck').attr('disabled', true);
						$('#emailck').css("background-color","#767f8a");
						$('#emailcheck').css("border-color","#a0b3b0");
						$("#emaillbl")[0].innerText="이메일";
						emailsave=$("#emailcheck").val();
						ec="false";
					}
			}});
		});
		$('#idfind').click(function(){ //아이디찾기
			if(!$("#findname").val()){
				alert("이름을 입력하세요.");
				return;
			}else if(!$("#findemail").val()){
				alert("이메일을 입력하세요");
				return;
			}else if(!checkEmail($('#findemail').val())){
				alert("이메일형식을 제대로입력하세요.");
				$('#idfind').css("background-color","#3f8be9");
				return;
			}
			$.ajax({
			    url : "/idfind",
			    type : "POST",
			    cache : false,
			    data : "name="+$("#findname").val()+"&email="+$("#findemail").val(),
			    success : function(response){
			    	if(!response.result){
						alert("일치하는 계정정보가 없습니다");
						$('#idfind').css("background-color","#3f8be9");
						$("#idfrm")[0].reset();
						$(".active").removeClass('active');
					}
					else{
						alert("아이디는 \""+response.result+"\" 입니다.");
						$('#idfind').css("background-color","#3f8be9");
						$("#idfrm")[0].reset();
						$(".active").removeClass('active');
					}
			}});
		});
		$('#pwfind').click(function(){ //비밀번호찾기
			if(!$("#pwfindname").val()){
				alert("이름을 입력하세요");
				return;
			}else if(!$("#pwfindid").val()){
				alert("아이디를 입력하세요");
				return;
			}else if(!$("#pwfindemail").val()){
				alert("이메일을 입력하세요.");
				return;
			}else if(!checkEmail($('#pwfindemail').val())){
				alert("이메일형식을 제대로입력하세요.");
				$('#pwfind').css("background-color","#3f8be9");
				return;
			}
			$.ajax({
			    url : "/pwfind",
			    type : "POST",
			    cache : false,
			    data : "name="+$("#pwfindname").val()+"&email="+$("#pwfindemail").val()+"&id="+$("#pwfindid").val(),
			    success : function(response){
			    	if(!response.result){
						alert("일치하는 계정정보가 없습니다");
						$('#pwfind').css("background-color","#3f8be9");
						$("#pwfrm")[0].reset();
						$(".active").removeClass('active');
					}
					else{
						alert("비밀번호는 \""+response.result+"\" 입니다.");
						$('#pwfind').css("background-color","#3f8be9");
						$("#pwfrm")[0].reset();
						$(".active").removeClass('active');
					}
			}});
		});
		$('.form').find('input, textarea').on('keyup blur focus', function (e) {	
			var $this = $(this),
				label = $this.prev('label');
			if (e.type === 'keyup') {
				if($this[0].id=="idcheck"){
					if($this.val() === ''){
						$this.css("border-color","#3f8be9");
						label[0].innerText="아이디";
						ic="false";
					}if(idsave==null){
					}else if(idsave!=$this[0].value){
						$('#idck').attr('disabled', false);
						$('#idck').css("background-color","#3f8be9");
						$this.css("border-color","red");
						label[0].innerText="아이디중복을 다시 확인 해주세요.";
						idsave=null;
						ic="true";
					}else{
						$this.css("border-color","#3f8be9");
						label[0].innerText="아이디";
						ic="false";
					}
				}if($this[0].id=="emailcheck"){
					if($this.val() === ''){
						$this.css("border-color","#3f8be9");
						label[0].innerText="이메일";
						ec="false";
					}if(emailsave==null){
					}else if(emailsave!=$this[0].value){
						$('#emailck').attr('disabled', false);
						$('#emailck').css("background-color","#3f8be9");
						$this.css("border-color","red");
						label[0].innerText="이메일중복을 다시 확인 해주세요.";
						emailsave=null;
						ec="true";
					}else{
						$this.css("border-color","#3f8be9");
						label[0].innerText="이메일";
						ec="false";
					}
				}if($this[0].id=="regipwok"){
					if($("#regipw").val()!=$("#regipwok").val()){
						label[0].innerText="비밀번호가 일치하지않습니다";
						$this.css("border-color","red");
					}else{
						label[0].innerText="비밀번호가 일치합니다";
						$this.css("border-color","#3f8be9");
					}
				}if ($this.val() === '') {
					if($this[0].id=="regipwok"){
						label[0].innerText="비밀번호 확인 *";
						$this.css("border-color","#a0b3b0");
					}
					label.removeClass('active highlight');
				} else {
					label.addClass('active highlight');
				}
			} else if (e.type === 'blur') {
				if( $this.val() === '' ) {
					label.removeClass('active highlight'); 
					if($this[0].id=="idcheck"){
						if(ic=="true"){
							$this.css("border-color","red");
						}else{
							$this.css("border-color","#a0b3b0");
						}
					}if($this[0].id=="emailcheck"){
						if(ec=="true"){
							$this.css("border-color","red");
						}else{
							$this.css("border-color","#a0b3b0");
						}
					}
				} else {
					label.removeClass('highlight');   
					if($this[0].id=="idcheck"){
						if(ic=="true"){
							$this.css("border-color","red");
						}else{
							$this.css("border-color","#a0b3b0");
						}
					}if($this[0].id=="emailcheck"){
						if(ec=="true"){
							$this.css("border-color","red");
						}else{
							$this.css("border-color","#a0b3b0");
						}
					}
				}   
			} else if (e.type === 'focus') {
				if( $this.val() === '' ) {
					label.removeClass('highlight'); 
					if($this[0].id=="idcheck"){
						if(ic=="true"){
							$this.css("border-color","red");
						}else{
							$this.css("border-color","#3f8be9");
						}
					}else if($this[0].id=="emailcheck"){
						if(ec=="true"){
							$this.css("border-color","red");
						}else{
							$this.css("border-color","#3f8be9");
						}
					}
				} else if( $this.val() !== '' ) {
					label.addClass('highlight');
					if($this[0].id=="idcheck"){
						if(ic=="true"){
							$this.css("border-color","red");
						}else{
							$this.css("border-color","#3f8be9");
						}
					}else if($this[0].id=="emailcheck"){
						if(ec=="true"){
							$this.css("border-color","red");
						}else{
							$this.css("border-color","#3f8be9");
						}
					}
				}
		}});
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


