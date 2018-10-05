<%-- <%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%!
    int a=100; 
%>
<html>
<head>
        <title>Home</title>
    </head>
    <body>
    <h1>
        Hello world!  
    </h1>

    <P> 시간${serverTime}. </P>
    </body>
</html> --%>
<%@ page import="MyEcho.Echo" contentType="text/html; charset=euc-kr" %>
<jsp:useBean id="myEcho" class="MyEcho.Echo" scope="page"/>
<jsp:setProperty name="myEcho" property="msg"/>
<%
    out.print("빈즈내용"+myEcho.getMsg[]+"<BR>");
%>