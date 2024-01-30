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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<link rel="stylesheet" href="./css/adminhome.css"> 
</head>

<body>
	<div >
	<h1>Admin home:</h1>
	<div class="flex">
<h4><a class="link1" href="addmovie.jsp">Add movie</a></h4>
<h4><a class="link2"href="logoutadmin">LogOut</a></h4>
	</div>

<% List<Movie>  movies = (List)request.getAttribute("movies");%>

<table class="table-responsive table align-middle border border-black table-danger">
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
<td><a href="deletemovie?id=<%=m.getMovieid()%>">Delete</a></td>
<td><a href="editmovie?id=<%=m.getMovieid()%>">Edit</a></td>

</tr>

<%}%>

</table>
	
	</div>
</body>
</html>