<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Signup</title>
</head>
<body>
    <h1>Admin Signup</h1>
    
    <form action="adminsignup" method="post">
        <label for="id">Id:</label>
        <input type="number" name="user-id" id="id">
        <br>
        <label for="name">Name:</label>
        <input type="text" name="user-name" id="name">
        <br>
        <label for="contact">Contact:</label>
        <input type="tel" name="user-contact" id="contact">
        <br>
        <label for="email">Email:</label>
        <input type="email" name="user-email" id="email">
        <br>
        <label for="password">Password:</label>
        <input type="password" name="user-password" id="password">
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
