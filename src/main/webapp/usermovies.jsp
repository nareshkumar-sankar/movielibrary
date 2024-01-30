<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="DTO.Movie"%>
<%@page import="java.util.Base64"%>
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
    <% List<Movie>  usermovie = (List)request.getAttribute("usermovie");%>
    
    <table>
<tr>
<th>Name</th>
<th>Ratings</th>
<th>Genre</th>
<th>Language</th>
<th>Image</th>
<th>WatchMovies</th>
<td>Delete</td>


</tr>
<%for(Movie m : usermovie){ %>
<tr>


<td><%=m.getMoviename() %></td>
<td><%=m.getMovieratings() %></td>
<td><%=m.getMoviegenre() %></td>
<td><%=m.getMovielanguage() %></td>
<%String base64image = new String(Base64.getEncoder().encode(m.getMovieimage())); %>
<td><img src="data:image/jpeg;base64,<%=base64image%>" height="200px" width="200px"></td>

<td><button><a href="watchmovie.jsp?id=<%=m.getMovieid() %>">Watch</a></button></td>

<td><button><a href="deleteusermovie?id=<%=m.getMovieid()%>">Delete</a></button></td>

</tr>

<%}%>

</table>
    
</body>
</html>