<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="usersigup" method="post">
	<label for="id">Id:</label>
	<input type="number" name="user-id" id="id" autofocus="autofocus">
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