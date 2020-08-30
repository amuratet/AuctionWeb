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

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/ajustementsPerso.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/introEtAccueil.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/auctionMainCss/recurentElements.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>


<body>

	<%
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

	<div class="acceuilBodyContainer">
	
		<!-- ============================== NAVBAR ============================== -->
		<%@ include file="fragments/navbar.jspf" %>
	
		<!-- On s'assure que tout s'est bien passé (ou non) avec alert -->
		<%
			if (request.getAttribute("erreur") != null) {
		%>
		<div class="alert alert-danger auctionAlert" role="alert" style="text-align: center;"><%=request.getAttribute("erreur")%></div>
		<%
			} else if (request.getAttribute("succes") != null) {
		%>
		<div class="alert alert-success auctionAlert" role="alert" style="text-align: center;"><%=request.getAttribute("succes")%></div>
		<%
			}
		%>
		<!-- FILTRES -->
		<div class="auctionFiltres">
			<p class="titreFiltrer">Filtrer</p>
	
			<form action="<%=request.getContextPath()%>/Accueil" method="get">
				<select name="filtreCategorie" class="filtresSelect">
					<option value="">Catégories</option>
	
					<c:forEach var="categorie" items="${ categories }">
						<option value="${ categorie.libelle }">${ categorie.nomFr }</option>
					</c:forEach>
	
				</select> <select name="date" class="filtresSelect">
					<option value="">Date</option>
					<option value="dateAsc">Croissant</option>
					<option value="dateDesc">Décroissant</option>
				</select>
				<button type="submit">${ boutonFiltre }</button>
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
								<img src="<%=request.getContextPath()%>/uploaded/${empty article.photo ? article.catLibelle : article.photo }${empty article.photo ? '.jpg' : ''}"
									class="img-responsive" alt="Image">
								<div class="articleDescription2">
									<div class="catEtDescription">
										<p class="catArticle2">${ article.catNomFr }</p>
										<p class="articleDescriptionContenu">${article.description}</p>
									</div>
									<p class="pNomVendeur"><a class="nomVendeur" href="<%=request.getContextPath()%>/ProfilCreer?compte=${article.idVendeur}">${ article.pseudoVendeur }</a></p>
								</div>
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
	
		<!-- ============================== FOOTER ============================== -->
		<%@ include file="fragments/footer.jspf" %>
		
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/js/bootstrap.js"></script>

</body>
</html>