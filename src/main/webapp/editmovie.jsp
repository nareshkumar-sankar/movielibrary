<%@page import="java.util.Base64"%>
<%@page import="DTO.Movie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<% Movie m = (Movie)request.getAttribute("movie");  %>

	<form action="updatemovie" method="post" enctype="multipart/form-data">
	    <label for="id">Id:</label>
	    <input type="number" name="user-id" id="id" value="<%= m.getMovieid() %>" readonly><br>
	     <label for="name">Name:</label>
		<input type="text" name="user-name" id="name" value="<%= m.getMoviename() %>"><br>
		 <label for="price">Price:</label>
		<input type="number" name="user-price" id="price" value="<%= m.getMovieprice() %>"><br>
		 <label for="ratings">Ratings:</label>
		<input type="number" name="user-ratings" id="ratings" value="<%= m.getMovieratings() %>"><br>
		 <label for="genre">Genre:</label>
		<input type="text" name="user-genre" id="genre" value="<%= m.getMoviegenre() %>"><br>
		 <label for="language">Language:</label>
		<input type="text" name="user-language" id="language" value="<%= m.getMovielanguage() %>"><br>
		 <label for="image">Image:</label>
		<input type="file" name="user-image" id="image"><br>
		
		<input type="submit">`
		
		
		<% String base64image = new String(Base64.getEncoder().encode(m.getMovieimage())); %>
		<img  src="data:image/jpeg;base64 , <%= base64image %>" height="200px" width="200px">
	</form>
	
		

</body>
</html>
