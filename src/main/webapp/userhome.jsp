
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
	<link rel="stylesheet" href="./css/userhome.css"> 
</head>

<body>
	<div class="nav">
	   <div><h3>Movie Library</h3></div>
		<div><a class="link1" href="watchmovie">Movie Cart</a>
             <a class="link2" href="logoutuser">Log Out</a>
        </div>
	</div>

<div class="grid">
<%HttpSession session1 =request.getSession();%>
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
  <a href="buymovie?id=<%=m.getMovieid()%>">Buy</a>
    </div>
  </div>
 
</div>

<%}%>

	</div>
	
	
<script src="https://kit.fontawesome.com/f82deb100f.js" crossorigin="anonymous"></script>
</body>
</html>