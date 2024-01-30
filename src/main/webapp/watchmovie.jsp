<%@ page import="DTO.Movie" %>
<%@ page import="DAO.Dao" %>
<%@ page import="DTO.User" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<% HttpSession session1 = request.getSession(); %>
<% User user = (User) session.getAttribute("user"); %>
<% int movieid = Integer.parseInt(request.getParameter("id")); %>
<% Dao dao = new Dao(); %>

<% Movie m = (Movie) dao.FindMoviesById(movieid); %>
<iframe width="100%" height="700px" src="<%=m.getMovielink() %>" ></iframe>

</body>
</html>
