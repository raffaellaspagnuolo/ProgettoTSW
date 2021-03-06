<!-- NOON FUNZIONA LA CHECK -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- pagina per la gestione di errori -->
<%@ page errorPage="/error/error404.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrati</title>
<!--CSS-->
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/_variables.scss">
<link rel="stylesheet" type="text/css"
	href="../resources/css/_bootswatch.scss">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/6bd8866cc2.js"
	crossorigin="anonymous"></script>
<!-- JS -->

</head>
<body>
	<section class="h-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Registrati</p>

									<form action="Login" name="signIn" method="POST"
										class="mx-1 mx-md-4 needs-validation" novalidate
										autocomplete="off">
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="nome" class="form-control"
													placeholder="il tuo nome" required /> <label
													class="form-label" for="nome">Il tuo nome</label>
												<div class="valid-feedback">Looks good!</div>
												<div class="invalid-feedback">Inserisci un nome valido
												</div>
											</div>

										</div>
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" id="cognome" class="form-control"
													placeholder="il tuo cognome" required /> <label
													class="form-label" for="cognome">Il tuo cognome</label>
												<div class="valid-feedback">Looks good!</div>
												<div class="invalid-feedback">Inserisci un cognome
													valido</div>
											</div>

										</div>
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="email" id="email" class="form-control"
													placeholder="la tua e-mail" required /> <label
													class="form-label" for="email">La tua e-mail</label>
												<div class="valid-feedback">Looks good!</div>
												<div class="invalid-feedback">Inserisci un e-mail
													valida.</div>
											</div>

										</div>
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="password" id="password" class="form-control" placeholder="la tua password"
													required /> <label class="form-label" for="password">Password</label>
												<div class="valid-feedback">Looks good!</div>
												<div class="invalid-feedback">La password ?? troppo
													corta.</div>
											</div>

										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-key fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="password" id="password1" class="form-control"
													required placeholder="ripeti password"/> <label class="form-label" for="password1" >Ripeti
													la tua password</label>
												<div class="valid-feedback">Looks good!</div>
												<div class="invalid-feedback">Le due password non
													coincidono</div>
											</div>
										</div>
										<div class="form-check align-items-center">
											<input class="form-check-input" type="checkbox" value=""
												id="condizioni" aria-describedby="invalidCheck3Feedback"
												required> <label class="form-check-label"
												for="condizioni"> Accetto i termini e le <a
												href="condizioni.jsp">condizioni </a></label>
											<div class="invalid-feedback">You must agree before
												submitting.</div>
										</div>

										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="submit" class="btn btn-primary btn-lg"
												id="submit">Registrati</button>
										</div>
									</form>
								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">

			var email = document.signIn.email;
			var password = document.signIn.password;
			var password1 = document.signIn.password1;
			var nome = document.signIn.nome;
			var cognome = document.signIn.cognome;
			var condizioni =  document.signIn.condizioni;
			var form= document.signIn;

			let validNome = false;
			let validCognome = false;
			let validEmail = false;
			let validPassword = false;
			let validPassword1 = false;
			let validCondizioni = false;
			
			nome.addEventListener('blur', () => {
			    let regex = /^[a-zA-Z]([0-9a-zA-Z]){1,10}$/;
			    let str = nome.value;
			    if (regex.test(str)) {
			        nome.classList.add("is-valid");
			        validNome = true;
			    } else {
			        nome.classList.add("is-invalid");
			        validNome = false;
			    }
			    
			    nome.classList.add("was-validated");
			});
			
			cognome.addEventListener('blur', () => {
			    let regex = /^[a-zA-Z]([0-9a-zA-Z]){1,10}$/;
			    let str = cognome.value;
			    if (regex.test(str)) {
			        cognome.classList.add("is-valid"); 
			        validCognome = true;
			    } else {
			        cognome.classList.add("is-invalid");
			        validCognome = false;
			    }
			    
			    cognome.classList.add("was-validated");
			});
			
			email.addEventListener('blur', () => {
			    let regex = /^([_\-\.a-zA-Z0-9]+)@([_\-\.a-zA-Z0-9]+)\.([a-zA-Z]){2,7}$/;
			    let str = email.value;
			    if (regex.test(str)) {
			        email.classList.add("is-valid");
			        validEmail = true;
			    } else {
			        email.classList.add("is-invalid");
			        validEmail = false;
			    }
			    
			    email.classList.add("was-validated");
			});
			
			password.addEventListener('blur', () => {
				var password_lengh= password.value.length;
				var password_lengh1= password1.value.length;
				
			    if (password_lengh ==0 || password_lengh < 3 || password_lengh > 10) { 
			    	password.classList.add("is-invalid");
			        validPassword = false;
			    } else {
			        password.classList.add("is-valid");
			        validPassword = true;
			    }
			    password.classList.add("was-validated");
			});
			
			password1.addEventListener('blur', () => {
				var password_lengh= password.value.length;
				var password_lengh1= password1.value.length;
				
			    if (password.value != password1.value ) {
			    	password1.classList.add("is-invalid");
			    	password.classList.add("is-invalid");
			        validPassword1 = false;
			    } else {
			        password1.classList.add("is-valid");
			        password.classList.add("is-valid");
			        validPassword1 = true;
			    }
			    password1.classList.add("was-validated");
			});
			
			condizioni.addEventListener('blur', () => {	
			    if (condizioni.checked == false) {
			    	condizioni.classList.add("is-invalid");   
			        validCondizioni = false;
			    } else {
			        condizioni.classList.add("is-valid");
			        validCondizioni = true;
			    }
			    condizioni.classList.add("was-validated");
			});
			
			let submit = document.getElementById("submit");
			submit.addEventListener("click", (e) => {
			    e.preventDefault();
			    if (validEmail && validNome && validCognome && validPassword1 && validPassword && validCondizioni) {
			        form.classList.add("was-validated");
			        return true ;
			    } else {
			    	form.classList.add("was-validated");
			        return false; 
			    }
			});
		
	</script>
</body>
</html>