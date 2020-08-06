<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Auction web app">
<meta name="author" content="Équipe Delta">
<title>Nos amis les objets</title>
<!-- 
 -->
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/ajustementsPerso.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/auctionMainCss/recurentElements.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>


<body>

	<%
		String userConnected = (String) getInitParameter("userConnected");
	Boolean isConnected = userConnected == "true";
	/* isConnected = true; */
	/* List<String> nomsVendeurs = Liste<String> getInitParameter("nomVendeur"); */
	String titreArticle = "Lampe à pétrole bucolique";
	String nomVendeur = "Avrell Dalton";
	String finEnchere = "10/08/2020";
	Integer nbArticles = 35; /* request.get...() */
	Integer articlesParPage = 10;
	Integer currentPagination = 0; /* à faire mouvoir */
	Integer nbPages = nbArticles / articlesParPage;
	Integer maxPaginationsDisplay = 6;
	%>


	<div class="jumbotron auctionEnteteAccueil" style="margin-bottom: 0;">
		<div class="container text-center">
			<h1 class="jumboH1">
				LES OBJETS SONT NOS AMIS <br> <span>SITE D'ENCHERES AUTO-GEREES</span>
			</h1>
			<br /> <img src="<%=request.getContextPath()%>/images/auctionHammer.png" width="280em"
				class="jumboMarteau">
			<div class="jumboPictos">
				<img src="<%=request.getContextPath()%>/pictos/partner1.png" alt="picto1" /> <img
					src="<%=request.getContextPath()%>/pictos/cube.png" alt="picto2" /> <img
					src="<%=request.getContextPath()%>/pictos/share1.png" alt="picto3" /> <img
					src="<%=request.getContextPath()%>/pictos/share.png" alt="picto4" /> <img
					src="<%=request.getContextPath()%>/pictos/arrow.png" alt="picto5" />
			</div>
		</div>
	</div>

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark auctionNavbar">
		<a class="navbar-brand" href="#">AuctionWebapp</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="#"><img alt="Logo"
			src="<%=request.getContextPath()%>/pictos/pictoAuctionWeb.png" width="55"></a>
		<div class="collapse navbar-collapse navFlex" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">Accueil<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Enchères</a></li>
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link" href="#">Vendre un article</a></li>
				<%
					}
				%>
			</ul>
			<ul class="navbar-nav">
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link" href="#">Mon profil</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Se déconnecter</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link" href="#">S'inscrire</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Se connecter</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<!-- On s'assure que tout s'est bien passé -->
	<%
		if (request.getAttribute("erreur") != null) {
	%>
	<div class="alert alert-danger" role="alert" style="text-align: center;"><%=request.getAttribute("erreur")%></div>
	<%
		}
	%>
	<!-- FILTRES -->
	<div class="auctionFiltres">
		<p class="titreFiltrer">Filtrer</p>
		
		<form action="<%=request.getContextPath()%>/Accueil" method="post">
			<select name="categorie" class="filtresSelect">
				<option value="">Catégories</option>

				<c:forEach var="categorie" items="${ categories }">
					<option value="${ categorie.libelle }">${ categorie.nomFr }</option>
				</c:forEach>

			</select>
			<select name="date" class="filtresSelect">
				<option value="">Date</option>
				<option value="dateAsc">Croissant</option>
				<option value="dateDesc">Décroissant</option>
			</select>
			<button type="submit">Valider</button>
		</form>

	</div>

	<!-- LISTE DES ARTICLES -->
	<div class="container">
		<div class="row">



			<c:forEach var="article" items="${ articles }">
				<div class="col-sm-6 articleDisplay">
					<div class="card articleContent">
						<div class="articleEntete">${ article.nom }</div>
						<div class="unArticle">
							<img src="<%=request.getContextPath()%>/images/${ article.catLibelle }.jpg"
								class="img-responsive" alt="Image">
							<p class="articleDescription">
								<span class="catArticle">${ article.catNomFr }</span><br />${article.description} <br>
								<a href="#" class="nomVendeur"> - Avrell Dalton - </a>
							</p>
						</div>
						<div class="articlePied">Fin des enchères : ${ article.dateFin }</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<div aria-label="Page navigation example">
		<ul class="pagination articlesPagination">
			<li class="page-item"><a class="page-link" href="#">Précédent</a></li>
			<%
				for (int i = 1; i <= maxPaginationsDisplay && (currentPagination < nbArticles); i++) {
				currentPagination += articlesParPage;
				if (i == maxPaginationsDisplay) {
			%>
			<li class="page-item"><a class="page-link" href="#"> ... </a></li>
			<%
				} else {
			%>
			<li class="page-item"><a class="page-link" href="#"><%=i%></a></li>
			<%
				}
			}
			%>
			<li class="page-item"><a class="page-link" href="#">Suivant</a></li>
		</ul>
	</div>
	<br>


	<!-- FOOTER -->
	<footer class="container-fluid text-center bg-dark text-secondary auctionFooter">
		<p>AuctionWebTeam ©ENI-2020 Amilcar | Lewis | Victor</p>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/js/bootstrap.js"></script>

</body>
</html>