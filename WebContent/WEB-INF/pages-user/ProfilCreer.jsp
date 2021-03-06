<%@page import="fr.eni.AuctionWebapp.BO.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profil créer</title>

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/ajustementsPerso.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/auctionMainCss/recurentElements.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/profilCreer.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body class="bodyProfil">

	<%
		Boolean isConnected = session.getAttribute("userId") != null;
	Boolean isAdmin = session.getAttribute("isAdmin") == "oui";
	String idUser = (String) session.getAttribute("userId");
	int userId = 0;
	if (idUser != null)
		userId = Integer.parseInt(idUser);
	int vendeurId = (Integer) request.getAttribute("vendeurId");
	System.out.println("vendeur : " + vendeurId);
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark auctionNavbar">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/Accueil">AuctionWebapp</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="<%=request.getContextPath()%>/Accueil"><img alt="Logo"
			src="<%=request.getContextPath()%>/pictos/pictoAuctionWeb.png" width="55"
			style="position: relative;"></a>
		<div class="collapse navbar-collapse navFlex" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/Accueil">Accueil<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#">Enchères</a></li>
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/MesVente">Vendre un article</a></li>
				<%
					}
				%>
			</ul>
			<ul class="navbar-nav">
				<%
					if (isAdmin) {
				%>
				<li class="nav-item nav-link auctionAdmin">Admin !</li>
				<%
					}
				%>
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/ProfilCreer">Mon
						profil</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Se déconnecter</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/Connexion">Se
						connecter</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<div class="container containerProfil">
		<h3 class="register-heading h3Profil">${ utilisateur.pseudo }</h3>
		<form action="<%=request.getContextPath()%>/Accueil" method="get">
			<div class="col-md-8 colProfil">
				<div class="tab-content profile-tab" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<div class="row">
							<div class="col-md-6">
								<label>Pseudo :</label>
							</div>
							<div class="col-md-6">
								<p>${ utilisateur.pseudo }</p>
							</div>
						</div>
						<%
							if (isAdmin || userId == vendeurId) {
						%>

						<div class="row">
							<div class="col-md-6">
								<label>Nom :</label>
							</div>
							<div class="col-md-6">
								<p>${ utilisateur.nom }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Prénom :</label>
							</div>
							<div class="col-md-6">
								<p>${ utilisateur.prenom }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Email :</label>
							</div>
							<div class="col-md-6">
								<p>${ utilisateur.email }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Téléphone :</label>
							</div>
							<div class="col-md-6">
								<p>${ utilisateur.telephone }</p>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<label>Rue :</label>
							</div>
							<div class="col-md-6">
								<p>${ utilisateur.rue }</p>
							</div>
						</div>

						<%
							}
						%>

						<div class="row">
							<div class="col-md-6">
								<label>Ville :</label>
							</div>
							<div class="col-md-6">
								<p>${ utilisateur.ville }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Code postal :</label>
							</div>
							<div class="col-md-6">
								<p>${ utilisateur.codePostal }</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</form>
		<%
			if (isAdmin || userId == vendeurId) {
		%>
		<div class="col-md-9" style="margin: 0 auto; display: flex;">
			<a class="btnA" href="<%=request.getContextPath()%>/ProfilModifier?compte=<%= vendeurId %>"> <input
				class="btnRegister" type="submit" value="Modifier" />
			</a>
		</div>
		<%
			}
		%>
	</div>

	<!-- FOOTER -->
	<footer class="container-fluid text-center footerProfil"
		style="border-top: 3px solid #b30000; background-color: #474747;">
		<p>
			<font color="#FFFFFF">AuctionWebTeam ©ENI-2020 Amilcar | Lewis | Victor</font>
		</p>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/js/bootstrap.js"></script>

</body>
</html>