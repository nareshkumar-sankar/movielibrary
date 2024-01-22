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
width: 100vh;
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
	<h1>Admin home:</h1>
<h4><a href="addmovie.jsp">Add movie</a></h4>
<br>
<br>
<h4><a href="logout">LogOut</a></h4>
<br>
<br>
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
<th>Delete</th>
<th>Edit</th>

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

<td><button><a href="deletemovie?id=<%=m.getMovieid()%>">Delete</a></button></td>
<td><button><a href="editmovie?id=<%=m.getMovieid()%>">Edit</a></button></td>

</tr>

<%}%>

</table>
</body>
</html>