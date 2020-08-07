<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profil créer</title>

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/ajustementsPerso.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/profilCreer.css"
	rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>
<body class="bodyProfil">

	<%
		String userConnected = (String) getInitParameter("userConnected");
	Boolean isConnected = userConnected == "true";
	// 	isConnected = false;
	isConnected = true;
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark auctionNavbar">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/Accueil">AuctionWebapp</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="<%=request.getContextPath()%>/Accueil"><img alt="Logo"
			src="<%=request.getContextPath()%>/pictos/pictoAuctionWeb.png"
			width="55" style="position: relative;"></a>
		<div class="collapse navbar-collapse navFlex" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/Accueil">Accueil<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#">Enchères</a></li>
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link" href="#">Vendre un
						article</a></li>
				<%
					}
				%>
			</ul>
			<ul class="navbar-nav">
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/ProfilCreer">Mon profil</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Se
						déconnecter</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/Connexion">Se connecter</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	
	<div class="container containerProfil">
		<h3 class="register-heading h3Profil">Mon profil</h3>

		<div class="col-md-8 colProfil">
			<div class="tab-content profile-tab" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<div class="row">
						<div class="col-md-6">
							<label>Pseudo :</label>
						</div>
						<div class="col-md-6">
							<p>GuYzMoGwAi</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Nom :</label>
						</div>
						<div class="col-md-6">
							<p>Blaud</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Prénom :</label>
						</div>
						<div class="col-md-6">
							<p>Lewis</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Email :</label>
						</div>
						<div class="col-md-6">
							<p>lewisB@gmail.com</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Téléphone</label>
						</div>
						<div class="col-md-6">
							<p>06.08.07.82.97</p>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<label>Rue :</label>
						</div>
						<div class="col-md-6">
							<p>Rue de la paix</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Ville :</label>
						</div>
						<div class="col-md-6">
							<p>Paris</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Code postal :</label>
						</div>
						<div class="col-md-6">
							<p>75008</p>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="col-md-9" style="margin: 0 auto; display: flex;">
					<a class="btnA" href="<%=request.getContextPath()%>/ProfilModifier">
					<input class="btnRegister" type="submit" value="Modifier"/>
					</a>
				</div>
	</div>
	
	<!-- FOOTER -->
	<footer class="container-fluid text-center footerProfil"
		style="border-top: 3px solid #b30000; background-color: #474747;">
		<p>
			<font color="#FFFFFF">AuctionWebTeam ©ENI-2020 Amilcar | Lewis
				| Victor</font>
		</p>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/js/bootstrap.js"></script>

</body>
</html>