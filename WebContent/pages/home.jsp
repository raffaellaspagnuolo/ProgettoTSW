<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WoodLot</title>
<!--CSS-->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/_variables.scss">
<link rel="stylesheet" type="text/css"
	href="resources/css/_bootswatch.scss">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
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

	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="0" class="active" aria-label="Slide 1"
				aria-current="true"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777"></rect></svg>

				<div class="container">
					<div class="carousel-caption text-start">
						<h1>Example headline.</h1>
						<p>Some representative placeholder content for the first slide
							of the carousel.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777"></rect></svg>

				<div class="container">
					<div class="carousel-caption">
						<h1>Another example headline.</h1>
						<p>Some representative placeholder content for the second
							slide of the carousel.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">Learn more</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%"
					xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#777"></rect></svg>

				<div class="container">
					<div class="carousel-caption text-end">
						<h1>One more for good measure.</h1>
						<p>Some representative placeholder content for the third slide
							of this carousel.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- Hero Section -->
	<div class="container my-5">
		<div
			class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center rounded-3 border shadow-lg">
			<div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
				<h1 class="display-4 fw-bold lh-1">Border hero with cropped
					image and shadows</h1>
				<p class="lead">Quickly design and customize responsive
					mobile-first sites with Bootstrap, the world’s most popular
					front-end open source toolkit, featuring Sass variables and mixins,
					responsive grid system, extensive prebuilt components, and powerful
					JavaScript plugins.</p>
				<div
					class="d-grid gap-2 d-md-flex justify-content-md-start mb-4 mb-lg-3">
					<button type="button"
						class="btn btn-primary btn-lg px-4 me-md-2 fw-bold">Primary</button>
					<button type="button" class="btn btn-outline-secondary btn-lg px-4">Default</button>
				</div>
			</div>
			<div class="col-lg-4 offset-lg-1 p-0 overflow-hidden shadow-lg">
				<img class="rounded-lg-3" src="bootstrap-docs.png" alt=""
					width="720">
			</div>
		</div>
	</div>

	<!-- Jumbotron -->
	<div
		class="bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white"
		style="background-image: url('https://mdbcdn.b-cdn.net/img/new/slides/003.webp');">
		<h1 class="mb-3 h2">Jumbotron</h1>

		<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
			Repellendus praesentium labore accusamus sequi, voluptate debitis
			tenetur in deleniti possimus modi voluptatum neque maiores dolorem
			unde? Aut dolorum quod excepturi fugit.</p>
	</div>


	<br>
	<br>
	<!-- Fine Card Section -->
	<div class="b-example-divider"></div>
	<!-- Cosa Puoi Fare -->
	<!-- Scritta -->


	<!-- Cards  <div class="row row-cols-1 row-cols-md-4 g-4 d-flex justify-content-between" >-->
	<div class="container" style="background-color: #93c572;">
		<div class="col-md-12 text-center pt-5">
			<h1>Cosa puoi fare</h1>
			<br> <br>
		</div>
		<div
			class="row row-cols-1 row-cols-md-4 g-4 d-flex justify-content-between">
			<div class="col p-5">
				<div class="card text-center shadow-lg bg-white rounded h-100"
					style="max-width: 14rem;">
					<img src="./resources/img/cosaPuoiFare/whatucando-gift-icon.png"
						class="card-img-top" width="206px" height="206px">
					<div class="card-body">
						<h5 class="card-title fw-bold">Regala</h5>
						<p class="card-text">Un regalo originale per l’ambiente e per
							le persone a cui vuoi bene</p>
						<a class="btn btn-primary" href="Catalogo">Regala</a>
					</div>
				</div>
			</div>
			<div class="col p-5">
				<div class="card  text-center shadow-lg bg-white rounded h-100"
					style="max-width: 14rem;">
					<img
						src="./resources/img/cosaPuoiFare/whatucando-discover-icon.png"
						class="card-img-top" width="206px" height="206px">
					<div class="card-body">
						<h5 class="card-title fw-bold">Pianta</h5>
						<p class="card-text">Tante specie ognuna con le sue
							caratteristiche ed i suoi poteri</p>
						<a class="btn btn-primary" href="Catalogo">Pianta</a>
					</div>
				</div>
			</div>
			<div class="col p-5">
				<div class="card text-center shadow-lg bg-white rounded h-100"
					style="max-width: 14rem;">
					<img
						src="./resources/img/cosaPuoiFare/whatucando-subscription-icon.png"
						class="card-img-top" width="206px" height="206px">
					<div class="card-body">
						<h5 class="card-title fw-bold">Abbonati</h5>
						<p class="card-text">Pianta alberi ogni mese e inizia il tuo
							percorso green</p>
						<a class="btn btn-primary" href="#">Abbonati</a>
					</div>
				</div>
			</div>
			<div class="col p-5">
				<div class="card text-center shadow-lg bg-white rounded h-100"
					style="max-width: 14rem;">
					<img src="./resources/img/chiSiamoPage/info_trees.svg"
						class="card-img-top" width="206px" height="206px">
					<div class="card-body">
						<h5 class="card-title fw-bold">Crea il tuo WoodLot</h5>
						<p class="card-text">Pianta alberi ogni mese e inizia il tuo
							percorso green</p>
						<a class="btn btn-primary" href="#">Crea</a>
					</div>
				</div>
			</div>
		</div>
		<br>
	</div>
	<div class="b-example-divider"></div>
	<div class="container px-4 py-5" id="hanging-icons">
		<h2 class="pb-2 border-bottom">Come Funziona?</h2>
		<div class="row g-4 py-5 row-cols-1 row-cols-lg-4">
			<div class="col d-flex align-items-start">
				<div class="icon-square bg-light text-dark flex-shrink-0 me-3">
					<svg class="bi" xmlns="http://www.w3.org/2000/svg" id="fir"
						width="1em" height="1em" viewBox="0 0 91.378 121.841">
						<path class="a"
							d="M1467.421,812.41h7.288a5.407,5.407,0,0,0,4.945-3.108,5.247,5.247,0,0,0-.78-5.723l-18.592-21.628h6.874a5.392,5.392,0,0,0,4.964-3.239,5.293,5.293,0,0,0-1.009-5.73l-26.24-27.956a3.919,3.919,0,0,0-5.549,0l-26.243,27.956a5.3,5.3,0,0,0-1.009,5.73,5.4,5.4,0,0,0,4.967,3.239h6.874l-18.594,21.633a5.254,5.254,0,0,0-.778,5.72,5.406,5.406,0,0,0,4.945,3.106h7.289l-19.011,21.533a5.259,5.259,0,0,0-.847,5.773,5.517,5.517,0,0,0,5,3.153h32.568v5.818l-7.208,11.517a3.809,3.809,0,0,0,3.4,5.512h22.835a3.809,3.809,0,0,0,3.4-5.512l-7.208-11.517v-5.818h32.57a5.518,5.518,0,0,0,5-3.153,5.26,5.26,0,0,0-.847-5.773Z"
							transform="translate(-1396.409 -743.875)"></path></svg>
				</div>
				<div>
					<h3>Scegli un albero</h3>
					<p>Scegli quale albero adottare virtualmente tra quelli che
						trovi nel nostro shop!.</p>
				</div>
			</div>
			<div class="col d-flex align-items-start">
				<div class="icon-square bg-light text-dark flex-shrink-0 me-3">
					<svg class="bi" id="farmer" xmlns="http://www.w3.org/2000/svg"
						width="1em" height="1em" viewBox="0 0 93.873 129.498">
						<g transform="translate(-740.832 -408.461)">
						<path class="a"
							d="M787.762,446.318c-9.98.04-16.575-6.647-16.494-16.733a16.582,16.582,0,0,1,15.992-16.621A17.224,17.224,0,0,1,804.6,429.458,16.8,16.8,0,0,1,787.762,446.318Z"></path>
						<path class="a"
							d="M802.112,416.756c0-3.767-3.054-8.3-6.822-8.3H780.311c-3.765,0-6.822,4.345-6.822,8.113v-1.293a6.823,6.823,0,0,0,6.822,6.825H795.29a6.824,6.824,0,0,0,6.822-6.825Z"></path>
						<path class="a"
							d="M761.622,422.709h52.357c3.872,0,3.872-6.006,0-6.006H761.622c-3.876,0-3.876,6.006,0,6.006Z"></path>
						<path class="a"
							d="M832.413,430.732a7.823,7.823,0,0,0-11.062,0L800.173,451.91H775.364l-21.178-21.178A7.823,7.823,0,0,0,743.124,441.8l23.133,23.132v65.207a7.822,7.822,0,0,0,7.82,7.823h3.91a7.823,7.823,0,0,0,7.823-7.823h0V502.758h3.91v27.378a7.822,7.822,0,0,0,7.822,7.823h3.915a7.822,7.822,0,0,0,7.823-7.823h0V464.929L832.413,441.8a7.823,7.823,0,0,0,0-11.063Z"></path></g></svg>
				</div>
				<div>
					<h3>Lo piantiamo e lo doniamo ad un contadino</h3>
					<p>L’albero nasce e cresce in vivaio. Dopo un anno viene donato
						a una famiglia contadina che se ne occupa..</p>
				</div>
			</div>
			<div class="col d-flex align-items-start">
				<div class="icon-square bg-light text-dark flex-shrink-0 me-3">
					<svg class="bi" xmlns="http://www.w3.org/2000/svg" id="orange"
						width="1em" height="1em" viewBox="0 0 84.039 109.034">
						<g transform="translate(-106.631 -2042.16)">
						<path class="a"
							d="M186.888,2042.16a17.125,17.125,0,0,1-7.05,22.548,15.96,15.96,0,0,1-2.36,1.07c-3.026,1.057-6.077,2.057-9.109,3.1-.141.048-.288.076-.5.134a21.555,21.555,0,0,1-1.673-6.709,17,17,0,0,1,11.384-17.039c2.89-.995,5.786-1.963,8.682-2.939C186.471,2042.257,186.694,2042.209,186.888,2042.16Z"></path>
						<ellipse class="a" cx="42.02" cy="40.619" rx="42.02" ry="40.619"
							transform="translate(106.631 2069.956)"></ellipse></g></svg>
				</div>
				<div>
					<h3>Il contadino ne trae beneficio</h3>
					<p>La famiglia contadina raccogliendo la frutta prodotta,
						riceverà sicurezza alimentare e una nuova fonte di guadagno..</p>
				</div>
			</div>
			<div class="col d-flex align-items-start">
				<div class="icon-square bg-light text-dark flex-shrink-0 me-3">
					<i class="icon awesome fas fa-qrcode bi" aria-hidden="true"></i>
				</div>
				<div>
					<h3>Tu lo vedi crescere</h3>
					<p>Ricevi aggiornamenti fotografici periodici dal tuo albero.
						Potrai monitorarlo grazie a Chloe..</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Card Section -->
	<br>
	<div class="b-example-divider"></div>
	<!-- Scritta -->
	<div class="container">
		<div class="col-md-12 text-center mt-5">
			<h1>Scegli il tuo albero</h1>
			<p>Puoi farlo per i benefici che è in grado di apportare, per la
				CO2 che può assorbire o per fare un regalo originale. Un contadino
				lo pianterà nella sua terra. Il tuo albero sarà fotografato,
				geolocalizzato ed avrà la sua pagina online dove seguirai la storia
				del progetto di cui farà parte.</p>
			<br> <br>
		</div>
		<div class="row row-cols-1 row-cols-md-4">
			<!-- Card 1 -->
			<div class="col">
				<div class="card h-100">
					<img src="../resources/img/alberi/Arancia.png" class="card-img-top"
						onerror="this.src='./resources//img/error.jpg'" />
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<div class="text-center">
							<a class="btn btn-success" href="paginaProdotto.jsp">Piantalo
								Ora</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Card 2 -->
			<div class="col">
				<div class="card h-100">
					<img src="../resources/img/alberi/Avocado.png" class="card-img-top"
						onerror="this.src='./resources//img/error.jpg'" />
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<div class="text-center">
							<a class="btn btn-success" href="paginaProdotto.jsp">Piantalo
								Ora</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Card 3 -->
			<div class="col">
				<div class="card h-100">
					<img src="../resources/img/alberi/Caoba.png" class="card-img-top"
						onerror="this.src='./resources//img/error.jpg'" />
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content.</p>
						<div class="text-center">
							<a class="btn btn-success" href="paginaProdotto.jsp">Piantalo
								Ora</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Card 4 -->
			<div class="col">
				<div class="card h-100">
					<img src="../resources/img/alberi/Cedro.png" class="card-img-top"
						onerror="this.src='./resources//img/error.jpg'" />
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content.</p>
						<div class="text-center">
							<a class="btn btn-success" href="paginaProdotto.jsp">Piantalo
								Ora</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<!-- Bottone  Vedi Altri -->
	<div class="col-md-12 text-center mb-5">
		<a type="button" class="btn btn-primary btn-lg" href="catalogo.jsp">Scopri
			tutti gli alberi!</a>
	</div>
	<div class="b-example-divider"></div>
	<div class="container px-4 py-5" id="icon-grid">
		<h2 class="pb-2 border-bottom">Tutto molto trasparente</h2>

		<div
			class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 g-4 py-5">
			<div class="col d-flex align-items-start">
				<i class="fs-1 fa-solid fa-money-bill-wave bi  flex-shrink-0 me-3"></i>
				<div>
					<h4 class="fw-bold mb-0">Sì, lo paghi una volta sola</h4>
					<p>Non ti chiediamo ulteriori pagamenti, ci serve solo un primo
						contributo per poterlo piantare!</p>
				</div>
			</div>
			<div class="col d-flex align-items-start">
				<i class="fa-solid fa-house-chimney flex-shrink-0 me-3 bi fs-1"></i>
				<div>
					<h4 class="fw-bold mb-0">No, non ti arriva a casa l’albero</h4>
					<p>Il germoglio crescerà nel vivaio e poi verrà donato a una
						famiglia di contad</p>
				</div>
			</div>
			<div class="col d-flex align-items-start">
				<i class="fa-solid fa-apple-whole flex-shrink-0 me-3 bi fs-1"></i>
				<div>
					<h4 class="fw-bold mb-0">No, non ti arriva a casa la frutta</h4>
					<p>Saranno di sostentamento alle famiglie che si prendono cura
						dell’albero</p>
				</div>
			</div>
			<div class="col d-flex align-items-start">
				<i
					class="fa-solid fa-hand-holding-droplet flex-shrink-0 me-3 bi fs-1"></i>
				<div>
					<h4 class="fw-bold mb-0">Sì, lo piantiamo davvero</h4>
					<p>E puoi vederlo da subito, dai primi giorni che trascorre nel
						nostro vivaio</p>
				</div>
			</div>
			<div class="col d-flex align-items-start">
				<i class="fa-solid fa-seedling flex-shrink-0 me-3 bi fs-1"></i>
				<div>
					<h4 class="fw-bold mb-0">Sì, lo vedrai crescere online</h4>
					<p>Potrai monitorarlo tramite il nostro sistema esclusivo di
						tracciabilità, CHLOE!</p>
				</div>
			</div>
			<div class="col d-flex align-items-start">
				<i class="fa-solid fa-envelope-open-text flex-shrink-0 me-3 bi fs-1"></i>
				<div>
					<h4 class="fw-bold mb-0">Sì, ricevi un certificato PDF</h4>
					<p>Al momento dell’acquisto riceverai un attestato che attesta
						la proprietà del tuo albero.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="../fragments/footer.jsp"%>

</body>
</html>