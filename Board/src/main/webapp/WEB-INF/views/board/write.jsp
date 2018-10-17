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
				<label for="color" style="top:10px" id="langname" >ABC</label>
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
			$( window ).resize(function() {
				var windowWidth = $( window ).width();
				console.log(windowWidth);
				if(windowWidth <1280) {
					$(editDiv).css( 'width', '1060px' );
				} else {
					$(editDiv).css( 'width', '1604px' );
				}
			});
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
				$("#color option:selected")[0].value=$('#langname')[0].innerText;
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
				console.log($(this)[0].value);
				editor.getSession().setMode($(this)[0].value);
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