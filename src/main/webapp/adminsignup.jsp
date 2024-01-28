<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Signup</title>
<link rel="stylesheet" href="./css/adminsignup.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<div class="signup">

		<h1>Admin Signup</h1>

		<div class="form">

			<form action="adminsignup" method="post">

				<div class="form-floating mb-3">
					<input type="number" name="user-id" class="form-control" id="id" placeholder="enter the id">
						<label for="id">Id</label> 
				</div>

				<div class="form-floating mb-3">
					<input type="text" class="form-control" name="user-name" id="name"
						placeholder="enter the name"> <label for="name">Name</label>
				</div>

				<div class="form-floating mb-3">
					<input type="tel" class="form-control" name="user-contact"
						id="exampleFormControlInput3" placeholder="enter the contact">
					<label for="exampleFormControlInput3" class="form-label">Contact</label>
				</div>

				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput" name="user-email"
						placeholder="name@example.com"> <label for="floatingInput">Email</label>
				</div>

				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword" name="user-password"
						placeholder="Password"> <label for="floatingPassword">Password</label>
				</div>
		</div>

		<button type="submit" class="sbt">Submit</button>
		</form>

	</div>


</body>
</html>
