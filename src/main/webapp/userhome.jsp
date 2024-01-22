<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="DTO.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

<% List<Movie>  movies = (List)request.getAttribute("movies");%>

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

<td><button><a href="buymovie?id=<%=m.getMovieid()%>">Buy</a></button></td>

</tr>

<%}%>

</table>
</body>
</html>