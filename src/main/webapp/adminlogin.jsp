<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href="demo.css">
<link rel="stylesheet" href="./css/adminlogin.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

	<div class="login">
		<div class="head">
      <h1>Admin Login</h1>
    </div>
		<div class="form">
			<form action="adminlogin" method="post">
				<div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="email" class="form-control" id="floatingInput" name="user-email"
						placeholder="name@example.com"> <label for="floatingInput">Email</label>
				</div>

				<div class="form-floating col-sm-11 border border-success">
					<input type="password" class="form-control" id="floatingPassword" name="user-password"
						placeholder="Password"> <label for="floatingPassword">Password</label>
				</div>
						<button type="submit" class="shadow__btn">Submit</button>
			</form>
		</div>
		 <%
		String msg = (String) request.getAttribute("message");
		%>
		<%
		if (msg != null) {
		%>
		<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: fit-content">
          <%=msg%>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
		<%
		}
		%> 
	</div>

</body>
</html>