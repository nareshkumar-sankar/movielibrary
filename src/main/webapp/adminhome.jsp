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
	<link rel="stylesheet" href="./css/adminhome-.css"> 
</head>

<body>
	<div class="nav">
	   <div><h3>Admin Home</h3></div>
		<div><a class="link1" href="addmovie.jsp">Add movie</a>
        <a class="link2"href="logoutadmin">LogOut</a></div>
	</div>

<div class="grid">
<% List<Movie>  movies = (List)request.getAttribute("movies");%>


<%for(Movie m : movies){ %>




	<div class="container">
  <div class="poster">
    <div class="poster__img">
    <%String base64image = new String(Base64.getEncoder().encode(m.getMovieimage())); %>
<img src="data:image/jpeg;base64,<%=base64image%>" height="200px" width="200px">
    </div>
    <div class="poster__info">
      <h1 class="poster__title title"><%=m.getMoviename() %></h1>
      <h5><span><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star-half"></i><%=m.getMovieratings() %></span></h5>
      <span>$<%=m.getMovieprice() %></span>
      <span><%=m.getMoviegenre() %></span>
      <span><%=m.getMovielanguage() %></span>
      <h3 class="head">SUMMARY</h3>
      <p class="dpn"><%=m.getMoviedescription() %></p>
       <a href="deletemovie?id=<%=m.getMovieid()%>">Delete</a>
  <a href="editmovie?id=<%=m.getMovieid()%>">Edit</a>
    </div>
  </div>
 
</div>

<%}%>

	</div>
	
	
<script src="https://kit.fontawesome.com/f82deb100f.js" crossorigin="anonymous"></script>
</body>
</html>