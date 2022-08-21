<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.beans.*, java.text.*"%>
<%
int utentiTotali = (int) request.getAttribute("utentiTotali");
int paesiTotali = (int) request.getAttribute("paesiTotali");
int prodottiTotali = (int) request.getAttribute("prodottiTotali");

DecimalFormat dFormat = new DecimalFormat("0.00");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Siamo</title>
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

<style>
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="../fragments/header.jsp"%>
	<!-- HERO -->
	<div class="px-4 py-5 my-5 text-center">

		<h1 class="display-5 fw-bold">Chi Siamo</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">La riforestazione è una delle azioni più
				efficaci nel contrasto alla crisi climatica. Noi ci impegniamo a far
				nascere nuovi alberi nelle regioni del mondo vittime di grandi
				deforestazioni.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<button type="button" class="btn btn-primary btn-lg px-4 gap-3">Primary
					button</button>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">Secondary</button>
			</div>
		</div>
	</div>
	<!-- Divider -->
	<div class="b-example-divider"></div>

	<!-- I nostri valori -->
	<div class="container px-4 py-5" id="featured-3">
		<h2 class="pb-2  text-center">I valori principali di WoodLot</h2>
		<p class="border-bottom text-center">Il nostro obiettivo
			principale è contrastare la crisi climatica alimentando un modello di
			sviluppo sostenibile.</p>
		<div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
			<div class="feature col">
				<div class="feature-icon bg-primary bg-gradient">
					<svg class="bi" xmlns="http://www.w3.org/2000/svg" width="1em"
						height="1em" viewBox="0 0 128.917 128.993">
						<g transform="translate(-406.263 -740.299)">
						<path class="a"
							d="M495.87,837.091H479.835c-1.021,0-1.025,0-1.025,1.019,0,4.069.011,8.139,0,12.209a2.948,2.948,0,0,0,.5,1.65q3.473,5.505,6.91,11.031a4.012,4.012,0,0,1-3.01,6.211,8.81,8.81,0,0,1-1.025.076q-11.4.006-22.8,0a4.809,4.809,0,0,1-3.372-.993,3.926,3.926,0,0,1-.862-5.164q3.5-5.661,7.05-11.29a2.448,2.448,0,0,0,.4-1.376c-.014-4.144-.027-8.287,0-12.43.005-.764-.26-.949-.981-.948q-15.521.027-31.04.007a23.27,23.27,0,0,1-15.43-5.372,23.506,23.506,0,0,1-8.793-16.616,23.839,23.839,0,0,1,4.956-17.014,22.427,22.427,0,0,1,8.736-6.9c.156-.071.307-.156.468-.213.459-.164.512-.394.262-.829a18.285,18.285,0,0,1-2.346-7.068,19.087,19.087,0,0,1,1.85-10.938,20.259,20.259,0,0,1,15.789-11.511,18,18,0,0,1,9.168,1.1c1.272.474,1.259.491,1.469-.824a22.689,22.689,0,0,1,4.428-10.607,24.141,24.141,0,0,1,10.67-8.277c7.386-2.682,14.643-2.341,21.4,1.861a23.828,23.828,0,0,1,11.165,15.331,19.236,19.236,0,0,1,.422,2.312c.065.648.329.636.815.435a19.954,19.954,0,0,1,4.741-1.278,18.608,18.608,0,0,1,12.747,2.7,20,20,0,0,1,9.941,15.737,19.391,19.391,0,0,1-2.066,10.839c-.438.875-.424.848.461,1.256a22.822,22.822,0,0,1,7.026,5,23.133,23.133,0,0,1,6.147,11.6,23.4,23.4,0,0,1-2.64,17.183,23.688,23.688,0,0,1-17.8,11.911,26.964,26.964,0,0,1-3.74.2c-4.854-.017-9.709-.007-14.563-.007Z"></path></g></svg>
				</div>
				<h2>Piantiamo alberi per contrastare la crisi climatica.</h2>
				<p>Scelte e azioni quotidiane individuali, influiscono sul
					futuro della terra. Troppo spesso in maniera negativa! Il nostro
					progetto nasce per permettere a chiunque di fare la sua parte nel
					contrastare la crisi climatica. PIA</p>
				<a href="#" class="icon-link"> Pianta un albero <svg class="bi"
						width="1em" height="1em">
						<use xlink:href="#chevron-right"></use></svg>
				</a>
			</div>
			<div class="feature col">
				<div class="feature-icon bg-primary bg-gradient">
					<svg class="bi" id="mango" xmlns="http://www.w3.org/2000/svg"
						width="1em" height="1em" viewBox="0 0 94.83 124.355">
						<g transform="translate(-99.579 -1708.645)">
						<path class="a"
							d="M124,1751.294a36.132,36.132,0,0,1,12.383-5.739c11.708-2.775,26.931,2.958,35.293,12.3a35.234,35.234,0,0,1,8.6,19.33c1.464,10.826-1.614,20.73-6.746,30.122-.507.926-8.827,11.465-11.534,13.293a25.439,25.439,0,0,0-2.215,1.63,40.508,40.508,0,0,1-6.27,4.489,45.84,45.84,0,0,1-21.2,6.253c-8.874.3-16.672-1.9-23.689-8.095a30.444,30.444,0,0,1-4.5-4.415c-4.034-4.717-5.552-9.429-3.86-16.087a33.349,33.349,0,0,1,2.7-5.96c2.649-5.529,7.882-11.1,9-17.194.608-3.312,2.929-13.649,2.994-13.878C117.684,1757.786,122.621,1752.256,124,1751.294Z"></path>
						<path class="a"
							d="M167.775,1708.645A20.485,20.485,0,0,1,174.893,1736a18.943,18.943,0,0,1-1.718,2.581c-2.4,2.988-4.866,5.935-7.284,8.915-.111.138-.244.259-.424.454a25.868,25.868,0,0,1-5.946-5.751,20.34,20.34,0,0,1,.77-24.505c2.3-2.839,4.631-5.655,6.952-8.48C167.413,1709.007,167.61,1708.817,167.775,1708.645Z"></path>
						<path class="a"
							d="M194.409,1745.707a13.508,13.508,0,0,1-16.65,8.368,12.58,12.58,0,0,1-1.9-.751c-2.258-1.136-4.5-2.317-6.754-3.464-.1-.053-.2-.122-.351-.211a17.039,17.039,0,0,1,2.886-4.628,13.41,13.41,0,0,1,15.9-2.889c2.149,1.093,4.286,2.2,6.428,3.31C194.125,1745.524,194.275,1745.624,194.409,1745.707Z"></path></g></svg>
				</div>
				<h2>Vogliamo generare un impatto sociale e duraturo.</h2>
				<p>Tutti gli alberi che piantiamo, vengono donati a famiglie
					contadine locali generando sicurezza alimentare e sostegno
					economico. Crediamo moltissimo nell’educazione, per questo,
					formiamo le comunità sulla gestione sostenibile della terra.</p>
				<a href="#" class="icon-link"> Call to action <svg class="bi"
						width="1em" height="1em">
						<use xlink:href="#chevron-right"></use></svg>
				</a>
			</div>
			<div class="feature col">
				<div class="feature-icon bg-primary bg-gradient">
					<i class="icon awesome fas fa-location icon_above bi "
						aria-hidden="true"></i>
				</div>
				<h2>Lo facciamo davvero, e puoi tracciarlo.</h2>
				<p>Tutti gli alberi hanno un codice univoco che li identifica.
					Grazie a Chloe, il nostro sistema di tracciamento e trasparenza,
					puoi monitorare la crescita di ogni singolo albero della tua
					foresta attraverso periodici aggiornamenti personalizzati.</p>
				<a href="#" class="icon-link"> Call to action <svg class="bi"
						width="1em" height="1em">
						<use xlink:href="#chevron-right"></use></svg>
				</a>
			</div>
		</div>
	</div>

	<div class="container text-center">
		<h1 class="pb-2">I nostri numeri</h1>
		<p class="border-bottom text-center">Il nostro obiettivo
			principale è contrastare la crisi climatica alimentando un modello di
			sviluppo sostenibile.</p>
		<div class="row row-cols-2 row-cols-md-4 g-6 mb-5">
			<div class="card-group w-100">
				<div class="card h-100 w-100">
					<img src="resources/img/chiSiamoPage/info_users.svg"
						class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">Persone</h5>
						<p class="card-text"><%=utentiTotali%></p>
					</div>
				</div>
				<div class="card h-100">
					<img src="resources/img/chiSiamoPage/info_countries.svg"
						class="card-img-top">
					<div class="card-body">
						<h5 class="card-title text-center">Paesi</h5>
						<p class="card-text"><%=paesiTotali%></p>
					</div>
				</div>
				<!--	<div class="card h-100">
					<img src="resources/img/chiSiamoPage/info_emission.svg"
						class="card-img-top">
					<div class="card-body">
						<h5 class="card-title text-center">Kg Di CO2</h5>
						<p class="card-text">0</p>
					</div>
				</div>
				 <div class="card h-100">
					<img src="resources/img/chiSiamoPage/info_projects.svg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Beneficari</h5>
						<p class="card-text">0</p>
					</div>
				</div> -->
				<div class="card h-100">
					<img src="resources/img/chiSiamoPage/info_trees.svg"
						class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">Alberi</h5>
						<p class="card-text"><%=prodottiTotali%></p>
					</div>
				</div>
			</div>
		</div>
		<h4>Scopri chi ha piantato più alberi.</h4>
		<table class="table ">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">First</th>
					<th scope="col">Last</th>
					<th scope="col">Handle</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>
		<button type="button" class="btn btn-primary mb-5">Partecipa
			anche tu!</button>
		<h4>Dove stanno piantando di più?</h4>
		<button type="button" class="btn btn-primary mb-5">Partecipa
			anche tu!</button>
		<h4>Felici di questi risultati</h4>
		<h5 class="text-muted">Top 10 degli alberi più piantati</h5>

		<button type="button" class="btn btn-primary mb-5">Partecipa
			anche tu!</button>
	</div>

	<div class="container marketing">
		<h1 class="text-center">Il nostro team</h1>
		<p class="text-center mb-5 border-bottom">WoodLot riunisce una
			squadra piena di idee, di molta passione e che ha voglia di cambiare
			il mondo. Conosciamoci meglio!</p>
		<div class="row text-center">
			<div class="col-lg-4">
				<svg class="bd-placeholder-img rounded-circle" width="140"
					height="140" xmlns="http://www.w3.org/2000/svg" role="img"
					aria-label="Placeholder: 140x140"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
						fill="#777"></rect>
						<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

				<h2>Raffaella Spagnuolo</h2>
				<p>Some representative placeholder content for the three columns
					of text below the carousel. This is the first column.</p>
			</div>

			<div class="col-lg-4">
				<svg class="bd-placeholder-img rounded-circle" width="140"
					height="140" xmlns="http://www.w3.org/2000/svg" role="img"
					aria-label="Placeholder: 140x140"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
						fill="#777"></rect>
						<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

				<h2>Alessia Ture</h2>
				<p>Another exciting bit of representative placeholder content.
					This time, we've moved on to the second column.</p>
			</div>
		</div>
	</div>
	<div class="b-example-divider"></div>
	<!-- /.row -->
	<!-- START THE FEATURETTES -->
	<div class="container marketing">
		<div class="row featurette text-center m-5">
			<h1 class="featurette-heading">Molto più di un albero</h1>
			<p class="lead">Treedom finanzia direttamente progetti
				agroforestali, diffusi sul territorio. La filosofia è quella di
				realizzare ecosistemi sostenibili e permettere a migliaia di
				contadini di far fronte ai costi iniziali della piantumazione di
				nuovi alberi, garantendo nel tempo sovranità alimentare ed
				opportunità di reddito.</p>
		</div>

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">Benefici ambientali</h2>
				<p class="lead">La realizzazione di sistemi agroforestali
					permette di operare scelte puntuali in relazione alle specifiche
					caratteristiche e necessità di ogni area di progetto. Le specie
					arboree piantate sono native o in rispetto della biodiversità dei
					diversi territori. La pratica agroforestale integra inoltre la
					piantumazione di alberi in un sistema agricolo, favorendo
					l’interazione virtuosa tra le diverse specie ed un uso sostenibile
					delle risorse e dei terreni. Tutti gli alberi, infine, nel corso
					della propria crescita assorbono CO2 generando naturalmente un
					beneficio per l’intero pianeta.</p>
			</div>
			<div class="col-md-5">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					role="img" aria-label="Placeholder: 500x500"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
						fill="#eee"></rect>
						<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading">Benefici sociali</h2>
				<p class="lead">Treedom finanzia progetti presso comunità rurali
					in vari paesi del mondo e realizza anche in Italia progetti a forte
					valenza sociale. Il primo passo è la formazione e il finanziamento
					delle comunità coinvolte nei progetti, ottenendo straordinari
					risultati in termini di empowerment delle stesse. Gli alberi e i
					loro frutti sono di proprietà dei contadini, permettendo loro di
					diversificare ed integrare il proprio reddito e in alcuni casi di
					avviare iniziative di microimprenditorialità. Finanziare la
					piantumazione di nuovi alberi con Treedom, serve a sostenerne la
					cura nei primi anni di vita, quando non sono ancora produttivi in
					termini di frutti.</p>
			</div>
			<div class="col-md-5 order-md-1">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					role="img" aria-label="Placeholder: 500x500"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
						fill="#eee"></rect>
						<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">Ogni albero nel modo giusto.</h2>
				<p class="lead">Crediamo che gettare 100 semi in un campo, non
					significhi aver piantato 100 alberi. E crediamo che piantare una
					sola specie, in modo intensivo, non sia una scelta sostenibile e
					rispettosa della biodiversità. Crediamo che le comunità di persone
					che vivono in un luogo siano i migliori custodi degli alberi, per
					questo le sosteniamo finanziariamente e le aiutiamo a piantare e
					far crescere alberi nei loro terreni. Gli alberi daranno benefici a
					loro, al luogo in cui vivono e a tutto il pianeta. Crediamo nel
					legame che, attraverso gli alberi e grazie a Treedom, si può creare
					tra persone lontane. Crediamo che ciascuno di noi debba impegnarsi
					per ridurre le proprie emissioni di CO2 e che nel farlo possa
					contribuire anche ad assorbirne piantando alberi. Crediamo che si
					possa rendere questo pianeta più verde. E vogliamo farlo nel modo
					giusto.</p>
			</div>
			<div class="col-md-5">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					role="img" aria-label="Placeholder: 500x500"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
						fill="#eee"></rect>
						<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading">Piantare alberi è (sempre) una
					buona idea?</h2>
				<p class="lead">Negli ultimi anni sono stati annunciati enormi
					progetti di piantumazione di alberi. Sono popolari, raccontati in
					molti canali mediatici e spesso hanno numeri sbalorditivi. Ci sono
					però dei limiti in queste attività, perché se è vero che piantare
					alberi fa bene al pianeta, è ancora più vero che farlo in modo non
					corretto può creare danni enormi agli ecosistemi, alle riserve di
					acqua, all’agricoltura e anche alle persone. Foreste artificiali
					(con una sola o con poche specie non autoctone) impoveriscono la
					biodiversità locale, trasfigurano interi ecosistemi e mettono a
					rischio le riserve idriche di intere regioni. Infine piantumazioni
					massive di alberi in grandi terreni innescano un conflitto sociale
					tra gli alberi e l’agricoltura (necessaria per il sostentamento
					alimentare). Piantare alberi quindi non è (sempre) una buona idea,
					soprattutto quando le grandi attività di piantumazione distolgono
					l’attenzione e il focus da altre priorità come la protezione delle
					foreste esistenti, la riduzione dell'uso dei combustibili fossili,
					la conservazione e il ripristino di altri ecosistemi naturali. Ma
					se piantiamo l’albero giusto, nel posto giusto, con lo scopo giusto
					possiamo ottenere risultati straordinari per l'ambiente, per il
					pianeta e per le comunità locali</p>
			</div>
			<div class="col-md-5">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					role="img" aria-label="Placeholder: 500x500"
					preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
						fill="#eee"></rect>
						<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
			</div>
		</div>
		<hr class="featurette-divider">

		<!-- /END THE FEATURETTES -->

		<div class="container px-4 py-5" id="custom-cards">
			<h2 class="pb-2 border-bottom">I progetti attivi nel mondo</h2>
			<p>Tutto è iniziato in Guatemala. Abbiamo poi messo nuove radici
				nell’amazzonia peruviana ed in tutte le regioni italiane</p>
			<div
				class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
				<div class="col">
					<div
						class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
						style="background-image: url('unsplash-photo-1.jpg');">
						<div
							class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
							<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Guatemala
								- Regione del Petén</h2>
						</div>
					</div>
				</div>

				<div class="col">
					<div
						class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
						style="background-image: url('unsplash-photo-2.jpg');">
						<div
							class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
							<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Perù -
								Foresta amazzonica</h2>
						</div>
					</div>
				</div>

				<div class="col">
					<div
						class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg"
						style="background-image: url('unsplash-photo-3.jpg');">
						<div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
							<h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Italia -
								Diverse regioni italiane</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row m-5">
				<h3>Perchè tutto è iniziato dal Guatemala?</h3>
				<p>Il contesto però è fondamentale: l’area boschiva del
					Guatemala è stata letteralmente depredata negli ultimi 40 anni:
					incendi boschivi incontrollati, degrado del territorio legato al
					narcotraffico e una cattiva gestione del territorio hanno portato a
					livelli devastanti di deforestazione. Un albero, due valori. Per
					iniziare il nostro percorso abbiamo scelto di partire da un paese
					con un alto tasso di povertà e una regione, il Petén, nel
					Nord-Ovest del Guatemala, in cui un albero può fare la differenza,
					non solo dal punto di vista ambientale ma anche sociale: portare
					sostegno all’economia e all’alimentazione delle famiglie. La nostra
					scelta sostiene pienamente la volontà di legare l’albero alla sfida
					climatica che tocca tutti, in tutto il mondo, ma non tutti allo
					stesso modo. Come scegliamo le comunità? Il processo di selezione
					delle comunità è assai complesso. Per esempio in Guatemala, in
					collaborazione con il centro Universitario CUDEP de la Universidad
					de San Carlos de Guatemala, vengono fatte delle analisi del
					territorio, della condizione socio-economica delle popolazioni che
					vivono le comunità e di queste, viene stilato un profilo. Le più
					idonee passano alla fase successiva: la formazione sui temi di
					agricoltura organica.</p>
			</div>

		</div>


	</div>
	<!-- Divider -->
	<div class="b-example-divider"></div>
	<!-- Condividi -->
	<div class="container my-5">
		<div
			class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center rounded-3 border shadow-lg">
			<div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
				<h1 class="display-4 fw-bold lh-1">Fai crescere la community
					condividi WoodLot!</h1>
				<p class="lead">TANTE FACCE, DIVERSE MOTIVAZIONI UN UNICO
					OBIETTIVO: Let's green the planet</p>
				<div
					class="d-grid gap-2 d-md-flex justify-content-md-start mb-4 mb-lg-3">
					<section class="mb-4">
						<!-- Facebook -->
						<a class="btn btn-outline-dark btn-floating m-1"
							href="https://www.facebook.com" role="button"><i
							class="fab fa-facebook-f"></i></a>

						<!-- Twitter -->
						<a class="btn btn-outline-dark btn-floating m-1"
							href="https://twitter.com" role="button"><i
							class="fab fa-twitter"></i></a>

						<!-- Snapchat -->
						<a class="btn btn-outline-dark btn-floating m-1"
							href="https://snapchat.com" role="button"><i
							class="fa-brands fa-snapchat"></i></a>

						<!-- Instagram -->
						<a class="btn btn-outline-dark btn-floating m-1"
							href="https://www.instagram.com" role="button"><i
							class="fab fa-instagram"></i></a>

						<!-- TikTok -->
						<a class="btn btn-outline-dark btn-floating m-1"
							href="https://www.tiktok.com" role="button"><i
							class="fa-brands fa-tiktok"></i></a>

						<!-- Pinterest -->
						<a class="btn btn-outline-dark btn-floating m-1"
							href="https://www.pinterest.com" role="button"><i
							class="fa-brands fa-pinterest"></i></a>
					</section>
				</div>
			</div>
			<div class="col-lg-4 offset-lg-1 p-0 overflow-hidden shadow-lg">
				<img class="rounded-lg-3"
					src="resources/img/chiSiamoPage/community.svg" alt="" width="300">
			</div>
		</div>
	</div>
	<!-- /.container -->

	<div class="b-example-divider"></div>
	<!-- Footer -->
	<%@ include file="../fragments/footer.jsp"%>
</body>
</html>