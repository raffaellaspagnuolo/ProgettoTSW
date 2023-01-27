<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- accesso alla sessione -->
<%@ page session="true"%>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, it.unisa.beans.*,java.text.*,java.time.*, java.time.format.DateTimeFormatter "%>
<%
Utente utente = (Utente) request.getSession().getAttribute("utente");

Collection<?> ordini = (Collection<?>) request.getSession().getAttribute("ordiniUtente");
Collection<?> ordiniRegalati = (Collection<?>) request.getSession().getAttribute("ordiniRegalati");

int numeroAlberiAcquistati = (int) request.getSession().getAttribute("numeroDiAlberiAcquistati");
int numeroDiRegali = (int) request.getSession().getAttribute("numeroDiRegali");
double totaleSpeso = (double) request.getSession().getAttribute("totaleSpeso");

if (utente == null) {
	response.sendRedirect("./Login");
	return;
}

DecimalFormat dFormat = new DecimalFormat("0.00");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profilo</title>
<!--CSS-->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<!-- My Script -->
<script src="resources/scripts/profiloScript.js"></script>
<style type="text/css">
.badgeImg {
	-webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
	filter: grayscale(100%);
}

.progress-bar-container {
	position: relative;
}

.progress-bar-container::before {
	content: "";
	position: absolute;
	background-color: #f4ebc7;
	height: 10px;
	width: 100%;
	top: 50%;
	left: 0px;
	transform: translateY(-50%);
}

#progress-bar-seme {
	position: absolute;
	background-color: #e5c59c;
	height: 10px;
	width: 20%;
	top: 50%;
	left: 0px;
	transform: translateY(-50%);
	transition: 0.3s ease;
}

#progress-bar- {
	position: absolute;
	background-color: #e5c59c;
	height: 10px;
	width: 0%;
	top: 50%;
	left: 0px;
	transform: translateY(-50%);
	transition: 0.3s ease;
}

#progress-bar-vivaio {
	position: absolute;
	background-color: #e5c59c;
	height: 10px;
	width: 50%;
	top: 50%;
	left: 0px;
	transform: translateY(-50%);
	transition: 0.3s ease;
}

#progress-bar-piantato {
	position: absolute;
	background-color: #e5c59c;
	height: 10px;
	width: 75%;
	top: 50%;
	left: 0px;
	transform: translateY(-50%);
	transition: 0.3s ease;
}

#progress-bar-fotografato {
	position: absolute;
	background-color: #e5c59c;
	height: 10px;
	width: 100%;
	top: 50%;
	left: 0px;
	transform: translateY(-50%);
	transition: 0.3s ease;
}

.circles-container {
	display: flex;
	justify-content: space-between;
	max-width: 100%;
}

.circle {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	position: relative;
	z-index: 2;
	background-color: #d6d3d3;
	transition: 0.4s ease;
}

.circle h3 {
	position: absolute;
	left: 37%;
	top: 30%;
	font-size: 20px;
	color: blue;
}

.circle.active {
	background-color: #93c572;
}

.circle.active h3 {
	color: grey;
}
</style>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="resources/img/logo.png">
</head>
<body>
	<!-- Header -->
	<%@ include file="../fragments/header.jsp"%>
	<br>
	<div class="container">
		<div
			class="row d-flex align-items-center row-cols-1 row-cols-md-2 row-cols-sm-1 px-5 ">
			<div class="col">
				<div class="row">
					<p>
						<b>Nome: </b>
						<%=utente.getNome()%>
					</p>
					<p>
						<b> Cognome: </b>
						<%=utente.getCognome()%>
					</p>
					<p>
						<b>Email:</b>
						<%=utente.getEmail()%>
					</p>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<p>
						<b>Hai effettuato:</b>
						<%=ordini.size()%>
						ordini
					</p>
					<p>
						<b>Hai acquistato: </b>
						<%=numeroAlberiAcquistati%>
						alberi
					</p>
					<p>
						<b> Hai fatto: </b>
						<%=numeroDiRegali%>
						regali
					</p>
					<p>
						<b>Hai speso in totale:</b>
						<%=dFormat.format(totaleSpeso)%>
						€
					</p>

				</div>
			</div>
		</div>

	</div>
	<hr>

	<div class="container">

		<div class="row g-4">
			<div class="d-flex align-items-center d-lg-none">
				<button class="border-0 bg-transparent" type="button"
					id="myProfileButton">
					<i class="btn btn-primary fw-bold fa-solid fa-sliders-h"></i> <span
						class="h6 mb-0 fw-bold d-lg-none ms-2">My profile</span>
				</button>
			</div>
			<!-- Sidebar -->
			<div
				class="d-flex flex-column flex-shrink-0 p-3 bg-light d-none d-lg-block"
				id="myProfileMenu" style="width: 280px;">
				<a href="#"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<span class="fs-4">Il mio profilo</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a class="nav-link" href="#news"
						id="newsButton"> <i class="fa-solid fa-newspaper"></i> <span>News</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#ordini"
						id="ordiniButton"><i class="fa-solid fa-clipboard-list"></i><span>
								Ordini </span></a></li>
					<li class="nav-item"><a class="nav-link" href="#woodLot"
						id="woodLotButton"> <i class="fa-solid fa-tree"></i><span>
								Il tuo WoodLot </span></a></li>

					<li class="nav-item"><a class="nav-link" href="#badge"
						id="badgeButton"> <i class="fa-solid fa-award"></i><span>
								Badge </span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#regali"
						id="regaliButton"> <span> <i class="fa-solid fa-gifts"></i>
								Regali
						</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#indirizzo"
						id="indirizzoButton"> <i class="fa-solid fa-map-location-dot"></i><span>
								Indirizzi </span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="Login?action=logout" id="logoutButton"> <i
							class="fa-solid fa-right-from-bracket"></i><span>Logout </span>
					</a></li>
				</ul>
			</div>

			<!-- Main content START -->
			<div class="col-md-8 col-lg-6 vstack gap-4 " id="content">
				<!-- News -->
				<div id="news" class="row d-none">
					<h1 class="text-center mb-5">Le ultime news</h1>
					<!-- Pianta un albero -->
					<%
					if (numeroAlberiAcquistati == 0) {
					%>
					<div class="card mb-5" style="width: 65rem;">
						<div class="card-body text-center">
							<h5 class="card-title">
								<b>Pianta il tuo primo albero</b>
							</h5>
							<p class="card-text">Benvenuto nel tuo profilo utente!
								Consideralo il tuo passaporto nel mondo WoodLot. Qui
								visualizzerai alcuni post scritti dal nostro Content team e
								Forestry team, per cominciare a conoscerci meglio. Se quello che
								leggi ti incuriosisce, pianta il tuo primo albero! Entrerai a
								far parte della nostra community e avrai accesso a contenuti
								esclusivi.</p>
							<a href="Catalogo" class="card-link">Pianta un albero</a>
						</div>
					</div>
					<%
					} else {
					%>
					<div class="mb-5 px-5" style="width: 65rem;">

						<h5 class="card-title text-center">
							<b>Benvenuto nel tuo profilo</b>
						</h5>
						<p class="card-text">Benvenuto nel tuo profilo utente!
							Consideralo il tuo passaporto nel mondo WoodLot. Qui
							visualizzerai alcuni post scritti dal nostro Content team e
							Forestry team, per cominciare a conoscerci meglio.</p>
					</div>
					<%
					}
					%>
					<!-- News 1 -->
					<div class="card mb-5" style="width: 65rem;">
						<img class="card-img-top" src="./resources/img/profilo/news1.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text">
							<p>
								<b>L’albero giusto, nel posto giusto e per il giusto scopo.</b>
							</p>
							<p>Conosci la storia dei sei uomini e l’elefante? Sei uomini
								che non avevano mai visto un elefante scommisero di riuscire a
								descrivere con precisione il suo aspetto, tenendo gli occhi
								bendati. Ognuno di loro si mise ad esplorare una parte diversa
								dell’animale.</p>
							<p>Chi ne studiava l’orecchio concluse “l’elefante ha
								l’aspetto di un ventaglio!”, mentre chi esplorava la coda disse
								“l'elefante è sicuramente simile ad una corda”. Tutti avevano in
								parte ragione, e tutti avevano torto, perché ognuno si era
								basato su informazioni parziali, senza prendere in
								considerazione le altre.</p>
							<p>Nessun problema può essere approcciato a compartimenti
								stagni. Soprattutto se si tratta di problemi complessi come la
								lotta al cambiamento climatico. Non esistono soluzioni semplici,
								veloci, magiche. Esistono però approcci che prendono in
								considerazione tutte le parti dell’elefante. Ed è quello che
								facciamo a WoodLot.</p>
							<p>Come? Piantando l’albero giusto, nel posto giusto e per il
								giusto scopo. In un modo che porta benefici all’ambiente, ma
								anche alle persone che lo abitano</p>
						</div>
					</div>

					<!-- News 2 -->
					<div class="card mb-5" style="width: 65rem;">
						<img class="card-img-top" src="./resources/img/profilo/news2.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text">
							<p>
								<b>Il Diario dell’Albero - gli alberi che raccontano il
									mondo in cui viviamo</b>
							</p>
							<p>Siate i benvenuti! Se siete arrivati fin qui,
								probabilmente sapete già che WoodLot pianta alberi con un metodo
								che porta benefici sia all’ambiente, che alle persone che lo
								abitano. Ma forse non sapete che WoodLot è anche una community
								virtuale di custodi di alberi, che vive in un luogo speciale: il
								Diario dell’Albero.</p>
							<p>Se deciderai di piantare un albero, su questo wall
								comincerai a ricevere aggiornamenti sul progetto di cui
								quell’albero fa parte. Entrerai in punta di piedi nella vita
								delle persone che se ne prendono cura. Scoprirai le
								caratteristiche botaniche della specie che hai deciso di
								piantare, e imparerai moltissimso sul Paese in cui il tuo albero
								cresce.</p>
							<p>I post del Diario dell’Albero sono scritti dal nostro
								Forestry e Content Team, per aprirvi una finestra su mondi che
								ancora non conoscete, esercitare la vostra curiosità, e farvi
								sentire il più vicino possibile alla bellezza di quello che
								state contribuendo a fare. .</p>
							<p>Speriamo di ritrovarvi fra queste pagine!</p>
						</div>
					</div>

					<!-- News 3 -->
					<div class="card mb-5" style="width: 65rem;">
						<img class="card-img-top" src="./resources/img/profilo/news3.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text">
							<p>
								<b>Regala un albero</b>
							</p>
							<p>Dicono che i regali più belli sono quelli che non si
								possono incartare.</p>
							<p>In qualsiasi momento, e per qualsiasi occasione, puoi
								regalare un albero WoodLot a qualcuno che ami. Basta una mail o
								un messaggio per consegnarlo al suo destinatario, e renderlo
								parte di una community di custodi di alberi che cresce ogni
								giorno.</p>
							<p>Attraverso il tuo regalo, anche i tuoi cari parteciperanno
								a rendere il mondo non solo più verde, ma anche più giusto</p>

						</div>
					</div>
				</div>
				<!-- Ordini -->
				<div id="ordini" class="row d-none px-5">
					<h1 class="text-center">I tuoi ordini</h1>
					<%
					if (ordini.size() != 0 && ordini != null) {
					%>
					<p class="text-center">Qui puoi trovare il riepilogo degli
						ordini fatti nel nostro shop</p>
					<table class="table table-hover text-center">
						<thead>
							<tr>
								<th scope="col">Numero Ordine</th>
								<th scope="col">Totale</th>
								<th scope="col">Numero Prodotti</th>
								<th scope="col">Effettuato il</th>
							</tr>
						</thead>
						<tbody>
							<%
							Iterator<?> it = ordini.iterator();
							while (it.hasNext()) {
								Ordine ordine = (Ordine) it.next();
								DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");
								String formatDateTime = ordine.getCreatoIl().format(format);
							%>
							<tr>
								<th scope="row" class="nr"><a class="botteneIdOrdine"><%=ordine.getId()%></a></th>
								<td><%=dFormat.format(ordine.getTotalePagato())%> €</td>
								<td><%=ordine.getTotaleProdotti()%></td>
								<td><%=formatDateTime%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
					<!-- Ordini -->
					<div id="ordineAlert" class="alert alert-success m-5 d-none"
						role="alert">
						<div class="row">
							<div class="col">
								<h4 class="alert-heading" id="numeroOrdineAlert"></h4>
							</div>
							<div class="col-1 text-end">
								<button type="button" class="btn-close" id="closeOrdineAlert"
									aria-label="Close"></button>
							</div>
						</div>
						<p>L'ordine contiene i seguenti prodotti:</p>
						<ol id="prodottiOrdineAlert"></ol>
						<hr>
						<p class="mb-0" id="dettaglioOrdineAlert"></p>

					</div>
					<%
					} else if (ordini.size() == 0) {
					%>
					<p class="text-center">
						Non hai ancora effettuato alcun ordine. Rimedia subito! Vai al <a
							href="Catalogo">catalogo</a>
					</p>
					<%
					}
					%>
				</div>
				<!-- WoodLot -->
				<div id="woodLot" class="row d-none ">
					<h1 class="text-center">Il tuo WoodLot</h1>

					<%
					if (numeroAlberiAcquistati == 0) {
					%>
					<p class="text-center mb-3">
						Non hai ancora alberi ...torna al <a href="Catalogo">negozio</a>
					</p>
					<%
					} else if (numeroAlberiAcquistati >= 1) {
					%>
					<p class="text-center mb-3">Qui puoi visualizzare tutti i tuoi
						alberi!</p>
					<%
					}
					Iterator<?> it1 = ordini.iterator();
					while (it1.hasNext()) {
					Ordine ordine = (Ordine) it1.next();
					Collection<ProdottoOrdine> prodotti = ordine.getItems();
					Iterator<ProdottoOrdine> it2 = prodotti.iterator();
					while (it2.hasNext()) {

						ProdottoOrdine prodottoOrdine = it2.next();
						DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");
						String formatDateTime = ordine.getCreatoIl().format(format);
					%>

					<div class="card my-3" style="max-width: 1300px;">
						<div class="row">
							<div class="col-md-4">
								<img style="max-heigt: 90px;"
									src="./ServletResources?codiceAzione=fotoProdottoOrdine&idProdottoOrdine=<%=prodottoOrdine.getId()%>"
									class="img-fluid rounded-start"
									onerror="this.src='./resources//img/error.jpg'">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title"><%=prodottoOrdine.getNome()%></h5>
									<p class="card-text"><%=prodottoOrdine.getDescrizione()%></p>
									<p class="card-text">
										<b>Data di nascita:</b><%=formatDateTime%>
									</p>
									<%
									String descrizione = prodottoOrdine.getBreveDescrizione();
									String[] splits = descrizione.split(", Categorie:");
									String name = (splits[0].replace("Paese:", "").trim());
									%>
									<p class="card-text">
										<b>Paese:</b>
										<%=name%>
									</p>
									<%
									if (ordine.isRegalo()) {
									%>
									<p class="card-text">
										Hai regalato questo ordine a <b><%=ordine.getDestinatarioRegalo()%></b>
									</p>
									<%
									}
									%>
									<div class="progress-bar-container mb-3 ">
										<div id="progress-bar-<%=prodottoOrdine.getStato()%>"></div>
										<%
										String spiegazione = "";
										if (prodottoOrdine.getStato().equals("seme")) {
											spiegazione = "Si comincia da un piccolo seme, al caldo nella terra.";
										%>
										<div class="circles-container">
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-leaf"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-seedling"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-location-dot"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-image"></i>
												</h3>
											</div>
										</div>

										<%
										} else if (prodottoOrdine.getStato().equals("piantato")) {
										spiegazione = "la tua piantina ha finalmente messo radici nella terra, diventerà presto un albero grande e forte";
										%>
										<div class="circles-container">
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-leaf"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-seedling"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-location-dot"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-image"></i>
												</h3>
											</div>
										</div>
										<%
										} else if (prodottoOrdine.getStato().equals("vivaio")) {
										spiegazione = "La tua piantina è abbastanza grande da essere accolta in uno dei nostri vivai, insieme a tante altre.";
										%>
										<div class="circles-container">
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-leaf"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-seedling"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-location-dot"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-image"></i>
												</h3>
											</div>
										</div>
										<%
										} else if (prodottoOrdine.getStato().equals("fotografato")) {
										spiegazione = "In posa! Ora che è abbastanza grande, ecco la foto del tuo albero!";
										%>
										<div class="circles-container">
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-leaf"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-seedling"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-location-dot"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-image"></i>
												</h3>
											</div>
										</div>
										<%
										}
										%>
									</div>
									<div class="alert alert-primary" role="alert"
										style="background-color: #e5c59c;"><%=spiegazione%>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					}
					%>
				</div>
				<!-- Badge -->
				<div class="row d-none" id="badge">

					<%
					int maxCat = 0;
					int i = 0;
					int p = 0;
					int g = 0;
					Iterator<?> it4 = ordini.iterator();
					while (it4.hasNext()) {
						Ordine ordine = (Ordine) it4.next();
						Collection<ProdottoOrdine> prodotti = ordine.getItems();
						Iterator<ProdottoOrdine> it5 = prodotti.iterator();
						while (it5.hasNext()) {
							ProdottoOrdine prodottoOrdine = it5.next();

							String descrizione = prodottoOrdine.getBreveDescrizione();
							String[] splits = descrizione.split(", Categorie:");
							String name = (splits[0].replace("Paese:", "").trim());
							String categorie = splits[1].trim();

							int cat = Integer.parseInt(categorie);

							if (maxCat < cat) {
						maxCat = cat;
							}

							if (name.equalsIgnoreCase("italia"))
						i = 1;
							else if (name.equalsIgnoreCase("perù"))
						p = 1;
							else if (name.equalsIgnoreCase("guatemala"))
						g = 1;
						}
					}

					int paesi = i + p + g;
					%>

					<h1 class="text-center">I tuoi badge</h1>

					<div class="row row-cols-1 row-cols-md-3 g-3 text-center">
						<!-- Astrologo -->
						<div class="card">
							<img src="./resources/img/badge/astrologo.png"
								class="card-img-top <%if (numeroAlberiAcquistati < 40)%>badgeImg "
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Astrologo</h5>
								<%if (numeroAlberiAcquistati < 40) {%>
								<a href="#!" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#astrologoModal">Sblocca</a>
								<%
								} else {
								%>
								<p class="text-center text-success">
									Hai comprato
									<%=numeroAlberiAcquistati%>. Punta sempre più in alto!.
								</p>
								<%
								}
								%>
							</div>
						</div>
						<!-- benefattore -->
						<div class="card">
							<img src="./resources/img/badge/benefattore.png"
								class="card-img-top <%if (numeroDiRegali == 0)%> badgeImg"
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Benefattore</h5>
								<%if (numeroDiRegali == 0) {%>
								<a href="#!" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#benefattoreModal">Sblocca</a>
								<%
								} else {
								%>
								<p class="text-center text-success">Hai fatto il tuo primo
									regalo</p>
								<%
								}
								%>
							</div>
						</div>
						<!-- Giramondo -->
						<div class="card">
							<img src="./resources/img/badge/giramondo.png"
								class="card-img-top <%if (paesi < 3) {%>badgeImg" <%}%>
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Giramondo</h5>
								<%
								if (paesi < 3) {
								%>
								<a href="#!" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#giramondoModal">Sblocca</a>
								<%
								} else {
								%>
								<p class="text-center text-success">I tuoi alberi sono in
									giro per il mondo</p>
								<%
								}
								%>
							</div>
						</div>
						<!-- Matricola -->
						<div class="card">
							<img src="./resources/img/badge/matricola.png"
								class="card-img-top <%if (numeroAlberiAcquistati == 0) {%>badgeImg"
								<%}%> alt="...">
							<div class="card-body">
								<h5 class="card-title">Matricola</h5>
								<%
								if (numeroAlberiAcquistati == 0) {
								%>
								<a href="#!" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#matricolaModal">Sblocca</a>
								<%
								} else {
								%>
								<p class="text-center text-success">Sei una matricola, hai
									piantato il tuo primo albero</p>
								<%}%>
							</div>
						</div>
						<!-- Multitasking -->
						<div class="card">
							<img src="./resources/img/badge/multitasking.png"
								class="card-img-top <%if (maxCat < 3) {%> badgeImg" <%}%>
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Multitasking</h5>
								<%
								if (maxCat < 3) {
								%>
								<a href="#!" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#multitaskingModal">Sblocca</a>
								<%
								} else {
								%>
								<p class="text-center text-success">Hai comprato alberi che
									assolvono a molti usi</p>
								<%}%>
							</div>
						</div>
						<!-- Tarzan -->
						<div class="card">
							<img src="./resources/img/badge/tarzan.png"
								class="card-img-top <%if (numeroAlberiAcquistati < 20) {%> badgeImg"
								<%}%> alt="...">
							<div class="card-body">
								<h5 class="card-title">Tarzan</h5>
								<%
								if (numeroAlberiAcquistati < 20) {
								%>
								<a href="#!" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#tarzanModal">Sblocca</a>
								<%
								} else {
								%>
								<p class="text-center text-success">
									Congratulazioni la tua foresta conta
									<%=numeroAlberiAcquistati%>
									alberi
								</p>
								<%
								}
								%>
							</div>
						</div>
						<div class="mb-5"></div>
					</div>
				</div>

				<!-- Indirizzo -->
				<div id="indirizzo" class="row px-5  pb-5">
					<h1 class="text-center">I tuoi indirizzi</h1>
					<%
					Collection<Indirizzo> indirizzi = utente.getIndirizzi();

					if (indirizzi != null && indirizzi.size() != 0) {
						Iterator<?> it = indirizzi.iterator();
					%>
					<p class="text-center">Qui puoi trovare un riepilogo degli
						indirizzi che hai salvato</p>

					<%
					while (it.hasNext()) {
						Indirizzo indirizzo = (Indirizzo) it.next();
					%>
					<div class="card col-5 text-center">
						<a
							href="Indirizzi?action=elimina&idIndirizzo=<%=indirizzo.getId()%>"
							class="text-end text-danger p-2"><i
							class="fa-solid fa-xmark "></i> </a>
						<div class="card-body">
							<h4 class="card-title">Indirizzo</h4>
							<p class="card-text ">
								<b>Nome: </b>
								<%=indirizzo.getNome()%>
							</p>
							<p class="card-text">
								<b>Cognome: </b>
								<%=indirizzo.getCognome()%>
							</p>
							<p class="card-text">
								<b>Via: </b>
								<%=indirizzo.getVia()%>
							</p>
							<p class="card-text">
								<b>Civico:</b>
								<%=indirizzo.getCivico()%>
							</p>
							<p class="card-text">
								<b>Citta: </b>
								<%=indirizzo.getCittà()%>
							</p>
							<p class="card-text">
								<b>Cap: </b>
								<%=indirizzo.getCAP()%>
							</p>
							<p class="card-text">
								<b>Provincia:</b>
								<%=indirizzo.getProvincia()%>
							</p>
							<form
								action="Indirizzi?action=preferred&idIndirizzo=<%=indirizzo.getId()%>"
								method="POST">
								<div class="form-check form-switch">
									<input class="form-check-input" type="checkbox" role="switch"
										id="preferred" onchange="this.form.submit()" <%if(indirizzo.isPreferred()){%> checked <%} %>> <label
										class="form-check-label" for="preferred">Preferito</label>
								</div>
							</form>
						</div>
					</div>
					<%
					}
					} else {
					%>
					<p class="text-center">Non hai salvato nessun indirizzo di
						fatturazione!</p>
					<%
					}
					%>
					<div class="row text-center m-5 ">
						<a href="#showIndirizzo" class="btn btn-primary btn-lg"
							id="addIndirizzo">Aggiungi un indirizzo</a>
					</div>
					<div id="showIndirizzo" class="d-none">
						<h4 class="mb-3">Inidirizzo di fatturazione</h4>

						<form class="needs-validation" novalidate autocomplete="off"
							name="salvaIndirizzo" action="Indirizzi?action=salvaIndirizzo"
							method="POST" id="formAddress" onsubmit="return false;">
							<div class="row g-3">
								<div class="col-sm-6">
									<label for="nome" class="form-label">Nome</label> <input
										name="nome" type="text" class="form-control" id="nome"
										placeholder="Mario" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">Il nome non è valido.</div>
								</div>
								<div class="col-sm-6">
									<label for="cognome" class="form-label">Cognome</label> <input
										name="cognome" type="text" class="form-control" id="cognome"
										placeholder="Rossi" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">Il cognome non è valido.</div>
								</div>
								<div class="col-md-5">
									<label for="via" class="form-label">Via</label> <input
										name="via" type="text" class="form-control" id="via"
										placeholder="Via Roma" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">La via non è corretta.</div>
								</div>
								<div class="col-md-3">
									<label for="civico" class="form-label">Civico</label> <input
										name="civico" type="text" class="form-control" id="civico"
										placeholder="100" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">Il civico non è corretto.</div>
								</div>
								<div class="col-md-3">
									<label for="citta" class="form-label">Città</label> <input
										type="text" class="form-control" id="citta" name="citta"
										placeholder="Roma" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">La città non è corretta.</div>
								</div>
								<div class="col-md-3">
									<label for="provincia" class="form-label">Provincia</label> <input
										name="provincia" type="text" class="form-control"
										id="provincia" placeholder="RO" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">La provincia non è
										corretta.</div>
								</div>
								<div class="col-md-3">
									<label for="cap" class="form-label">CAP</label> <input
										name="cap" type="text" class="form-control" id="cap"
										placeholder="00123" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">Il CAP non è corretto.</div>
								</div>
							</div>
							<hr class="my-4">
							<button class="w-100 btn btn-primary btn-lg mb-5"
								id="formAddress" onClick="doCheck()">Salva</button>
						</form>

					</div>
				</div>
				<!-- Regali -->
				<div id="regali" class="row d-none">
					<h1 class="text-center">I tuoi regali</h1>
					<p class="text-muted text-center">Qui puoi visualizzare i
						regali che hai ricevuto.</p>
					<%
					if (ordiniRegalati != null && ordiniRegalati.size() != 0) {
						Iterator<?> it8 = ordiniRegalati.iterator();
						while (it8.hasNext()) {
							Ordine ordine = (Ordine) it8.next();
							if (ordine.getMessaggioRegalo().equals("riscattato")) {
						Collection<ProdottoOrdine> prodotti = ordine.getItems();
						Iterator<ProdottoOrdine> it9 = prodotti.iterator();
						while (it9.hasNext()) {
							ProdottoOrdine prodottoOrdine = it9.next();
					%>
					<div class="card m-3" style="max-width: 1440px;">
						<div class="row g-3">
							<div class="col-md-4">
								<img
									src="./ServletResources?codiceAzione=fotoProdottoOrdine&idProdottoOrdine=<%=prodottoOrdine.getId()%>"
									class="img-fluid rounded-start" alt="..."
									onerror="this.src='./resources//img/error.jpg'">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title"><%=prodottoOrdine.getNome()%></h5>
									<h6 class="card-title"><%=ordine.getUtente().getNome()%>
										ti ha regalato questo albero
									</h6>
									<p class="card-text"><%=prodottoOrdine.getDescrizione()%></p>
									<p class="card-text">
										<b>Data di nascita:</b><%=ordine.getCreatoIl()%>
									</p>

									<div class="progress-bar-container mb-3 ">
										<div id="progress-bar-<%=prodottoOrdine.getStato()%>"></div>
										<%
										String spiegazione = "";
										if (prodottoOrdine.getStato().equals("seme")) {
											spiegazione = "Si comincia da un piccolo seme, al caldo nella terra.";
										%>
										<div class="circles-container">
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-leaf"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-seedling"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-location-dot"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-image"></i>
												</h3>
											</div>
										</div>

										<%
										} else if (prodottoOrdine.getStato().equals("piantato")) {
										spiegazione = "";
										%>
										<div class="circles-container">
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-leaf"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-seedling"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-location-dot"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-image"></i>
												</h3>
											</div>
										</div>
										<%
										} else if (prodottoOrdine.getStato().equals("vivaio")) {
										spiegazione = "La tua piantina è abbastanza grande da essere accolta in uno dei nostri vivai, insieme a tante altre.";
										%>
										<div class="circles-container">
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-leaf"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-seedling"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-location-dot"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-image"></i>
												</h3>
											</div>
										</div>
										<%
										} else if (prodottoOrdine.getStato().equals("fotografato")) {
										spiegazione = "In posa! Ora che è abbastanza grande, ecco la foto del tuo albero!";
										%>
										<div class="circles-container">
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-leaf"></i>
												</h3>
											</div>
											<div class="circle active">
												<h3>
													<i class="fa-solid fa-seedling"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-location-dot"></i>
												</h3>
											</div>
											<div class="circle">
												<h3>
													<i class="fa-solid fa-image"></i>
												</h3>
											</div>
										</div>
										<%
										}
										%>
									</div>
									<div class="alert alert-primary" role="alert"
										style="background-color: #e5c59c;"><%=spiegazione%>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					} else {
					%>
					<p class="text-center text-danger">
						
					</p>
					<%
					}
					}
					%>
					<%
					} 
					%>
					
				</div>
				<!-- Row END -->
			</div>
		</div>
	</div>

	<!-- Modal Astrologo -->
	<div class="modal fade" id="astrologoModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Astrologo</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Mira alle stelle e pianta l'albero del
					tuo segno zodiacale.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Benefattore -->
	<div class="modal fade" id="benefattoreModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Benefattore</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Sii generoso e regala almeno un
					albero. Otterrai il riconoscimento quando la persona a cui hai
					regalato l'albero, lo riscatterà, diventandone così custode e
					iniziando a seguirne la storia.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Giramondo -->
	<div class="modal fade" id="giramondoModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Giramondo</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Supera i confini e pianta almeno un
					albero in 3 paesi diversi.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Matricola -->
	<div class="modal fade" id="matricolaModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Matricola</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Inizia la tua esperienza e pianta il
					tuo primo albero.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Multitasking -->
	<div class="modal fade" id="multitaskingModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Multitasking</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Gli alberi sanno essere utili in molti
					modi. Pianta alberi che assolvono ad almeno 6 dei loro 8 usi e
					benefici.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Tarzan -->
	<div class="modal fade" id="tarzanModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Tarzan</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Non essere timido e crea la tua prima
					foresta.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<!-- DOM Manipulation -->
	<script>
	$(document).ready(function() {
		
		$("#myProfileButton").click(function() {
			$("#myProfileMenu").toggleClass("d-none");
		});

	$("#ordiniButton").click(function() {
		$("#ordini").removeClass("d-none");
		$("#badge").addClass("d-none");
		$("#woodLot").addClass("d-none");
		$("#news").addClass("d-none");
		$("#indirizzo").addClass("d-none");
		$("#regali").addClass("d-none");
		$("#myProfileMenu").toggleClass("d-none");
	});

	$("#badgeButton").click(function() {
		$("#badge").removeClass("d-none");
		$("#ordini").addClass("d-none");
		$("#woodLot").addClass("d-none");
		$("#news").addClass("d-none");
		$("#indirizzo").addClass("d-none");
		$("#regali").addClass("d-none");
		$("#myProfileMenu").toggleClass("d-none");
	});

	$("#woodLotButton").click(function() {
		$("#woodLot").removeClass("d-none");
		$("#badge").addClass("d-none");
		$("#ordini").addClass("d-none");
		$("#news").addClass("d-none");
		$("#indirizzo").addClass("d-none");
		$("#regali").addClass("d-none");
		$("#myProfileMenu").toggleClass("d-none");
	});

	$("#newsButton").click(function() {
		$("#news").removeClass("d-none");
		$("#badge").addClass("d-none");
		$("#ordini").addClass("d-none");
		$("#woodLot").addClass("d-none");
		$("#indirizzo").addClass("d-none");
		$("#regali").addClass("d-none");
		$("#myProfileMenu").toggleClass("d-none");
	});

	$("#indirizzoButton").click(function() {
		$("#indirizzo").removeClass("d-none");
		$("#badge").addClass("d-none");
		$("#ordini").addClass("d-none");
		$("#woodLot").addClass("d-none");
		$("#news").addClass("d-none");
		$("#regali").addClass("d-none");
		$("#myProfileMenu").toggleClass("d-none");
	});

	$("#regaliButton").click(function() {
		$("#regali").removeClass("d-none");
		$("#badge").addClass("d-none");
		$("#ordini").addClass("d-none");
		$("#woodLot").addClass("d-none");
		$("#news").addClass("d-none");
		$("#indirizzo").addClass("d-none");
		$("#myProfileMenu").toggleClass("d-none");
	});

	$(".botteneIdOrdine").click(function() {
		var $row = $(this).closest("tr");
		var $codice = $row.find(".nr").text();
		$.get('OrdineJSON?action=vedi&codice=' + $codice, function(resp) {
			printDettagliOrdine(resp);
		}).fail(function() {
			alert("Request failed.");
		});
	});
	
	$("#closeOrdineAlert").click(function() {
		$("#ordineAlert").addClass("d-none");
	});
	
	$("#addIndirizzo").click(function() {
		$("#showIndirizzo").removeClass("d-none");
	});

});


function printDettagliOrdine(json) {
	$("#ordineAlert").removeClass("d-none");
	$("#numeroOrdineAlert").empty().append("<h4>Dettaglio ordine n." + json.id + "</h4>");

	$("#prodottiOrdineAlert").empty();
	json.items.forEach((e) => {
		$("#prodottiOrdineAlert").append("<li>" + "<b>Nome:</b> " + e.nome + ", Prezzo: " + e.prezzo + "€, Quantità: "
			+ e.quantità + ", Saldo: " + e.saldo + "%, tasse: " + e.tasse + "%, Stato: " + e.stato +
			"</li>");
	});

	$("#dettaglioOrdineAlert").empty().append("<b>N. Prodotti:</b>" + json.totaleProdotti + ", ");
	$("#dettaglioOrdineAlert").append("<b>Totale Ordine:</b>" + json.totalePagato + "€, ");
	$("#dettaglioOrdineAlert").append("<b>Regalo?:</b>" + json.regalo + ", ");
	$("#dettaglioOrdineAlert").append("<b>Messaggio Regalo</b>" + json.messaggioRegalo + ", ");
	$("#dettaglioOrdineAlert").append("<b>Destinatario Regalo</b>" + json.destinatarioRegalo + ", ");
}
</script>
	<script type="text/javascript">
		
		var nome = document.salvaIndirizzo.nome;
		var cognome = document.salvaIndirizzo.cognome;
		var citta = document.salvaIndirizzo.citta; 
		var via = document.salvaIndirizzo.via;
		var civico = document.salvaIndirizzo.civico; 
		var provincia = document.salvaIndirizzo.provincia; 
		var cap =  document.salvaIndirizzo.cap;
		
		let validNome = false;
		let validCognome = false;
		let validCitta = false;
		let validVia = false;
		let validCivico = false;
		let validProvincia = false;
		let validCap = false;
		
		nome.addEventListener('blur', () => {
			let regex = /^[a-zA-Z]([ a-zA-Z]){1,10}$/;
			let str = nome.value;
			if (regex.test(str)) {
				nome.classList.add("is-valid");
				nome.classList.remove("is-invalid");
				validNome = true;
			} else {
				nome.classList.add("is-invalid");
				nome.classList.remove("is-valid");
				validNome = false;
			}
			
			nome.classList.add("was-validated");
		});
		
		cognome.addEventListener('blur', () => {
			let regex = /^[a-zA-Z]([ a-zA-Z]){1,10}$/;
			let str = cognome.value;
			if (regex.test(str)) {
				cognome.classList.add("is-valid");
				cognome.classList.remove("is-invalid");
				validCognome = true;
			} else {
				cognome.classList.add("is-invalid");
				cognome.classList.remove("is-valid");
				validCognome = false;
			}
			
			cognome.classList.add("was-validated");
		});
		
		provincia.addEventListener('blur', () => {
			let regex = /^[A-Z]{2}$/;
			let str = provincia.value;
			if (regex.test(str)) {
				provincia.classList.add("is-valid");
				provincia.classList.remove("is-invalid");
				validProvincia = true;
			} else {
				provincia.classList.add("is-invalid");
				provincia.classList.remove("is-valid");
				validProvincia = false;
			}
			
			provincia.classList.add("was-validated");
		});
		
		citta.addEventListener('blur', () => {
			let regex = /^[a-zA-Z]([ a-zA-Z]){1,10}$/;
			let str = citta.value;
			if (regex.test(str)) {
				citta.classList.add("is-valid");
				citta.classList.remove("is-invalid");
				validCitta = true;
			} else {
				citta.classList.add("is-invalid");
				citta.classList.remove("is-valid");
				validCitta = false;
			}
			
			citta.classList.add("was-validated");
		});
		
		via.addEventListener('blur', () => {
			let regex = /^[a-zA-Z]([ a-zA-Z])+$/;
			let str = via.value;
			if (regex.test(str)) {
				via.classList.add("is-valid");
				via.classList.remove("is-invalid");
				validVia = true;
			} else {
				via.classList.add("is-invalid");
				via.classList.remove("is-valid");
				validVia = false;
			}
			
			via.classList.add("was-validated");
		});

		cap.addEventListener('blur', () => {
			let regex = /^\d{5}$/;
			let str = cap.value;
			if (regex.test(str)) {
				cap.classList.add("is-valid");
				cap.classList.remove("is-invalid");
				validCap = true;
			} else {
				cap.classList.add("is-invalid");
				cap.classList.remove("is-valid");
				validCap = false;
			}
			
			cap.classList.add("was-validated");
		});
		
		civico.addEventListener('blur', () => {
			let regex = /^[0-9]+$/;
			let str = civico.value;
			if (regex.test(str)) {
				civico.classList.add("is-valid");
				civico.classList.remove("is-invalid");
				validCivico = true;
			} else {
				civico.classList.add("is-invalid");
				civivo.classList.remove("is-valid");
				validCivico = false;
			}
			
			civico.classList.add("was-validated");
		});
		
		function doCheck(){
			if(validNome && validCognome && validCitta && validVia && validCivico && validProvincia && validCap){
				document.getElementById('formAddress').onsubmit='';
				document.getElementById("formAddress").submit();
			}
			return;
		}
		
	
	
	</script>
	<!-- Footer -->
	<%@ include file="../fragments/footer.jsp"%>
</body>
</html>