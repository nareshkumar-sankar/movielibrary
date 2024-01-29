<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="DTO.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table,td,th{
border: 2px solid black;
border-collapse: collapse;
text-align: center;
}
th,td{
padding: 5px;
}
a{
text-decoration: none;
}
</style>
</head>
<body>
	<h1>user home:</h1>
<%HttpSession session1 =request.getSession();%>
<% List<Movie>  movies = (List)request.getAttribute("movies");%>

<a href="watchmovie">Watch Movies</a>
<a href="logout">Log Out</a>
<br>
<%String msg =(String)request.getAttribute("message"); %>
 <%if(msg!=null){ %>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
   <%=msg%>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
 <%} %></h3>
<table>
<tr>

<th>Id</th>
<th>Name</th>
<th>Price</th>
<th>Ratings</th>
<th>Genre</th>
<th>Language</th>
<th>Image</th>
<th>BuyMovies</th>


</tr>
<%for(Movie m : movies){ %>
<tr>

<td><%=m.getMovieid()%></td>
<td><%=m.getMoviename() %></td>
<td><%=m.getMovieprice() %></td>
<td><%=m.getMovieratings() %></td>
<td><%=m.getMoviegenre() %></td>
<td><%=m.getMovielanguage() %></td>
<%String base64image = new String(Base64.getEncoder().encode(m.getMovieimage())); %>
<td><img src="data:image/jpeg;base64,<%=base64image%>" height="200px" width="200px"></td>

<td><button><a href="buymovie?id=<%=m.getMovieid()%>">Buy</a></button>
</td>

</tr>

<%}%>

</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>