<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DTO.Movie" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/buymovie.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

<div class="login">
	<div class="head">
  <h1>Payment</h1>
</div>
	<div class="form">
		<% HttpSession session1 =request.getSession();%>
<%Movie movie=(Movie)session.getAttribute("movie"); %>
		<form action="checkpayment" method="post">
		
		<%
		String msg1 = (String) request.getAttribute("message1");
		%>
		<%
		if (msg1 != null) {
		%>
		<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: fit-content">
          <%=msg1%>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
		<%
		}
		%> 
		
<div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="number" class="form-control" id="floatingPassword" name="user-price" placeholder=""> <label for="floatingPassword">you need to pay  <%=movie.getMovieprice()%></label> 
				</div>
				<button type="submit" class="shadow__btn">Pay</button>
		
	</form>
	
	<%String msg =(String)request.getAttribute("messgae");%>
<%if(msg!=null){%>
<%=msg %>
<%} %>
</div>
</div>
</body>
</html>