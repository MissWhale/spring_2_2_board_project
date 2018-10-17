<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
	<head>
		<title>코드 공유 게시판 : 수정</title>
		<link rel="stylesheet" href="/resources/design.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/resources/read.css" type="text/css" media="screen" />
		<style>
			form > .in_block {text-align:left;}
			input[type="button"] {width:70px;height:35px;}
			input[type="submit"] {width:70px;height:35px;}
		</style>
		<script src="/resources/autosize.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.9/ace.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.1/ext-language_tools.js"></script>
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
		<form method="post" onsubmit="return checking_form()" id="write">
			<div id="select_box" class="selbox">
				<label for="color" style="top:10px;" id="langname">${post.language}</label>
					<select name="language" id="color" style="min-height: 30px;height:30px">
					<option value="ace/mode/abc">ABC</option>
						<option value="ace/mode/actionscript">ActionScript</option>
						<option value="ace/mode/ada">ADA</option>
						<option value="ace/mode/apache_conf">Apache Conf</option>
						<option value="ace/mode/asciidoc">AsciiDoc</option>
						<option value="ace/mode/asl">ASL</option>
						<option value="ace/mode/assembly_x86">Assembly x86</option>
						<option value="ace/mode/autohotkey">AutoHotKey</option>
						<option value="ace/mode/abap">ABAP</option>
						<option value="ace/mode/batchfile">BatchFile</option>
						<option value="ace/mode/bro">Bro</option>
						<option value="ace/mode/c_cpp">C and C++</option>
						<option value="ace/mode/c9search">C9Search</option>
						<option value="ace/mode/cirru">Cirru</option>
						<option value="ace/mode/clojure">Clojure</option>
						<option value="ace/mode/cobol">Cobol</option>
						<option value="ace/mode/coffee">CoffeeScript</option>
						<option value="ace/mode/coldfusion">ColdFusion</option>
						<option value="ace/mode/csharp">C#</option>
						<option value="ace/mode/csound_document">Csound Document</option>
						<option value="ace/mode/csound_orchestra">Csound</option>
						<option value="ace/mode/csound_score">Csound Score</option>
						<option value="ace/mode/css">CSS</option>
						<option value="ace/mode/curly">Curly</option>
						<option value="ace/mode/d">D</option>
						<option value="ace/mode/dart">Dart</option>
						<option value="ace/mode/diff">Diff</option>
						<option value="ace/mode/dockerfile">Dockerfile</option>
						<option value="ace/mode/dot">Dot</option>
						<option value="ace/mode/drools">Drools</option>
						<option value="ace/mode/edifact">Edifact</option>
						<option value="ace/mode/eiffel">Eiffel</option>
						<option value="ace/mode/ejs">EJS</option>
						<option value="ace/mode/elixir">Elixir</option>
						<option value="ace/mode/elm">Elm</option>
						<option value="ace/mode/erlang">Erlang</option>
						<option value="ace/mode/forth">Forth</option>
						<option value="ace/mode/fortran">Fortran</option>
						<option value="ace/mode/fsharp">FSharp</option>
						<option value="ace/mode/ftl">FreeMarker</option>
						<option value="ace/mode/gcode">Gcode</option>
						<option value="ace/mode/gherkin">Gherkin</option>
						<option value="ace/mode/gitignore">Gitignore</option>
						<option value="ace/mode/glsl">Glsl</option>
						<option value="ace/mode/gobstones">Gobstones</option>
						<option value="ace/mode/golang">Go</option>
						<option value="ace/mode/graphqlschema">GraphQLSchema</option>
						<option value="ace/mode/groovy">Groovy</option>
						<option value="ace/mode/haml">HAML</option>
						<option value="ace/mode/handlebars">Handlebars</option>
						<option value="ace/mode/haskell">Haskell</option>
						<option value="ace/mode/haskell_cabal">Haskell Cabal</option>
						<option value="ace/mode/haxe">haXe</option>
						<option value="ace/mode/hjson">Hjson</option>
						<option value="ace/mode/html">HTML</option>
						<option value="ace/mode/html_elixir">HTML (Elixir)</option>
						<option value="ace/mode/html_ruby">HTML (Ruby)</option>
						<option value="ace/mode/ini">INI</option>
						<option value="ace/mode/io">Io</option>
						<option value="ace/mode/jack">Jack</option>
						<option value="ace/mode/jade">Jade</option>
						<option value="ace/mode/java">Java</option>
						<option value="ace/mode/javascript">JavaScript</option>
						<option value="ace/mode/json">JSON</option>
						<option value="ace/mode/jsoniq">JSONiq</option>
						<option value="ace/mode/jsp">JSP</option>
						<option value="ace/mode/jssm">JSSM</option>
						<option value="ace/mode/jsx">JSX</option>
						<option value="ace/mode/julia">Julia</option>
						<option value="ace/mode/kotlin">Kotlin</option>
						<option value="ace/mode/latex">LaTeX</option>
						<option value="ace/mode/less">LESS</option>
						<option value="ace/mode/liquid">Liquid</option>
						<option value="ace/mode/lisp">Lisp</option>
						<option value="ace/mode/livescript">LiveScript</option>
						<option value="ace/mode/logiql">LogiQL</option>
						<option value="ace/mode/lsl">LSL</option>
						<option value="ace/mode/lua">Lua</option>
						<option value="ace/mode/luapage">LuaPage</option>
						<option value="ace/mode/lucene">Lucene</option>
						<option value="ace/mode/makefile">Makefile</option>
						<option value="ace/mode/markdown">Markdown</option>
						<option value="ace/mode/mask">Mask</option>
						<option value="ace/mode/matlab">MATLAB</option>
						<option value="ace/mode/maze">Maze</option>
						<option value="ace/mode/mel">MEL</option>
						<option value="ace/mode/mixal">MIXAL</option>
						<option value="ace/mode/mushcode">MUSHCode</option>
						<option value="ace/mode/mysql">MySQL</option>
						<option value="ace/mode/nix">Nix</option>
						<option value="ace/mode/nsis">NSIS</option>
						<option value="ace/mode/objectivec">Objective-C</option>
						<option value="ace/mode/ocaml">OCaml</option>
						<option value="ace/mode/pascal">Pascal</option>
						<option value="ace/mode/perl">Perl</option>
						<option value="ace/mode/pgsql">pgSQL</option>
						<option value="ace/mode/php_laravel_blade">PHP (Blade Template)</option>
						<option value="ace/mode/php">PHP</option>
						<option value="ace/mode/puppet">Puppet</option>
						<option value="ace/mode/pig">Pig</option>
						<option value="ace/mode/powershell">Powershell</option>
						<option value="ace/mode/praat">Praat</option>
						<option value="ace/mode/prolog">Prolog</option>
						<option value="ace/mode/properties">Properties</option>
						<option value="ace/mode/protobuf">Protobuf</option>
						<option value="ace/mode/python">Python</option>
						<option value="ace/mode/r">R</option>
						<option value="ace/mode/razor">Razor</option>
						<option value="ace/mode/rdoc">RDoc</option>
						<option value="ace/mode/red">Red</option>
						<option value="ace/mode/rhtml">RHTML</option>
						<option value="ace/mode/rst">RST</option>
						<option value="ace/mode/ruby">Ruby</option>
						<option value="ace/mode/rust">Rust</option>
						<option value="ace/mode/sass">SASS</option>
						<option value="ace/mode/scad">SCAD</option>
						<option value="ace/mode/scala">Scala</option>
						<option value="ace/mode/scheme">Scheme</option>
						<option value="ace/mode/scss">SCSS</option>
						<option value="ace/mode/sh">SH</option>
						<option value="ace/mode/sjs">SJS</option>
						<option value="ace/mode/slim">Slim</option>
						<option value="ace/mode/smarty">Smarty</option>
						<option value="ace/mode/snippets">snippets</option>
						<option value="ace/mode/soy_template">Soy Template</option>
						<option value="ace/mode/space">Space</option>
						<option value="ace/mode/sql">SQL</option>
						<option value="ace/mode/sqlserver">SQLServer</option>
						<option value="ace/mode/stylus">Stylus</option>
						<option value="ace/mode/svg">SVG</option>
						<option value="ace/mode/swift">Swift</option>
						<option value="ace/mode/tcl">Tcl</option>
						<option value="ace/mode/terraform">Terraform</option>
						<option value="ace/mode/tex">Tex</option>
						<option value="ace/mode/text">Text</option>
						<option value="ace/mode/textile">Textile</option>
						<option value="ace/mode/toml">Toml</option>
						<option value="ace/mode/tsx">TSX</option>
						<option value="ace/mode/twig">Twig</option>
						<option value="ace/mode/typescript">Typescript</option>
						<option value="ace/mode/vala">Vala</option>
						<option value="ace/mode/vbscript">VBScript</option>
						<option value="ace/mode/velocity">Velocity</option>
						<option value="ace/mode/verilog">Verilog</option>
						<option value="ace/mode/vhdl">VHDL</option>
						<option value="ace/mode/wollok">Wollok</option>
						<option value="ace/mode/xml">XML</option>
						<option value="ace/mode/xquery">XQuery</option>
						<option value="ace/mode/yaml">YAML</option>
						<option value="ace/mode/django">Django</option>
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
				<input type="hidden" value="${post.bno}" name="bno">
				<div class="in_block">
					<input type="text" name="title" style="height: 30px;" value="<c:out value="${post.title}"></c:out>" name="title">
				</div>
				<div style="margin-top: 20px;">
					<textarea name="body" id="writebody" style="height:200px;" placeholder="내용"><c:out value="${post.body}"></c:out></textarea>
					<textarea name="code" data-editor="sql"  id="input" data-gutter="1" rows="15" ><c:out value="${post.code}"></c:out></textarea>
				</div>
				<div id="wrbtn">		
					<button type="button" onclick="checking_form()">완료</button>
					<button type="button" onclick='back()'>취소</button>
				</div>
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
			select.change(function(){
				var select_name = $(this).children("option:selected").text();
				$(this).siblings("label").text(select_name);
				if($("#langname")[0].innerHTML=="ABC") editor.getSession().setMode("ace/mode/abc");
				else if($("#langname")[0].innerHTML=="ActionScript") editor.getSession().setMode("ace/mode/actionscript");
				else if($("#langname")[0].innerHTML=="ADA") editor.getSession().setMode("ace/mode/ada");
				else if($("#langname")[0].innerHTML=="Apache Conf") editor.getSession().setMode("ace/mode/apache_conf");
				else if($("#langname")[0].innerHTML=="AsciiDoc") editor.getSession().setMode("ace/mode/asciidoc");
				else if($("#langname")[0].innerHTML=="ASL") editor.getSession().setMode("ace/mode/asl");
				else if($("#langname")[0].innerHTML=="Assembly x86") editor.getSession().setMode("ace/mode/assembly_x86");
				else if($("#langname")[0].innerHTML=="AutoHotKey") editor.getSession().setMode("ace/mode/autohotkey");
				else if($("#langname")[0].innerHTML=="ABAP") editor.getSession().setMode("ace/mode/abap");
				else if($("#langname")[0].innerHTML=="BatchFile") editor.getSession().setMode("ace/mode/batchfile");
				else if($("#langname")[0].innerHTML=="Bro") editor.getSession().setMode("ace/mode/bro");
				else if($("#langname")[0].innerHTML=="C and C++") editor.getSession().setMode("ace/mode/c_cpp");
				else if($("#langname")[0].innerHTML=="C9Search") editor.getSession().setMode("ace/mode/c9search");
				else if($("#langname")[0].innerHTML=="Cirru") editor.getSession().setMode("ace/mode/cirru");
				else if($("#langname")[0].innerHTML=="Clojure") editor.getSession().setMode("ace/mode/clojure");
				else if($("#langname")[0].innerHTML=="Cobol") editor.getSession().setMode("ace/mode/cobol");
				else if($("#langname")[0].innerHTML=="CoffeeScript") editor.getSession().setMode("ace/mode/coffee");
				else if($("#langname")[0].innerHTML=="ColdFusion") editor.getSession().setMode("ace/mode/coldfusion");
				else if($("#langname")[0].innerHTML=="C#") editor.getSession().setMode("ace/mode/csharp");
				else if($("#langname")[0].innerHTML=="Csound Document") editor.getSession().setMode("ace/mode/csound_document");
				else if($("#langname")[0].innerHTML=="Csound") editor.getSession().setMode("ace/mode/csound_orchestra");
				else if($("#langname")[0].innerHTML=="Csound Score") editor.getSession().setMode("ace/mode/csound_score");
				else if($("#langname")[0].innerHTML=="CSS") editor.getSession().setMode("ace/mode/css");
				else if($("#langname")[0].innerHTML=="Curly") editor.getSession().setMode("ace/mode/curly");
				else if($("#langname")[0].innerHTML=="D") editor.getSession().setMode("ace/mode/d");
				else if($("#langname")[0].innerHTML=="Dart") editor.getSession().setMode("ace/mode/dart");
				else if($("#langname")[0].innerHTML=="Diff") editor.getSession().setMode("ace/mode/diff");
				else if($("#langname")[0].innerHTML=="Dockerfile") editor.getSession().setMode("ace/mode/dockerfile");
				else if($("#langname")[0].innerHTML=="Dot") editor.getSession().setMode("ace/mode/dot");
				else if($("#langname")[0].innerHTML=="Drools") editor.getSession().setMode("ace/mode/drools");
				else if($("#langname")[0].innerHTML=="Edifact") editor.getSession().setMode("ace/mode/edifact");
				else if($("#langname")[0].innerHTML=="Eiffel") editor.getSession().setMode("ace/mode/eiffel");
				else if($("#langname")[0].innerHTML=="EJS") editor.getSession().setMode("ace/mode/ejs");
				else if($("#langname")[0].innerHTML=="Elixir") editor.getSession().setMode("ace/mode/elixir");
				else if($("#langname")[0].innerHTML=="Elm") editor.getSession().setMode("ace/mode/elm");
				else if($("#langname")[0].innerHTML=="Erlang") editor.getSession().setMode("ace/mode/erlang");
				else if($("#langname")[0].innerHTML=="Forth") editor.getSession().setMode("ace/mode/forth");
				else if($("#langname")[0].innerHTML=="Fortran") editor.getSession().setMode("ace/mode/fortran");
				else if($("#langname")[0].innerHTML=="FSharp") editor.getSession().setMode("ace/mode/fsharp");
				else if($("#langname")[0].innerHTML=="FreeMarker") editor.getSession().setMode("ace/mode/ftl");
				else if($("#langname")[0].innerHTML=="Gcode") editor.getSession().setMode("ace/mode/gcode");
				else if($("#langname")[0].innerHTML=="Gherkin") editor.getSession().setMode("ace/mode/gherkin");
				else if($("#langname")[0].innerHTML=="Gitignore") editor.getSession().setMode("ace/mode/gitignore");
				else if($("#langname")[0].innerHTML=="Glsl") editor.getSession().setMode("ace/mode/glsl");
				else if($("#langname")[0].innerHTML=="Gobstones") editor.getSession().setMode("ace/mode/gobstones");
				else if($("#langname")[0].innerHTML=="Go") editor.getSession().setMode("ace/mode/golang");
				else if($("#langname")[0].innerHTML=="GraphQLSchema") editor.getSession().setMode("ace/mode/graphqlschema");
				else if($("#langname")[0].innerHTML=="Groovy") editor.getSession().setMode("ace/mode/groovy");
				else if($("#langname")[0].innerHTML=="HAML") editor.getSession().setMode("ace/mode/haml");
				else if($("#langname")[0].innerHTML=="Handlebars") editor.getSession().setMode("ace/mode/handlebars");
				else if($("#langname")[0].innerHTML=="Haskell") editor.getSession().setMode("ace/mode/haskell");
				else if($("#langname")[0].innerHTML=="Haskell Cabal") editor.getSession().setMode("ace/mode/haskell_cabal");
				else if($("#langname")[0].innerHTML=="haXe") editor.getSession().setMode("ace/mode/haxe");
				else if($("#langname")[0].innerHTML=="Hjson") editor.getSession().setMode("ace/mode/hjson");
				else if($("#langname")[0].innerHTML=="HTML") editor.getSession().setMode("ace/mode/html");
				else if($("#langname")[0].innerHTML=="HTML (Elixir)") editor.getSession().setMode("ace/mode/html_elixir");
				else if($("#langname")[0].innerHTML=="HTML (Ruby)") editor.getSession().setMode("ace/mode/html_ruby");
				else if($("#langname")[0].innerHTML=="INI") editor.getSession().setMode("ace/mode/ini");
				else if($("#langname")[0].innerHTML=="Io") editor.getSession().setMode("ace/mode/io");
				else if($("#langname")[0].innerHTML=="Jack") editor.getSession().setMode("ace/mode/jack");
				else if($("#langname")[0].innerHTML=="Jade") editor.getSession().setMode("ace/mode/jade");
				else if($("#langname")[0].innerHTML=="Java") editor.getSession().setMode("ace/mode/java");
				else if($("#langname")[0].innerHTML=="JavaScript") editor.getSession().setMode("ace/mode/javascript");
				else if($("#langname")[0].innerHTML=="JSON") editor.getSession().setMode("ace/mode/json");
				else if($("#langname")[0].innerHTML=="JSONiq") editor.getSession().setMode("ace/mode/jsoniq");
				else if($("#langname")[0].innerHTML=="JSP") editor.getSession().setMode("ace/mode/jsp");
				else if($("#langname")[0].innerHTML=="JSSM") editor.getSession().setMode("ace/mode/jssm");
				else if($("#langname")[0].innerHTML=="JSX") editor.getSession().setMode("ace/mode/jsx");
				else if($("#langname")[0].innerHTML=="Julia") editor.getSession().setMode("ace/mode/julia");
				else if($("#langname")[0].innerHTML=="Kotlin") editor.getSession().setMode("ace/mode/kotlin");
				else if($("#langname")[0].innerHTML=="LaTeX") editor.getSession().setMode("ace/mode/latex");
				else if($("#langname")[0].innerHTML=="LESS") editor.getSession().setMode("ace/mode/less");
				else if($("#langname")[0].innerHTML=="Liquid") editor.getSession().setMode("ace/mode/liquid");
				else if($("#langname")[0].innerHTML=="Lisp") editor.getSession().setMode("ace/mode/lisp");
				else if($("#langname")[0].innerHTML=="LiveScript") editor.getSession().setMode("ace/mode/livescript");
				else if($("#langname")[0].innerHTML=="LogiQL") editor.getSession().setMode("ace/mode/logiql");
				else if($("#langname")[0].innerHTML=="LSL") editor.getSession().setMode("ace/mode/lsl");
				else if($("#langname")[0].innerHTML=="Lua") editor.getSession().setMode("ace/mode/lua");
				else if($("#langname")[0].innerHTML=="LuaPage") editor.getSession().setMode("ace/mode/luapage");
				else if($("#langname")[0].innerHTML=="Lucene") editor.getSession().setMode("ace/mode/lucene");
				else if($("#langname")[0].innerHTML=="Makefile") editor.getSession().setMode("ace/mode/makefile");
				else if($("#langname")[0].innerHTML=="Markdown") editor.getSession().setMode("ace/mode/markdown");
				else if($("#langname")[0].innerHTML=="Mask") editor.getSession().setMode("ace/mode/mask");
				else if($("#langname")[0].innerHTML=="MATLAB") editor.getSession().setMode("ace/mode/matlab");
				else if($("#langname")[0].innerHTML=="Maze") editor.getSession().setMode("ace/mode/maze");
				else if($("#langname")[0].innerHTML=="MEL") editor.getSession().setMode("ace/mode/mel");
				else if($("#langname")[0].innerHTML=="MIXAL") editor.getSession().setMode("ace/mode/mixal");
				else if($("#langname")[0].innerHTML=="MUSHCode") editor.getSession().setMode("ace/mode/mushcode");
				else if($("#langname")[0].innerHTML=="MySQL") editor.getSession().setMode("ace/mode/mysql");
				else if($("#langname")[0].innerHTML=="Nix") editor.getSession().setMode("ace/mode/nix");
				else if($("#langname")[0].innerHTML=="NSIS") editor.getSession().setMode("ace/mode/nsis");
				else if($("#langname")[0].innerHTML=="Objective-C") editor.getSession().setMode("ace/mode/objectivec");
				else if($("#langname")[0].innerHTML=="OCaml") editor.getSession().setMode("ace/mode/ocaml");
				else if($("#langname")[0].innerHTML=="Pascal") editor.getSession().setMode("ace/mode/pascal");
				else if($("#langname")[0].innerHTML=="Perl") editor.getSession().setMode("ace/mode/perl");
				else if($("#langname")[0].innerHTML=="pgSQL") editor.getSession().setMode("ace/mode/pgsql");
				else if($("#langname")[0].innerHTML=="PHP (Blade Template)") editor.getSession().setMode("ace/mode/php_laravel_blade");
				else if($("#langname")[0].innerHTML=="PHP") editor.getSession().setMode("ace/mode/php");
				else if($("#langname")[0].innerHTML=="Puppet") editor.getSession().setMode("ace/mode/puppet");
				else if($("#langname")[0].innerHTML=="Pig") editor.getSession().setMode("ace/mode/pig");
				else if($("#langname")[0].innerHTML=="Powershell") editor.getSession().setMode("ace/mode/powershell");
				else if($("#langname")[0].innerHTML=="Praat") editor.getSession().setMode("ace/mode/praat");
				else if($("#langname")[0].innerHTML=="Prolog") editor.getSession().setMode("ace/mode/prolog");
				else if($("#langname")[0].innerHTML=="Properties") editor.getSession().setMode("ace/mode/properties");
				else if($("#langname")[0].innerHTML=="Protobuf") editor.getSession().setMode("ace/mode/protobuf");
				else if($("#langname")[0].innerHTML=="Python") editor.getSession().setMode("ace/mode/python");
				else if($("#langname")[0].innerHTML=="R") editor.getSession().setMode("ace/mode/r");
				else if($("#langname")[0].innerHTML=="Razor") editor.getSession().setMode("ace/mode/razor");
				else if($("#langname")[0].innerHTML=="RDoc") editor.getSession().setMode("ace/mode/rdoc");
				else if($("#langname")[0].innerHTML=="Red") editor.getSession().setMode("ace/mode/red");
				else if($("#langname")[0].innerHTML=="RHTML") editor.getSession().setMode("ace/mode/rhtml");
				else if($("#langname")[0].innerHTML=="RST") editor.getSession().setMode("ace/mode/rst");
				else if($("#langname")[0].innerHTML=="Ruby") editor.getSession().setMode("ace/mode/ruby");
				else if($("#langname")[0].innerHTML=="Rust") editor.getSession().setMode("ace/mode/rust");
				else if($("#langname")[0].innerHTML=="SASS") editor.getSession().setMode("ace/mode/sass");
				else if($("#langname")[0].innerHTML=="SCAD") editor.getSession().setMode("ace/mode/scad");
				else if($("#langname")[0].innerHTML=="Scala") editor.getSession().setMode("ace/mode/scala");
				else if($("#langname")[0].innerHTML=="Scheme") editor.getSession().setMode("ace/mode/scheme");
				else if($("#langname")[0].innerHTML=="SCSS") editor.getSession().setMode("ace/mode/scss");
				else if($("#langname")[0].innerHTML=="SH") editor.getSession().setMode("ace/mode/sh");
				else if($("#langname")[0].innerHTML=="SJS") editor.getSession().setMode("ace/mode/sjs");
				else if($("#langname")[0].innerHTML=="Slim") editor.getSession().setMode("ace/mode/slim");
				else if($("#langname")[0].innerHTML=="Smarty") editor.getSession().setMode("ace/mode/smarty");
				else if($("#langname")[0].innerHTML=="snippets") editor.getSession().setMode("ace/mode/snippets");
				else if($("#langname")[0].innerHTML=="Soy Template") editor.getSession().setMode("ace/mode/soy_template");
				else if($("#langname")[0].innerHTML=="Space") editor.getSession().setMode("ace/mode/space");
				else if($("#langname")[0].innerHTML=="SQL") editor.getSession().setMode("ace/mode/sql");
				else if($("#langname")[0].innerHTML=="SQLServer") editor.getSession().setMode("ace/mode/sqlserver");
				else if($("#langname")[0].innerHTML=="Stylus") editor.getSession().setMode("ace/mode/stylus");
				else if($("#langname")[0].innerHTML=="SVG") editor.getSession().setMode("ace/mode/svg");
				else if($("#langname")[0].innerHTML=="Swift") editor.getSession().setMode("ace/mode/swift");
				else if($("#langname")[0].innerHTML=="Tcl") editor.getSession().setMode("ace/mode/tcl");
				else if($("#langname")[0].innerHTML=="Terraform") editor.getSession().setMode("ace/mode/terraform");
				else if($("#langname")[0].innerHTML=="Tex") editor.getSession().setMode("ace/mode/tex");
				else if($("#langname")[0].innerHTML=="Text") editor.getSession().setMode("ace/mode/text");
				else if($("#langname")[0].innerHTML=="Textile") editor.getSession().setMode("ace/mode/textile");
				else if($("#langname")[0].innerHTML=="Toml") editor.getSession().setMode("ace/mode/toml");
				else if($("#langname")[0].innerHTML=="TSX") editor.getSession().setMode("ace/mode/tsx");
				else if($("#langname")[0].innerHTML=="Twig") editor.getSession().setMode("ace/mode/twig");
				else if($("#langname")[0].innerHTML=="Typescript") editor.getSession().setMode("ace/mode/typescript");
				else if($("#langname")[0].innerHTML=="Vala") editor.getSession().setMode("ace/mode/vala");
				else if($("#langname")[0].innerHTML=="VBScript") editor.getSession().setMode("ace/mode/vbscript");
				else if($("#langname")[0].innerHTML=="Velocity") editor.getSession().setMode("ace/mode/velocity");
				else if($("#langname")[0].innerHTML=="Verilog") editor.getSession().setMode("ace/mode/verilog");
				else if($("#langname")[0].innerHTML=="VHDL") editor.getSession().setMode("ace/mode/vhdl");
				else if($("#langname")[0].innerHTML=="Wollok") editor.getSession().setMode("ace/mode/wollok");
				else if($("#langname")[0].innerHTML=="XML") editor.getSession().setMode("ace/mode/xml");
				else if($("#langname")[0].innerHTML=="XQuery") editor.getSession().setMode("ace/mode/xquery");
				else if($("#langname")[0].innerHTML=="YAML") editor.getSession().setMode("ace/mode/yaml");
				else if($("#langname")[0].innerHTML=="Django") editor.getSession().setMode("ace/mode/django");
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
					editor.setTheme("ace/theme/idle_fingers");
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
			function back() {
				href = "/board/read?bno=" + ${post.bno};
				location.href = href;
			}
			function checking_form() {
				var form = document.forms[0];
				var title=form.title.value;
				form.code.value=editor.getValue();
				var code=form.code.value;
				$("#color option:selected")[0].value=$('#langname')[0].innerText;
				console.log($("#color option:selected")[0].value);
				if(title == ""){
					alert("제목을 적어주세요");
					return false;
				}else if(title.length >50){
					alert("제목은 최대 50글자까지 가능합니다")
					return false;
				}else if(code == ""){
					alert('내용을 채워주세요');
					return false;
				}
				form.submit();
			}
			select1.change(function(){
				var select_name = $(this).children("option:selected").text();
				editor.setTheme($(this).children("option:selected")[0].value);
				$(this).siblings("label").text(select_name);
			});		
		</script>
	</body>
</html>
