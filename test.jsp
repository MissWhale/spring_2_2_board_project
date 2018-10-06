<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>
<head>
<link rel="stylesheet" href="/resources/style.css" type="text/css"media="screen" />
<title>프로젝트</title>
      <style>
         .mytable { border-collapse:collapse; }  
         .mytable th, .mytable td { border:1px solid black; }
         .clear {clear:both;}
         td:nth-child(1), td:nth-child(3),td:nth-child(4),td:nth-child(5) {width:10%; }
         th:nth-child(1), th:nth-child(3),th:nth-child(4),th:nth-child(5) {width:10%; }
         a {text-decoration:none;}
         select {width:100px;font-size:16px;}
         input[type="submit"] {width:90px;}
         p + div > form > * {display:inline;vertical-align:middle;height:27px;}
         p + div {margin-top:25px !important;}
         a:link{color:black; text-decoration: none;}
         a:visited{color:black; text-decoration:none;}
      </style>
</head>
<body>
   <div>
      <div id="logbtn">
         <c:choose>
            <c:when test='${session == "yes"}'>
            <div>
            <p style="margin-top: 60px;margin-bottom: -69px;margin-left: 79%;">${sessionScope.id}님 환영합니다!!</p>
            </div>
               <button id="logout" style = "float: right; margin-right: 40;">로그아웃</button>
            </c:when>
            <c:otherwise>
               <button type="button" id="login" style="float: right; "> 로그인</button>
            </c:otherwise>
         </c:choose>
      </div>
   </div>
      <a href="/" class="button" style =" font-size: 40; margin-left: 450">패션 정보 공유 게시판</a>
      
   <div id="topbtn">
        <hr>
       <button type="button" id="map">게시판</button>
       <hr>
    </div>
    
      <div style="width:90%;margin:0 auto;">
         <form method="get">
            <select name="searchType">
               <option value="null" <c:if test="${search.searchType == 'null'}">selected</c:if> >분류</option>
               <option value="title" <c:if test="${search.searchType == 'title'}">selected</c:if> >제목</option>
               <option value="writer" <c:if test="${search.searchType == 'writer'}">selected</c:if> >작성자</option>
            </select>
            <input type="text" name="search" value="${search.search }">
            <input type="submit" value="검색">
         </form>
      </div>

   <br />
   <div style="width:90%;margin:0 auto;">
         <table class="mytable" style="width:100%;">
            <thead>
               <tr style="height:40px;border-bottom:3px solid black;">
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
                  <th style="width: 60px;">UP</th>
                  <th style="width: 60px;">DOWN</th>
               </tr>
            </thead>
            <tbody>
               <c:choose>
                  <c:when test="${!empty page}">
                     <c:forEach items="${page}" var="board">
                        <tr style="text-align:center;height:35px;">
                           <td>${board.bno}</td>
                           <td><a href="javascript:read_page_process(${board.bno})">${board.title}</a></td>
                           <td>${board.writer}</td>
                           <td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd"/></td>
                           <td>${board.hits}</td>
                           <td>${board.up}</td>
                           <td>${board.down}</td>
                        </tr>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <tr style="text-align:center;height:35px;">
                        <td colspan="5">게시글이 없습니다.</td>
                     </tr>
                  </c:otherwise>
               </c:choose>
            </tbody>
         </table>
         <br />
         <c:if test="${pager.numberOfRecords != 0}">
            <div style="width:50%;margin:0 auto;text-align:center;">
               <c:if test="${pager.currentPageNo != 1}">
                  <a href="javascript:page_locate(${pager.prevPageNo}, ${pager.maxPost})">이전</a>
               </c:if>&nbsp;
               <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1">
                  <c:choose>
                     <c:when test="${i != pager.currentPageNo}">
                        <a href="javascript:page_locate(${i}, ${pager.maxPost})">
                           <c:out value="${i}"></c:out>
                        </a>&nbsp;
                     </c:when>
                     <c:otherwise>
                        <c:out value="${i}"></c:out>
                        &nbsp;
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
               <c:if test="${pager.currentPageNo < pager.nextPageNo}">
                  <a href="javascript:page_locate(${pager.nextPageNo}, ${pager.maxPost})">다음</a>
               </c:if>
            </div>
         </c:if>
         <br />
         <div>
            <button type="button" style="float:right;width:90px;height:30px;" onclick="new_write()">글쓰기</button>
         </div>
         <div class="clear"></div>
      </div>
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
   <script>
      $("#logout").click(function(){
         location.href = "/logout";
      })
   
      $("#map").click(function(){
         location.href = "/board/board";
      })
      function logname() {
         href = "/login/login";
      }
      
      function new_write() {
         href = "/board/write?";
         href += "&currentPageNo=" + ${pager.currentPageNo}+"&maxPost=" + ${pager.maxPost};
         href += "&search=" + "${search.search}" + "&searchType="+ "${search.searchType}";
         location.href = href;
      }
      function page_locate(page, perpagenum) {
         href = "?currentPageNo=" + page + "&maxPost=" + perpagenum;
         href += "&search=" + "${search.search}" + "&searchType="
               + "${search.searchType}";
         location.href = href;
      }
      function read_page_process(bno) {
         href = "/board/read?bno=" + bno;
         href += "&currentPageNo=" + ${pager.currentPageNo}+"&maxPost=" + ${pager.maxPost};
         href += "&search=" + "${search.search}" + "&searchType="+ "${search.searchType}";
         location.href = href;
      }
      jQuery(document).ready(function(){
          
          var select = $("select#color");
          
          select.change(function(){
              var select_name = $(this).children("option:selected").text();
              $(this).siblings("label").text(select_name);
          });
      });
      $(document).ready(function() { 
         var placeholderTarget = $('.textbox input[type="text"]'); 
         //포커스시
         placeholderTarget.on('focus', function(){ 
            $(this).siblings('label').fadeOut('fast'); 
         }); 
         //포커스아웃시
         placeholderTarget.on('focusout', function(){ 
            if($(this).val() == ''){ 
               $(this).siblings('label').fadeIn('fast'); 
               } 
            }); 
         });
      console.log('${pager.currentPageNo}');
      if($('.textbox input[type="text"]').val()!=''){
         $('.textbox input[type="text"]').siblings('label').fadeOut('fast'); 
      };
      var target="."+${pager.currentPageNo}
      console.log(target);
      $(target).css("color","#fff");
      $(target).css("background","#1278ed");
      $(target).css("border","#1px solid #4c8500");

   </script>
</body>
</html>