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
	<link rel="stylesheet" href="./css/addmovie.css"> 
	<link rel="stylesheet" href="demo.css">
</head>
<body>
	<div class="login">
		<div class="head">
      <h1>Add movie</h1>
      
	  <%if(request.getSession()!=null){ %>
    </div>
		<div class="form">
			<form action="savemovie" method="post" enctype="multipart/form-data">
        <div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="number" class="form-control" id="floatingInput" name="user-id"
						placeholder="name@example.com"> <label for="floatingInput">id</label>
				</div>

        <div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="text" class="form-control" id="floatingInput" name="user-name"
						placeholder="name@example.com"> <label for="floatingInput">Name</label>
				</div>

        <div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="number" class="form-control" id="floatingInput" name="user-price"
						placeholder="name@example.com"> <label for="floatingInput">Price</label>
				</div>

		<div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="number" class="form-control" id="floatingInput" name="user-ratings"
						placeholder="name@example.com"> <label for="floatingInput">Ratings</label>
				</div>

		<div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="text" class="form-control" id="floatingPassword" name="user-genre"
						placeholder="Password"> <label for="floatingPassword">Genre</label>
				</div>

		<div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="text" class="form-control" id="floatingPassword" name="user-language"
						placeholder="Password"> <label for="floatingPassword">Language</label>
				</div>

		<div class="input-group row-sm-11 mb-3 border border-success">
					<input type="file" class="form-control" id="inputGroupFile02" name="user-image">
					<label class="input-group-text" for="inputGroupFile02">Upload</label>
				</div>

		<div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="text" class="form-control" id="floatingPassword" name="user-link"
						placeholder="text"> <label for="floatingPassword">Link</label>
				</div>
				
		<div class="form-floating col-sm-11 mb-3 border border-success">
					<input type="text" class="form-control" id="floatingPassword" name="user-description"
						placeholder="text"> <label for="floatingPassword">Description</label>
				</div>

						<button type="submit" class="shadow__btn">Submit</button>
			</form>
			<%} else{%>
	     <%request.setAttribute("message"," sorry access denied ,login required... ");
	     RequestDispatcher dispatcher=request.getRequestDispatcher("adminlogin.jsp");
	     dispatcher.include(request, response);%>
	     <%} %>
		</div>
  </div>
</body>
</html>