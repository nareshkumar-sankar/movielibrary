<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="userlogin" method="post">
		<label for="email">User-email:</label>
		<input type="email" name="user-email" id="email" autofocus="autofocus">
		<br>
		<label for="password">User-password:</label>
		<input type="password" name="user-password" id="password" autofocus="autofocus">
		<br>
		<input type="submit">
	</form>
	
	<%String msg = (String)request.getAttribute("message"); %>
	<%if(msg!=null){%>
	<%=msg %>
	<%} %>
</body>
</html>