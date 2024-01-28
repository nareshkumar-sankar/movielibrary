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
</head>
<body>
	<form action="usersigup" method="post">
	<label for="id">Id:</label>
	<input class="form-control" type="number" name="user-id" id="id" autofocus="autofocus">
	<br>
	<label for="name">Name:</label>
	<input type="text" name="user-name" id="name" autofocus="autofocus">
	<br>
	<label for="contact">Contact:</label>
	<input type="tel" name="user-contact" id="contact" autofocus="autofocus">
	<br>
	<label for="email">Email:</label>
	<input type="email" name="user-email" id="email" autofocus="autofocus">
	<br>
	<label for="password">Password:</label>
	<input type="password" name="user-password" id="password" autofocus="autofocus">
	<br>
	<input type="submit">
	</form>
</body>
</html>