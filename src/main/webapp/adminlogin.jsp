<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

     <h1>admin login</h1>
     <form action="adminlogin" method="post">
     
     <label for="email">Email:</label>
     <input type="email" name="user-email" id="email">
     <br>
     
     <label for="">Password:</label>
     
     <input type="password" name="user-password" id="password">
     <br>
     
     <input type="submit">
     
     </form>
     
     <%String msg =(String)request.getAttribute("message"); %>
     <%if(msg!=null){ %>
     <%=msg %>
     <%} %>
     
     
</body>
</html>