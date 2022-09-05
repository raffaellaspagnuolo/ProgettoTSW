<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Riscatta il tuo regalo</title>
<!--CSS-->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/_variables.scss">
<link rel="stylesheet" type="text/css"
	href="resources/css/_bootswatch.scss">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/6bd8866cc2.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- Header -->
	<%@ include file="../fragments/header.jsp"%>
	<section class="h-100" style="background-color: #eee;">
		<br> <br> <br> <br> <br>
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-6">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<h2 class="fw-bold mb-0">Riscatta il tuo regalo</h2>
							<p>Inserendo il codice riscatterai gli alberi che hai
								ricevuto come regalo.</p>
							<form class="" method="POST" action="Regalo">
								<div class="form-floating mb-3">
									<input class="form-control rounded-3" id="floatingInput" name="email" type="email"
										placeholder="name@example.com"> <label
										for="floatingInput">Email</label>
								</div>
								<div class="form-floating mb-3">
									<input class="form-control rounded-3" id="" name="codice"
										placeholder="Password"> <label for="floatingPassword">Codice</label>
								</div>
								<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
									type="submit">Riscatta</button>
							</form>
							<%
							if (error != null) {
							%>
							<p><%=error%></p>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br> <br> <br>
	</section>
	<!-- Footer -->
	<%@ include file="../fragments/footer.jsp"%>
</body>
</html>