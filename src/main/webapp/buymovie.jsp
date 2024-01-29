<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DTO.Movie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% HttpSession session1 =request.getSession();%>
<%Movie movie=(Movie)session.getAttribute("movie"); %>
<form action="checkpayment" method="post">
payment<input type="number" id="price" name="movie-price" placeholder="you need to pay  <%=movie.getMovieprice()%>">
<input type="submit">pay
</form>
<%String msg =(String)request.getAttribute("messgae");%>
<%if(msg!=null){%>
<%=msg %>
<%} %>
</body>
</html>