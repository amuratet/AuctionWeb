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
	isConnected = true;
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e1f570b... [page Accueil] fin IHM
			<h1 class="jumboH1">
				LES OBJETS SONT NOS AMIS
				<br><span>SITE D'ENCHERES AUTO-GEREES</span>
			</h1><br />
			<img src="<%=request.getContextPath()%>/images/auctionHammer.png" width="280em" class="jumboMarteau">
<<<<<<< HEAD
=======
			<h1 class="jumboH1">Les objets sont nos amis</h1>
			<img src="<%=request.getContextPath()%>/images/auctionHammer2.png" width="150em">
>>>>>>> 30ca951... [pageAccueil] wip couleurs changees + jumboTron
=======
>>>>>>> e1f570b... [page Accueil] fin IHM
			<div class="jumboPictos">
				<img src="<%=request.getContextPath()%>/pictos/partner1.png" alt="picto1" />
				<img src="<%=request.getContextPath()%>/pictos/cube.png" alt="picto2" />
				<img src="<%=request.getContextPath()%>/pictos/share1.png" alt="picto3" />
				<img src="<%=request.getContextPath()%>/pictos/share.png" alt="picto4" />
				<img src="<%=request.getContextPath()%>/pictos/arrow.png" alt="picto5" />
			</div>
		</div>
	</div>


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

	<!-- Liste des produits -->
	<div class="container">
		<div class="row">

			<%
				for (int i = 1; i <= 10; i++) {
			%>
			<div class="col-sm-6 articleDisplay">
				<div class="card articleContent">
					<div class="articleEntete"><%=titreArticle%></div>
					<div class="unArticle">
						<img src="<%=request.getContextPath()%>/images/petroLampe3.jpeg" class="img-responsive"
							alt="Image">
						<p class="articleDescription">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus
							tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices
							diam. <br> <a href="#" class="nomVendeur"> - <%=nomVendeur%> -
							</a>
						</p>
					</div>
					<div class="articlePied">
						Fin des enchères :
						<%=finEnchere%></div>
				</div>
			</div>

			<%
				}
			%>
		</div>
	</div>
		<div aria-label="Page navigation example">
			<ul class="pagination articlesPagination">
				<li class="page-item"><a class="page-link" href="#">Précédent</a></li>
				<%
					for (int i = 1 ; i <= maxPaginationsDisplay && (currentPagination < nbArticles) ; i++) {
						currentPagination += articlesParPage;
						if (i == maxPaginationsDisplay) {
						%>
							<li class="page-item"><a class="page-link" href="#"> ... </a></li>
						<%
						} else {
						%>
							<li class="page-item"><a class="page-link" href="#"><%= i %></a></li>
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