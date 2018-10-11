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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.1/ext-language_tools.js"></script>
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
					<label>${post.language}</label>
					<div id="reghit">
						<label><fmt:formatDate value="${post.reg_date}" pattern="yyyy-MM-dd" /></label>
						<label style="margin-left: 20px;margin-right: 20px">|</label>
						<label >${post.hits}</label>
					</div>
				</div>
				<hr />
				<div class="in_block">
					<label>${post.id}</label>
					<div id="sel_box" >
						<label for="color" >idle Fingers</label>
						<select name="theme" id="color">
							<option value="ace/theme/chrome">Chrome></option>
							<option value="ace/theme/clouds">Clouds></option>
							<option value="ace/theme/crimson_editor">Crimson Editor></option>
							<option value="ace/theme/dawn">Dawn></option>
							<option value="ace/theme/dreamweaver">Dreamweaver></option>
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
									<textarea class="comme" id="${comment.com_no}"   data-editor="sql"  data-gutter="1" readonly autocomplete="off" >${comment.com_code}</textarea>
									<script>
									var textcode = $('#${comment.com_no}').hide();
									var editDiv1 = $('<div>', {
									width: textcode.width(),
									height: textcode.height(),
									'class': textcode.attr('class'),
									}).insertBefore(textcode);
									var windowWidth = $( window ).width();
									console.log(windowWidth);
									if(windowWidth <1280) {
										editDiv1.css("margin-left","20px");
									} else {
										editDiv1.css("margin-left","32px");
									}
									var editor1 = ace.edit(editDiv1[0]);
									editor1.session.setValue(textcode.val());
									editor1.setOptions({
										maxLines: 20,
										minLines: 3,
										enableBasicAutocompletion: true,
										enableSnippets: true,
										enableLiveAutocompletion: true
									});
									if("${post.language}"=="ABC") editor1.getSession().setMode("ace/mode/abc");
									else if("${post.language}"=="ActionScript") editor1.getSession().setMode("ace/mode/actionscript");
									else if("${post.language}"=="ADA") editor1.getSession().setMode("ace/mode/ada");
									else if("${post.language}"=="Apache Conf") editor1.getSession().setMode("ace/mode/apache_conf");
									else if("${post.language}"=="AsciiDoc") editor1.getSession().setMode("ace/mode/asciidoc");
									else if("${post.language}"=="ASL") editor1.getSession().setMode("ace/mode/asl");
									else if("${post.language}"=="Assembly x86") editor1.getSession().setMode("ace/mode/assembly_x86");
									else if("${post.language}"=="AutoHotKey") editor1.getSession().setMode("ace/mode/autohotkey");
									else if("${post.language}"=="ABAP") editor1.getSession().setMode("ace/mode/abap");
									else if("${post.language}"=="BatchFile") editor1.getSession().setMode("ace/mode/batchfile");
									else if("${post.language}"=="Bro") editor1.getSession().setMode("ace/mode/bro");
									else if("${post.language}"=="C and C++") editor1.getSession().setMode("ace/mode/c_cpp");
									else if("${post.language}"=="C9Search") editor1.getSession().setMode("ace/mode/c9search");
									else if("${post.language}"=="Cirru") editor1.getSession().setMode("ace/mode/cirru");
									else if("${post.language}"=="Clojure") editor1.getSession().setMode("ace/mode/clojure");
									else if("${post.language}"=="Cobol") editor1.getSession().setMode("ace/mode/cobol");
									else if("${post.language}"=="CoffeeScript") editor1.getSession().setMode("ace/mode/coffee");
									else if("${post.language}"=="ColdFusion") editor1.getSession().setMode("ace/mode/coldfusion");
									else if("${post.language}"=="C#") editor1.getSession().setMode("ace/mode/csharp");
									else if("${post.language}"=="Csound Document") editor1.getSession().setMode("ace/mode/csound_document");
									else if("${post.language}"=="Csound") editor1.getSession().setMode("ace/mode/csound_orchestra");
									else if("${post.language}"=="Csound Score") editor1.getSession().setMode("ace/mode/csound_score");
									else if("${post.language}"=="CSS") editor1.getSession().setMode("ace/mode/css");
									else if("${post.language}"=="Curly") editor1.getSession().setMode("ace/mode/curly");
									else if("${post.language}"=="D") editor1.getSession().setMode("ace/mode/d");
									else if("${post.language}"=="Dart") editor1.getSession().setMode("ace/mode/dart");
									else if("${post.language}"=="Diff") editor1.getSession().setMode("ace/mode/diff");
									else if("${post.language}"=="Dockerfile") editor1.getSession().setMode("ace/mode/dockerfile");
									else if("${post.language}"=="Dot") editor1.getSession().setMode("ace/mode/dot");
									else if("${post.language}"=="Drools") editor1.getSession().setMode("ace/mode/drools");
									else if("${post.language}"=="Edifact") editor1.getSession().setMode("ace/mode/edifact");
									else if("${post.language}"=="Eiffel") editor1.getSession().setMode("ace/mode/eiffel");
									else if("${post.language}"=="EJS") editor1.getSession().setMode("ace/mode/ejs");
									else if("${post.language}"=="Elixir") editor1.getSession().setMode("ace/mode/elixir");
									else if("${post.language}"=="Elm") editor1.getSession().setMode("ace/mode/elm");
									else if("${post.language}"=="Erlang") editor1.getSession().setMode("ace/mode/erlang");
									else if("${post.language}"=="Forth") editor1.getSession().setMode("ace/mode/forth");
									else if("${post.language}"=="Fortran") editor1.getSession().setMode("ace/mode/fortran");
									else if("${post.language}"=="FSharp") editor1.getSession().setMode("ace/mode/fsharp");
									else if("${post.language}"=="FreeMarker") editor1.getSession().setMode("ace/mode/ftl");
									else if("${post.language}"=="Gcode") editor1.getSession().setMode("ace/mode/gcode");
									else if("${post.language}"=="Gherkin") editor1.getSession().setMode("ace/mode/gherkin");
									else if("${post.language}"=="Gitignore") editor1.getSession().setMode("ace/mode/gitignore");
									else if("${post.language}"=="Glsl") editor1.getSession().setMode("ace/mode/glsl");
									else if("${post.language}"=="Gobstones") editor1.getSession().setMode("ace/mode/gobstones");
									else if("${post.language}"=="Go") editor1.getSession().setMode("ace/mode/golang");
									else if("${post.language}"=="GraphQLSchema") editor1.getSession().setMode("ace/mode/graphqlschema");
									else if("${post.language}"=="Groovy") editor1.getSession().setMode("ace/mode/groovy");
									else if("${post.language}"=="HAML") editor1.getSession().setMode("ace/mode/haml");
									else if("${post.language}"=="Handlebars") editor1.getSession().setMode("ace/mode/handlebars");
									else if("${post.language}"=="Haskell") editor1.getSession().setMode("ace/mode/haskell");
									else if("${post.language}"=="Haskell Cabal") editor1.getSession().setMode("ace/mode/haskell_cabal");
									else if("${post.language}"=="haXe") editor1.getSession().setMode("ace/mode/haxe");
									else if("${post.language}"=="Hjson") editor1.getSession().setMode("ace/mode/hjson");
									else if("${post.language}"=="HTML") editor1.getSession().setMode("ace/mode/html");
									else if("${post.language}"=="HTML (Elixir)") editor1.getSession().setMode("ace/mode/html_elixir");
									else if("${post.language}"=="HTML (Ruby)") editor1.getSession().setMode("ace/mode/html_ruby");
									else if("${post.language}"=="INI") editor1.getSession().setMode("ace/mode/ini");
									else if("${post.language}"=="Io") editor1.getSession().setMode("ace/mode/io");
									else if("${post.language}"=="Jack") editor1.getSession().setMode("ace/mode/jack");
									else if("${post.language}"=="Jade") editor1.getSession().setMode("ace/mode/jade");
									else if("${post.language}"=="Java") editor1.getSession().setMode("ace/mode/java");
									else if("${post.language}"=="JavaScript") editor1.getSession().setMode("ace/mode/javascript");
									else if("${post.language}"=="JSON") editor1.getSession().setMode("ace/mode/json");
									else if("${post.language}"=="JSONiq") editor1.getSession().setMode("ace/mode/jsoniq");
									else if("${post.language}"=="JSP") editor1.getSession().setMode("ace/mode/jsp");
									else if("${post.language}"=="JSSM") editor1.getSession().setMode("ace/mode/jssm");
									else if("${post.language}"=="JSX") editor1.getSession().setMode("ace/mode/jsx");
									else if("${post.language}"=="Julia") editor1.getSession().setMode("ace/mode/julia");
									else if("${post.language}"=="Kotlin") editor1.getSession().setMode("ace/mode/kotlin");
									else if("${post.language}"=="LaTeX") editor1.getSession().setMode("ace/mode/latex");
									else if("${post.language}"=="LESS") editor1.getSession().setMode("ace/mode/less");
									else if("${post.language}"=="Liquid") editor1.getSession().setMode("ace/mode/liquid");
									else if("${post.language}"=="Lisp") editor1.getSession().setMode("ace/mode/lisp");
									else if("${post.language}"=="LiveScript") editor1.getSession().setMode("ace/mode/livescript");
									else if("${post.language}"=="LogiQL") editor1.getSession().setMode("ace/mode/logiql");
									else if("${post.language}"=="LSL") editor1.getSession().setMode("ace/mode/lsl");
									else if("${post.language}"=="Lua") editor1.getSession().setMode("ace/mode/lua");
									else if("${post.language}"=="LuaPage") editor1.getSession().setMode("ace/mode/luapage");
									else if("${post.language}"=="Lucene") editor1.getSession().setMode("ace/mode/lucene");
									else if("${post.language}"=="Makefile") editor1.getSession().setMode("ace/mode/makefile");
									else if("${post.language}"=="Markdown") editor1.getSession().setMode("ace/mode/markdown");
									else if("${post.language}"=="Mask") editor1.getSession().setMode("ace/mode/mask");
									else if("${post.language}"=="MATLAB") editor1.getSession().setMode("ace/mode/matlab");
									else if("${post.language}"=="Maze") editor1.getSession().setMode("ace/mode/maze");
									else if("${post.language}"=="MEL") editor1.getSession().setMode("ace/mode/mel");
									else if("${post.language}"=="MIXAL") editor1.getSession().setMode("ace/mode/mixal");
									else if("${post.language}"=="MUSHCode") editor1.getSession().setMode("ace/mode/mushcode");
									else if("${post.language}"=="MySQL") editor1.getSession().setMode("ace/mode/mysql");
									else if("${post.language}"=="Nix") editor1.getSession().setMode("ace/mode/nix");
									else if("${post.language}"=="NSIS") editor1.getSession().setMode("ace/mode/nsis");
									else if("${post.language}"=="Objective-C") editor1.getSession().setMode("ace/mode/objectivec");
									else if("${post.language}"=="OCaml") editor1.getSession().setMode("ace/mode/ocaml");
									else if("${post.language}"=="Pascal") editor1.getSession().setMode("ace/mode/pascal");
									else if("${post.language}"=="Perl") editor1.getSession().setMode("ace/mode/perl");
									else if("${post.language}"=="pgSQL") editor1.getSession().setMode("ace/mode/pgsql");
									else if("${post.language}"=="PHP (Blade Template)") editor1.getSession().setMode("ace/mode/php_laravel_blade");
									else if("${post.language}"=="PHP") editor1.getSession().setMode("ace/mode/php");
									else if("${post.language}"=="Puppet") editor1.getSession().setMode("ace/mode/puppet");
									else if("${post.language}"=="Pig") editor1.getSession().setMode("ace/mode/pig");
									else if("${post.language}"=="Powershell") editor1.getSession().setMode("ace/mode/powershell");
									else if("${post.language}"=="Praat") editor1.getSession().setMode("ace/mode/praat");
									else if("${post.language}"=="Prolog") editor1.getSession().setMode("ace/mode/prolog");
									else if("${post.language}"=="Properties") editor1.getSession().setMode("ace/mode/properties");
									else if("${post.language}"=="Protobuf") editor1.getSession().setMode("ace/mode/protobuf");
									else if("${post.language}"=="Python") editor1.getSession().setMode("ace/mode/python");
									else if("${post.language}"=="R") editor1.getSession().setMode("ace/mode/r");
									else if("${post.language}"=="Razor") editor1.getSession().setMode("ace/mode/razor");
									else if("${post.language}"=="RDoc") editor1.getSession().setMode("ace/mode/rdoc");
									else if("${post.language}"=="Red") editor1.getSession().setMode("ace/mode/red");
									else if("${post.language}"=="RHTML") editor1.getSession().setMode("ace/mode/rhtml");
									else if("${post.language}"=="RST") editor1.getSession().setMode("ace/mode/rst");
									else if("${post.language}"=="Ruby") editor1.getSession().setMode("ace/mode/ruby");
									else if("${post.language}"=="Rust") editor1.getSession().setMode("ace/mode/rust");
									else if("${post.language}"=="SASS") editor1.getSession().setMode("ace/mode/sass");
									else if("${post.language}"=="SCAD") editor1.getSession().setMode("ace/mode/scad");
									else if("${post.language}"=="Scala") editor1.getSession().setMode("ace/mode/scala");
									else if("${post.language}"=="Scheme") editor1.getSession().setMode("ace/mode/scheme");
									else if("${post.language}"=="SCSS") editor1.getSession().setMode("ace/mode/scss");
									else if("${post.language}"=="SH") editor1.getSession().setMode("ace/mode/sh");
									else if("${post.language}"=="SJS") editor1.getSession().setMode("ace/mode/sjs");
									else if("${post.language}"=="Slim") editor1.getSession().setMode("ace/mode/slim");
									else if("${post.language}"=="Smarty") editor1.getSession().setMode("ace/mode/smarty");
									else if("${post.language}"=="snippets") editor1.getSession().setMode("ace/mode/snippets");
									else if("${post.language}"=="Soy Template") editor1.getSession().setMode("ace/mode/soy_template");
									else if("${post.language}"=="Space") editor1.getSession().setMode("ace/mode/space");
									else if("${post.language}"=="SQL") editor1.getSession().setMode("ace/mode/sql");
									else if("${post.language}"=="SQLServer") editor1.getSession().setMode("ace/mode/sqlserver");
									else if("${post.language}"=="Stylus") editor1.getSession().setMode("ace/mode/stylus");
									else if("${post.language}"=="SVG") editor1.getSession().setMode("ace/mode/svg");
									else if("${post.language}"=="Swift") editor1.getSession().setMode("ace/mode/swift");
									else if("${post.language}"=="Tcl") editor1.getSession().setMode("ace/mode/tcl");
									else if("${post.language}"=="Terraform") editor1.getSession().setMode("ace/mode/terraform");
									else if("${post.language}"=="Tex") editor1.getSession().setMode("ace/mode/tex");
									else if("${post.language}"=="Text") editor1.getSession().setMode("ace/mode/text");
									else if("${post.language}"=="Textile") editor1.getSession().setMode("ace/mode/textile");
									else if("${post.language}"=="Toml") editor1.getSession().setMode("ace/mode/toml");
									else if("${post.language}"=="TSX") editor1.getSession().setMode("ace/mode/tsx");
									else if("${post.language}"=="Twig") editor1.getSession().setMode("ace/mode/twig");
									else if("${post.language}"=="Typescript") editor1.getSession().setMode("ace/mode/typescript");
									else if("${post.language}"=="Vala") editor1.getSession().setMode("ace/mode/vala");
									else if("${post.language}"=="VBScript") editor1.getSession().setMode("ace/mode/vbscript");
									else if("${post.language}"=="Velocity") editor1.getSession().setMode("ace/mode/velocity");
									else if("${post.language}"=="Verilog") editor1.getSession().setMode("ace/mode/verilog");
									else if("${post.language}"=="VHDL") editor1.getSession().setMode("ace/mode/vhdl");
									else if("${post.language}"=="Wollok") editor1.getSession().setMode("ace/mode/wollok");
									else if("${post.language}"=="XML") editor1.getSession().setMode("ace/mode/xml");
									else if("${post.language}"=="XQuery") editor1.getSession().setMode("ace/mode/xquery");
									else if("${post.language}"=="YAML") editor1.getSession().setMode("ace/mode/yaml");
									else if("${post.language}"=="Django") editor1.getSession().setMode("ace/mode/django");
									editor1.setReadOnly(true);
									</script>
									<c:choose>
										<c:when test='${session == "yes"}'>
											<label id="lbl" style="margin-top: -45px;">${comment.id}</label>
										</c:when>
										<c:otherwise>
											<label id="lbl" >${comment.id}</label>
											<script>$("div[class='comme ace_editor ace-tm']").css("margin-bottom","20px");</script>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${id==comment.id}">
											<button  id="comment_modify" value="${comment.com_no}" style="margin-top: -75px;">수정</button>
											<button  id="comment_delete" value="${comment.com_no}" style="margin-top: -75px;">삭제</button>
										</c:when>
									</c:choose>
								</c:when>
								<c:otherwise>
									<label> ${comment.id}</label>
									<c:choose>
										<c:when test="${id==comment.id}">
											<button  id="comment_modify" value="${comment.com_no}">수정</button>
											<button  id="comment_delete" value="${comment.com_no}">삭제</button>
										</c:when>
									</c:choose>
								</c:otherwise>
							</c:choose>	
						</div>		
						<hr style="width:0px;height: 5px;margin-left: 500px;"/>	
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
					<textarea id="new_comment" autocomplete="off" placeholder="내용"  ></textarea>
					<textarea id="new_comcode" autocomplete="off" placeholder="코드" ></textarea>
					<script>
						var incode = $('#new_comcode').hide();
						var editDiv2 = $('<div>', {
						width: incode.width(),
						height: incode.height(),
						'class': incode.attr('class'),
						}).insertBefore(incode);
						var windowWidth = $( window ).width();
						console.log("띠용:"+windowWidth);
						if(windowWidth <1280) {
							editDiv2.css("margin-left","20px");
						} else {
							editDiv2.css("margin-left","32px");
						}
						editDiv2.css("margin-top","20px");
						editDiv2.css("margin-bottom","20px");
						var editor2= ace.edit(editDiv2[0]);
						editor2.setOptions({
							maxLines: 20,
							minLines: 3,
							enableBasicAutocompletion: true,
							enableSnippets: true,
							enableLiveAutocompletion: true
						});
						// editor2.setTheme("{post.language}");
						if("${post.language}"=="ABC") editor2.getSession().setMode("ace/mode/abc");
						else if("${post.language}"=="ActionScript") editor2.getSession().setMode("ace/mode/actionscript");
						else if("${post.language}"=="ADA") editor2.getSession().setMode("ace/mode/ada");
						else if("${post.language}"=="Apache Conf") editor2.getSession().setMode("ace/mode/apache_conf");
						else if("${post.language}"=="AsciiDoc") editor2.getSession().setMode("ace/mode/asciidoc");
						else if("${post.language}"=="ASL") editor2.getSession().setMode("ace/mode/asl");
						else if("${post.language}"=="Assembly x86") editor2.getSession().setMode("ace/mode/assembly_x86");
						else if("${post.language}"=="AutoHotKey") editor2.getSession().setMode("ace/mode/autohotkey");
						else if("${post.language}"=="ABAP") editor2.getSession().setMode("ace/mode/abap");
						else if("${post.language}"=="BatchFile") editor2.getSession().setMode("ace/mode/batchfile");
						else if("${post.language}"=="Bro") editor2.getSession().setMode("ace/mode/bro");
						else if("${post.language}"=="C and C++") editor2.getSession().setMode("ace/mode/c_cpp");
						else if("${post.language}"=="C9Search") editor2.getSession().setMode("ace/mode/c9search");
						else if("${post.language}"=="Cirru") editor2.getSession().setMode("ace/mode/cirru");
						else if("${post.language}"=="Clojure") editor2.getSession().setMode("ace/mode/clojure");
						else if("${post.language}"=="Cobol") editor2.getSession().setMode("ace/mode/cobol");
						else if("${post.language}"=="CoffeeScript") editor2.getSession().setMode("ace/mode/coffee");
						else if("${post.language}"=="ColdFusion") editor2.getSession().setMode("ace/mode/coldfusion");
						else if("${post.language}"=="C#") editor2.getSession().setMode("ace/mode/csharp");
						else if("${post.language}"=="Csound Document") editor2.getSession().setMode("ace/mode/csound_document");
						else if("${post.language}"=="Csound") editor2.getSession().setMode("ace/mode/csound_orchestra");
						else if("${post.language}"=="Csound Score") editor2.getSession().setMode("ace/mode/csound_score");
						else if("${post.language}"=="CSS") editor2.getSession().setMode("ace/mode/css");
						else if("${post.language}"=="Curly") editor2.getSession().setMode("ace/mode/curly");
						else if("${post.language}"=="D") editor2.getSession().setMode("ace/mode/d");
						else if("${post.language}"=="Dart") editor2.getSession().setMode("ace/mode/dart");
						else if("${post.language}"=="Diff") editor2.getSession().setMode("ace/mode/diff");
						else if("${post.language}"=="Dockerfile") editor2.getSession().setMode("ace/mode/dockerfile");
						else if("${post.language}"=="Dot") editor2.getSession().setMode("ace/mode/dot");
						else if("${post.language}"=="Drools") editor2.getSession().setMode("ace/mode/drools");
						else if("${post.language}"=="Edifact") editor2.getSession().setMode("ace/mode/edifact");
						else if("${post.language}"=="Eiffel") editor2.getSession().setMode("ace/mode/eiffel");
						else if("${post.language}"=="EJS") editor2.getSession().setMode("ace/mode/ejs");
						else if("${post.language}"=="Elixir") editor2.getSession().setMode("ace/mode/elixir");
						else if("${post.language}"=="Elm") editor2.getSession().setMode("ace/mode/elm");
						else if("${post.language}"=="Erlang") editor2.getSession().setMode("ace/mode/erlang");
						else if("${post.language}"=="Forth") editor2.getSession().setMode("ace/mode/forth");
						else if("${post.language}"=="Fortran") editor2.getSession().setMode("ace/mode/fortran");
						else if("${post.language}"=="FSharp") editor2.getSession().setMode("ace/mode/fsharp");
						else if("${post.language}"=="FreeMarker") editor2.getSession().setMode("ace/mode/ftl");
						else if("${post.language}"=="Gcode") editor2.getSession().setMode("ace/mode/gcode");
						else if("${post.language}"=="Gherkin") editor2.getSession().setMode("ace/mode/gherkin");
						else if("${post.language}"=="Gitignore") editor2.getSession().setMode("ace/mode/gitignore");
						else if("${post.language}"=="Glsl") editor2.getSession().setMode("ace/mode/glsl");
						else if("${post.language}"=="Gobstones") editor2.getSession().setMode("ace/mode/gobstones");
						else if("${post.language}"=="Go") editor2.getSession().setMode("ace/mode/golang");
						else if("${post.language}"=="GraphQLSchema") editor2.getSession().setMode("ace/mode/graphqlschema");
						else if("${post.language}"=="Groovy") editor2.getSession().setMode("ace/mode/groovy");
						else if("${post.language}"=="HAML") editor2.getSession().setMode("ace/mode/haml");
						else if("${post.language}"=="Handlebars") editor2.getSession().setMode("ace/mode/handlebars");
						else if("${post.language}"=="Haskell") editor2.getSession().setMode("ace/mode/haskell");
						else if("${post.language}"=="Haskell Cabal") editor2.getSession().setMode("ace/mode/haskell_cabal");
						else if("${post.language}"=="haXe") editor2.getSession().setMode("ace/mode/haxe");
						else if("${post.language}"=="Hjson") editor2.getSession().setMode("ace/mode/hjson");
						else if("${post.language}"=="HTML") editor2.getSession().setMode("ace/mode/html");
						else if("${post.language}"=="HTML (Elixir)") editor2.getSession().setMode("ace/mode/html_elixir");
						else if("${post.language}"=="HTML (Ruby)") editor2.getSession().setMode("ace/mode/html_ruby");
						else if("${post.language}"=="INI") editor2.getSession().setMode("ace/mode/ini");
						else if("${post.language}"=="Io") editor2.getSession().setMode("ace/mode/io");
						else if("${post.language}"=="Jack") editor2.getSession().setMode("ace/mode/jack");
						else if("${post.language}"=="Jade") editor2.getSession().setMode("ace/mode/jade");
						else if("${post.language}"=="Java") editor2.getSession().setMode("ace/mode/java");
						else if("${post.language}"=="JavaScript") editor2.getSession().setMode("ace/mode/javascript");
						else if("${post.language}"=="JSON") editor2.getSession().setMode("ace/mode/json");
						else if("${post.language}"=="JSONiq") editor2.getSession().setMode("ace/mode/jsoniq");
						else if("${post.language}"=="JSP") editor2.getSession().setMode("ace/mode/jsp");
						else if("${post.language}"=="JSSM") editor2.getSession().setMode("ace/mode/jssm");
						else if("${post.language}"=="JSX") editor2.getSession().setMode("ace/mode/jsx");
						else if("${post.language}"=="Julia") editor2.getSession().setMode("ace/mode/julia");
						else if("${post.language}"=="Kotlin") editor2.getSession().setMode("ace/mode/kotlin");
						else if("${post.language}"=="LaTeX") editor2.getSession().setMode("ace/mode/latex");
						else if("${post.language}"=="LESS") editor2.getSession().setMode("ace/mode/less");
						else if("${post.language}"=="Liquid") editor2.getSession().setMode("ace/mode/liquid");
						else if("${post.language}"=="Lisp") editor2.getSession().setMode("ace/mode/lisp");
						else if("${post.language}"=="LiveScript") editor2.getSession().setMode("ace/mode/livescript");
						else if("${post.language}"=="LogiQL") editor2.getSession().setMode("ace/mode/logiql");
						else if("${post.language}"=="LSL") editor2.getSession().setMode("ace/mode/lsl");
						else if("${post.language}"=="Lua") editor2.getSession().setMode("ace/mode/lua");
						else if("${post.language}"=="LuaPage") editor2.getSession().setMode("ace/mode/luapage");
						else if("${post.language}"=="Lucene") editor2.getSession().setMode("ace/mode/lucene");
						else if("${post.language}"=="Makefile") editor2.getSession().setMode("ace/mode/makefile");
						else if("${post.language}"=="Markdown") editor2.getSession().setMode("ace/mode/markdown");
						else if("${post.language}"=="Mask") editor2.getSession().setMode("ace/mode/mask");
						else if("${post.language}"=="MATLAB") editor2.getSession().setMode("ace/mode/matlab");
						else if("${post.language}"=="Maze") editor2.getSession().setMode("ace/mode/maze");
						else if("${post.language}"=="MEL") editor2.getSession().setMode("ace/mode/mel");
						else if("${post.language}"=="MIXAL") editor2.getSession().setMode("ace/mode/mixal");
						else if("${post.language}"=="MUSHCode") editor2.getSession().setMode("ace/mode/mushcode");
						else if("${post.language}"=="MySQL") editor2.getSession().setMode("ace/mode/mysql");
						else if("${post.language}"=="Nix") editor2.getSession().setMode("ace/mode/nix");
						else if("${post.language}"=="NSIS") editor2.getSession().setMode("ace/mode/nsis");
						else if("${post.language}"=="Objective-C") editor2.getSession().setMode("ace/mode/objectivec");
						else if("${post.language}"=="OCaml") editor2.getSession().setMode("ace/mode/ocaml");
						else if("${post.language}"=="Pascal") editor2.getSession().setMode("ace/mode/pascal");
						else if("${post.language}"=="Perl") editor2.getSession().setMode("ace/mode/perl");
						else if("${post.language}"=="pgSQL") editor2.getSession().setMode("ace/mode/pgsql");
						else if("${post.language}"=="PHP (Blade Template)") editor2.getSession().setMode("ace/mode/php_laravel_blade");
						else if("${post.language}"=="PHP") editor2.getSession().setMode("ace/mode/php");
						else if("${post.language}"=="Puppet") editor2.getSession().setMode("ace/mode/puppet");
						else if("${post.language}"=="Pig") editor2.getSession().setMode("ace/mode/pig");
						else if("${post.language}"=="Powershell") editor2.getSession().setMode("ace/mode/powershell");
						else if("${post.language}"=="Praat") editor2.getSession().setMode("ace/mode/praat");
						else if("${post.language}"=="Prolog") editor2.getSession().setMode("ace/mode/prolog");
						else if("${post.language}"=="Properties") editor2.getSession().setMode("ace/mode/properties");
						else if("${post.language}"=="Protobuf") editor2.getSession().setMode("ace/mode/protobuf");
						else if("${post.language}"=="Python") editor2.getSession().setMode("ace/mode/python");
						else if("${post.language}"=="R") editor2.getSession().setMode("ace/mode/r");
						else if("${post.language}"=="Razor") editor2.getSession().setMode("ace/mode/razor");
						else if("${post.language}"=="RDoc") editor2.getSession().setMode("ace/mode/rdoc");
						else if("${post.language}"=="Red") editor2.getSession().setMode("ace/mode/red");
						else if("${post.language}"=="RHTML") editor2.getSession().setMode("ace/mode/rhtml");
						else if("${post.language}"=="RST") editor2.getSession().setMode("ace/mode/rst");
						else if("${post.language}"=="Ruby") editor2.getSession().setMode("ace/mode/ruby");
						else if("${post.language}"=="Rust") editor2.getSession().setMode("ace/mode/rust");
						else if("${post.language}"=="SASS") editor2.getSession().setMode("ace/mode/sass");
						else if("${post.language}"=="SCAD") editor2.getSession().setMode("ace/mode/scad");
						else if("${post.language}"=="Scala") editor2.getSession().setMode("ace/mode/scala");
						else if("${post.language}"=="Scheme") editor2.getSession().setMode("ace/mode/scheme");
						else if("${post.language}"=="SCSS") editor2.getSession().setMode("ace/mode/scss");
						else if("${post.language}"=="SH") editor2.getSession().setMode("ace/mode/sh");
						else if("${post.language}"=="SJS") editor2.getSession().setMode("ace/mode/sjs");
						else if("${post.language}"=="Slim") editor2.getSession().setMode("ace/mode/slim");
						else if("${post.language}"=="Smarty") editor2.getSession().setMode("ace/mode/smarty");
						else if("${post.language}"=="snippets") editor2.getSession().setMode("ace/mode/snippets");
						else if("${post.language}"=="Soy Template") editor2.getSession().setMode("ace/mode/soy_template");
						else if("${post.language}"=="Space") editor2.getSession().setMode("ace/mode/space");
						else if("${post.language}"=="SQL") editor2.getSession().setMode("ace/mode/sql");
						else if("${post.language}"=="SQLServer") editor2.getSession().setMode("ace/mode/sqlserver");
						else if("${post.language}"=="Stylus") editor2.getSession().setMode("ace/mode/stylus");
						else if("${post.language}"=="SVG") editor2.getSession().setMode("ace/mode/svg");
						else if("${post.language}"=="Swift") editor2.getSession().setMode("ace/mode/swift");
						else if("${post.language}"=="Tcl") editor2.getSession().setMode("ace/mode/tcl");
						else if("${post.language}"=="Terraform") editor2.getSession().setMode("ace/mode/terraform");
						else if("${post.language}"=="Tex") editor2.getSession().setMode("ace/mode/tex");
						else if("${post.language}"=="Text") editor2.getSession().setMode("ace/mode/text");
						else if("${post.language}"=="Textile") editor2.getSession().setMode("ace/mode/textile");
						else if("${post.language}"=="Toml") editor2.getSession().setMode("ace/mode/toml");
						else if("${post.language}"=="TSX") editor2.getSession().setMode("ace/mode/tsx");
						else if("${post.language}"=="Twig") editor2.getSession().setMode("ace/mode/twig");
						else if("${post.language}"=="Typescript") editor2.getSession().setMode("ace/mode/typescript");
						else if("${post.language}"=="Vala") editor2.getSession().setMode("ace/mode/vala");
						else if("${post.language}"=="VBScript") editor2.getSession().setMode("ace/mode/vbscript");
						else if("${post.language}"=="Velocity") editor2.getSession().setMode("ace/mode/velocity");
						else if("${post.language}"=="Verilog") editor2.getSession().setMode("ace/mode/verilog");
						else if("${post.language}"=="VHDL") editor2.getSession().setMode("ace/mode/vhdl");
						else if("${post.language}"=="Wollok") editor2.getSession().setMode("ace/mode/wollok");
						else if("${post.language}"=="XML") editor2.getSession().setMode("ace/mode/xml");
						else if("${post.language}"=="XQuery") editor2.getSession().setMode("ace/mode/xquery");
						else if("${post.language}"=="YAML") editor2.getSession().setMode("ace/mode/yaml");
						else if("${post.language}"=="Django") editor2.getSession().setMode("ace/mode/django");
					</script>
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
			var select = $("select#color");
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
			// autosize(document.querySelectorAll('.comment'));
			autosize(document.querySelectorAll('.comme'));
			$( window ).resize(function() {
				var windowWidth = $( window ).width();
				console.log(windowWidth);
				if(windowWidth <1280) {
					$("#lbl").css("margin-left","837px");
					$("label[class='lb2']").css("margin-left","837px");
					$(editDiv).css('width','1064px');
					$("div[class='comme ace_editor ace-tm']").css( 'width', '800px' ).css( 'margin-left', '20px' );
					$("div[class=' ace_editor ace-tm']").css( 'width', '800px' ).css( 'margin-left', '20px' );
					$('#comment_add').css("margin-left","837px");
				} else {
					$("#lbl").css("margin-left","1398px");
					$("label[class='lb2']").css("margin-left","1398px");
					$('#comment_add').css("margin-left","1398px");
					$(editDiv).css('width','1603px');
					$("div[class='comme ace_editor ace-tm']").css( 'width', '1350px' ).css( 'margin-left', '32px' );
					$("div[class=' ace_editor ace-tm']").css( 'width', '1350px' ).css( 'margin-left', '32px' );
				}
			});
			$(function() {
				$('textarea[data-editor]').each(function() {
					textarea.css('display', 'none');
					editor.renderer.setShowGutter(textarea.data('gutter'));
					editor.getSession().setValue(textarea.val());
					if("${post.language}"=="ABC") editor.getSession().setMode("ace/mode/abc");
					else if("${post.language}"=="ActionScript") editor.getSession().setMode("ace/mode/actionscript");
					else if("${post.language}"=="ADA") editor.getSession().setMode("ace/mode/ada");
					else if("${post.language}"=="Apache Conf") editor.getSession().setMode("ace/mode/apache_conf");
					else if("${post.language}"=="AsciiDoc") editor.getSession().setMode("ace/mode/asciidoc");
					else if("${post.language}"=="ASL") editor.getSession().setMode("ace/mode/asl");
					else if("${post.language}"=="Assembly x86") editor.getSession().setMode("ace/mode/assembly_x86");
					else if("${post.language}"=="AutoHotKey") editor.getSession().setMode("ace/mode/autohotkey");
					else if("${post.language}"=="ABAP") editor.getSession().setMode("ace/mode/abap");
					else if("${post.language}"=="BatchFile") editor.getSession().setMode("ace/mode/batchfile");
					else if("${post.language}"=="Bro") editor.getSession().setMode("ace/mode/bro");
					else if("${post.language}"=="C and C++") editor.getSession().setMode("ace/mode/c_cpp");
					else if("${post.language}"=="C9Search") editor.getSession().setMode("ace/mode/c9search");
					else if("${post.language}"=="Cirru") editor.getSession().setMode("ace/mode/cirru");
					else if("${post.language}"=="Clojure") editor.getSession().setMode("ace/mode/clojure");
					else if("${post.language}"=="Cobol") editor.getSession().setMode("ace/mode/cobol");
					else if("${post.language}"=="CoffeeScript") editor.getSession().setMode("ace/mode/coffee");
					else if("${post.language}"=="ColdFusion") editor.getSession().setMode("ace/mode/coldfusion");
					else if("${post.language}"=="C#") editor.getSession().setMode("ace/mode/csharp");
					else if("${post.language}"=="Csound Document") editor.getSession().setMode("ace/mode/csound_document");
					else if("${post.language}"=="Csound") editor.getSession().setMode("ace/mode/csound_orchestra");
					else if("${post.language}"=="Csound Score") editor.getSession().setMode("ace/mode/csound_score");
					else if("${post.language}"=="CSS") editor.getSession().setMode("ace/mode/css");
					else if("${post.language}"=="Curly") editor.getSession().setMode("ace/mode/curly");
					else if("${post.language}"=="D") editor.getSession().setMode("ace/mode/d");
					else if("${post.language}"=="Dart") editor.getSession().setMode("ace/mode/dart");
					else if("${post.language}"=="Diff") editor.getSession().setMode("ace/mode/diff");
					else if("${post.language}"=="Dockerfile") editor.getSession().setMode("ace/mode/dockerfile");
					else if("${post.language}"=="Dot") editor.getSession().setMode("ace/mode/dot");
					else if("${post.language}"=="Drools") editor.getSession().setMode("ace/mode/drools");
					else if("${post.language}"=="Edifact") editor.getSession().setMode("ace/mode/edifact");
					else if("${post.language}"=="Eiffel") editor.getSession().setMode("ace/mode/eiffel");
					else if("${post.language}"=="EJS") editor.getSession().setMode("ace/mode/ejs");
					else if("${post.language}"=="Elixir") editor.getSession().setMode("ace/mode/elixir");
					else if("${post.language}"=="Elm") editor.getSession().setMode("ace/mode/elm");
					else if("${post.language}"=="Erlang") editor.getSession().setMode("ace/mode/erlang");
					else if("${post.language}"=="Forth") editor.getSession().setMode("ace/mode/forth");
					else if("${post.language}"=="Fortran") editor.getSession().setMode("ace/mode/fortran");
					else if("${post.language}"=="FSharp") editor.getSession().setMode("ace/mode/fsharp");
					else if("${post.language}"=="FreeMarker") editor.getSession().setMode("ace/mode/ftl");
					else if("${post.language}"=="Gcode") editor.getSession().setMode("ace/mode/gcode");
					else if("${post.language}"=="Gherkin") editor.getSession().setMode("ace/mode/gherkin");
					else if("${post.language}"=="Gitignore") editor.getSession().setMode("ace/mode/gitignore");
					else if("${post.language}"=="Glsl") editor.getSession().setMode("ace/mode/glsl");
					else if("${post.language}"=="Gobstones") editor.getSession().setMode("ace/mode/gobstones");
					else if("${post.language}"=="Go") editor.getSession().setMode("ace/mode/golang");
					else if("${post.language}"=="GraphQLSchema") editor.getSession().setMode("ace/mode/graphqlschema");
					else if("${post.language}"=="Groovy") editor.getSession().setMode("ace/mode/groovy");
					else if("${post.language}"=="HAML") editor.getSession().setMode("ace/mode/haml");
					else if("${post.language}"=="Handlebars") editor.getSession().setMode("ace/mode/handlebars");
					else if("${post.language}"=="Haskell") editor.getSession().setMode("ace/mode/haskell");
					else if("${post.language}"=="Haskell Cabal") editor.getSession().setMode("ace/mode/haskell_cabal");
					else if("${post.language}"=="haXe") editor.getSession().setMode("ace/mode/haxe");
					else if("${post.language}"=="Hjson") editor.getSession().setMode("ace/mode/hjson");
					else if("${post.language}"=="HTML") editor.getSession().setMode("ace/mode/html");
					else if("${post.language}"=="HTML (Elixir)") editor.getSession().setMode("ace/mode/html_elixir");
					else if("${post.language}"=="HTML (Ruby)") editor.getSession().setMode("ace/mode/html_ruby");
					else if("${post.language}"=="INI") editor.getSession().setMode("ace/mode/ini");
					else if("${post.language}"=="Io") editor.getSession().setMode("ace/mode/io");
					else if("${post.language}"=="Jack") editor.getSession().setMode("ace/mode/jack");
					else if("${post.language}"=="Jade") editor.getSession().setMode("ace/mode/jade");
					else if("${post.language}"=="Java") editor.getSession().setMode("ace/mode/java");
					else if("${post.language}"=="JavaScript") editor.getSession().setMode("ace/mode/javascript");
					else if("${post.language}"=="JSON") editor.getSession().setMode("ace/mode/json");
					else if("${post.language}"=="JSONiq") editor.getSession().setMode("ace/mode/jsoniq");
					else if("${post.language}"=="JSP") editor.getSession().setMode("ace/mode/jsp");
					else if("${post.language}"=="JSSM") editor.getSession().setMode("ace/mode/jssm");
					else if("${post.language}"=="JSX") editor.getSession().setMode("ace/mode/jsx");
					else if("${post.language}"=="Julia") editor.getSession().setMode("ace/mode/julia");
					else if("${post.language}"=="Kotlin") editor.getSession().setMode("ace/mode/kotlin");
					else if("${post.language}"=="LaTeX") editor.getSession().setMode("ace/mode/latex");
					else if("${post.language}"=="LESS") editor.getSession().setMode("ace/mode/less");
					else if("${post.language}"=="Liquid") editor.getSession().setMode("ace/mode/liquid");
					else if("${post.language}"=="Lisp") editor.getSession().setMode("ace/mode/lisp");
					else if("${post.language}"=="LiveScript") editor.getSession().setMode("ace/mode/livescript");
					else if("${post.language}"=="LogiQL") editor.getSession().setMode("ace/mode/logiql");
					else if("${post.language}"=="LSL") editor.getSession().setMode("ace/mode/lsl");
					else if("${post.language}"=="Lua") editor.getSession().setMode("ace/mode/lua");
					else if("${post.language}"=="LuaPage") editor.getSession().setMode("ace/mode/luapage");
					else if("${post.language}"=="Lucene") editor.getSession().setMode("ace/mode/lucene");
					else if("${post.language}"=="Makefile") editor.getSession().setMode("ace/mode/makefile");
					else if("${post.language}"=="Markdown") editor.getSession().setMode("ace/mode/markdown");
					else if("${post.language}"=="Mask") editor.getSession().setMode("ace/mode/mask");
					else if("${post.language}"=="MATLAB") editor.getSession().setMode("ace/mode/matlab");
					else if("${post.language}"=="Maze") editor.getSession().setMode("ace/mode/maze");
					else if("${post.language}"=="MEL") editor.getSession().setMode("ace/mode/mel");
					else if("${post.language}"=="MIXAL") editor.getSession().setMode("ace/mode/mixal");
					else if("${post.language}"=="MUSHCode") editor.getSession().setMode("ace/mode/mushcode");
					else if("${post.language}"=="MySQL") editor.getSession().setMode("ace/mode/mysql");
					else if("${post.language}"=="Nix") editor.getSession().setMode("ace/mode/nix");
					else if("${post.language}"=="NSIS") editor.getSession().setMode("ace/mode/nsis");
					else if("${post.language}"=="Objective-C") editor.getSession().setMode("ace/mode/objectivec");
					else if("${post.language}"=="OCaml") editor.getSession().setMode("ace/mode/ocaml");
					else if("${post.language}"=="Pascal") editor.getSession().setMode("ace/mode/pascal");
					else if("${post.language}"=="Perl") editor.getSession().setMode("ace/mode/perl");
					else if("${post.language}"=="pgSQL") editor.getSession().setMode("ace/mode/pgsql");
					else if("${post.language}"=="PHP (Blade Template)") editor.getSession().setMode("ace/mode/php_laravel_blade");
					else if("${post.language}"=="PHP") editor.getSession().setMode("ace/mode/php");
					else if("${post.language}"=="Puppet") editor.getSession().setMode("ace/mode/puppet");
					else if("${post.language}"=="Pig") editor.getSession().setMode("ace/mode/pig");
					else if("${post.language}"=="Powershell") editor.getSession().setMode("ace/mode/powershell");
					else if("${post.language}"=="Praat") editor.getSession().setMode("ace/mode/praat");
					else if("${post.language}"=="Prolog") editor.getSession().setMode("ace/mode/prolog");
					else if("${post.language}"=="Properties") editor.getSession().setMode("ace/mode/properties");
					else if("${post.language}"=="Protobuf") editor.getSession().setMode("ace/mode/protobuf");
					else if("${post.language}"=="Python") editor.getSession().setMode("ace/mode/python");
					else if("${post.language}"=="R") editor.getSession().setMode("ace/mode/r");
					else if("${post.language}"=="Razor") editor.getSession().setMode("ace/mode/razor");
					else if("${post.language}"=="RDoc") editor.getSession().setMode("ace/mode/rdoc");
					else if("${post.language}"=="Red") editor.getSession().setMode("ace/mode/red");
					else if("${post.language}"=="RHTML") editor.getSession().setMode("ace/mode/rhtml");
					else if("${post.language}"=="RST") editor.getSession().setMode("ace/mode/rst");
					else if("${post.language}"=="Ruby") editor.getSession().setMode("ace/mode/ruby");
					else if("${post.language}"=="Rust") editor.getSession().setMode("ace/mode/rust");
					else if("${post.language}"=="SASS") editor.getSession().setMode("ace/mode/sass");
					else if("${post.language}"=="SCAD") editor.getSession().setMode("ace/mode/scad");
					else if("${post.language}"=="Scala") editor.getSession().setMode("ace/mode/scala");
					else if("${post.language}"=="Scheme") editor.getSession().setMode("ace/mode/scheme");
					else if("${post.language}"=="SCSS") editor.getSession().setMode("ace/mode/scss");
					else if("${post.language}"=="SH") editor.getSession().setMode("ace/mode/sh");
					else if("${post.language}"=="SJS") editor.getSession().setMode("ace/mode/sjs");
					else if("${post.language}"=="Slim") editor.getSession().setMode("ace/mode/slim");
					else if("${post.language}"=="Smarty") editor.getSession().setMode("ace/mode/smarty");
					else if("${post.language}"=="snippets") editor.getSession().setMode("ace/mode/snippets");
					else if("${post.language}"=="Soy Template") editor.getSession().setMode("ace/mode/soy_template");
					else if("${post.language}"=="Space") editor.getSession().setMode("ace/mode/space");
					else if("${post.language}"=="SQL") editor.getSession().setMode("ace/mode/sql");
					else if("${post.language}"=="SQLServer") editor.getSession().setMode("ace/mode/sqlserver");
					else if("${post.language}"=="Stylus") editor.getSession().setMode("ace/mode/stylus");
					else if("${post.language}"=="SVG") editor.getSession().setMode("ace/mode/svg");
					else if("${post.language}"=="Swift") editor.getSession().setMode("ace/mode/swift");
					else if("${post.language}"=="Tcl") editor.getSession().setMode("ace/mode/tcl");
					else if("${post.language}"=="Terraform") editor.getSession().setMode("ace/mode/terraform");
					else if("${post.language}"=="Tex") editor.getSession().setMode("ace/mode/tex");
					else if("${post.language}"=="Text") editor.getSession().setMode("ace/mode/text");
					else if("${post.language}"=="Textile") editor.getSession().setMode("ace/mode/textile");
					else if("${post.language}"=="Toml") editor.getSession().setMode("ace/mode/toml");
					else if("${post.language}"=="TSX") editor.getSession().setMode("ace/mode/tsx");
					else if("${post.language}"=="Twig") editor.getSession().setMode("ace/mode/twig");
					else if("${post.language}"=="Typescript") editor.getSession().setMode("ace/mode/typescript");
					else if("${post.language}"=="Vala") editor.getSession().setMode("ace/mode/vala");
					else if("${post.language}"=="VBScript") editor.getSession().setMode("ace/mode/vbscript");
					else if("${post.language}"=="Velocity") editor.getSession().setMode("ace/mode/velocity");
					else if("${post.language}"=="Verilog") editor.getSession().setMode("ace/mode/verilog");
					else if("${post.language}"=="VHDL") editor.getSession().setMode("ace/mode/vhdl");
					else if("${post.language}"=="Wollok") editor.getSession().setMode("ace/mode/wollok");
					else if("${post.language}"=="XML") editor.getSession().setMode("ace/mode/xml");
					else if("${post.language}"=="XQuery") editor.getSession().setMode("ace/mode/xquery");
					else if("${post.language}"=="YAML") editor.getSession().setMode("ace/mode/yaml");
					else if("${post.language}"=="Django") editor.getSession().setMode("ace/mode/django");
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
				var cok=$(this).prev().prev().prev().prev()[0];
				if(cok==null){
					var editDiv3 = $('<textarea>', {
					'class': 'comme',
					'id':$(this).val()
					}).insertAfter($(this).prev().prev());
					console.log($(this).prev());
					var newcode = $('#'+$(this).val()).hide();
					var editDiv4 = $('<div>', {
					width: newcode.width(),
					height: newcode.height(),
					'class': newcode.attr('class'),
					}).insertBefore(newcode);
					$(this).prev().addClass('lb2');
					var windowWidth = $( window ).width();
					if(windowWidth <1280) {
						$(this).prev().css("margin-left","837px");
						editDiv4.css("margin-left","20px");
					} else {
						$(this).prev().css("margin-left","1398px");
						editDiv4.css("margin-left","32px");
					}
					var editor3= ace.edit(editDiv4[0]);
					editor3.setOptions({
						maxLines: 20,
						minLines: 3
					});
					$(this).attr('id', "comment_modify_ok");
					$(this).prev().prev().prev().prev().css("border", "1px solid black").attr("readonly",false);
					if(check == false)
					{
						$(this).bind('click', function(){
							var no = $(this).val();
							var post = encodeURIComponent($(this).prev().prev().prev().prev().val());
							var cod=encodeURIComponent(editor3.getSession().getValue());
							if(post == ""){
								alert('댓글 내용을 입력하세요.');
								return false;
							}
							$.ajax({
								url : "/commentModify",
								type : "POST",
								cache : false,
								data : "com_no=" + no + "&com_cont=" + post+"&com_code="+cod,
								success : function(response){
									if(response.result == 1){
											$("#new_comment").val() == ""
											location.reload();
										}
								}
							});					
						});
					}
				}else{
					$(this).attr('id', "comment_modify_ok");
					$(this).prev().prev().prev().prev().prev().css("border", "1px solid black").attr("readonly",false);
					$(this).prev().prev().prev().prev()[0].env.editor.setReadOnly(false);
					if(check == false)
					{
						$(this).bind('click', function(){
							var no = $(this).val();
							var post=encodeURIComponent($(this).prev().prev().prev().prev().prev().val());
							var cod=encodeURIComponent($(this).prev().prev().prev().prev()[0].env.editor.getSession().getValue());
							if(post == ""){
								alert('댓글 내용을 입력하세요.');
								return false;
							}
							$.ajax({
								url : "/commentModify",
								type : "POST",
								cache : false,
								data : "com_no=" + no + "&com_cont=" + post+"&com_code="+cod,
								success : function(response){
									if(response.result == 1){
										$("#new_comment").val() == ""
										location.reload();
									}
								}
							});					
						});
					}
				}
				check = true;
			});
			select.change(function(){
				var select_name = $(this).children("option:selected").text();
				editor.setTheme($(this).children("option:selected")[0].value);
				$(this).siblings("label").text(select_name);
			});	
		</script>
	</body>
</html>
