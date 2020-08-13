<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page profil modifier</title>

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/ajustementsPerso.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/profil.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/auctionMainCss/recurentElements.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>
<body>

	<%
		Boolean isConnected = session.getAttribute("userId") != null;
		Boolean isAdmin = session.getAttribute("isAdmin") == "oui";
		String idUser = (String) session.getAttribute("userId");
		int userId = 0;
		if (idUser != null)
			userId = Integer.parseInt(idUser);
		System.out.println("user : " + userId);
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark auctionNavbar">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/Accueil">AuctionWebapp</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="<%=request.getContextPath()%>/Accueil"><img
			alt="Logo"
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
					if (isAdmin) {
				%>
					<li class="nav-item nav-link auctionAdmin">Admin !</li>
				<%
					}
				%>
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/ProfilCreer?compte=<%= userId %>">Mon profil</a></li>
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

	<div class="container register">
		<div class="row">
			<div class="col-md-9 register-right">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<h3 class="register-heading">Profil de ${ utilisateur.pseudo }</h3>
						<form action="<%=request.getContextPath()%>/ProfilModifier" method="post">
							<div class="row register-form">
								<div class="col-md-6">
									<div class="form-group">
										<input type="hidden" name="vendeurId" value="${ utilisateur.id }"/>
										<input type="text" name="pseudo" class="form-control" value="${ utilisateur.pseudo }" />
									</div>
									<div class="form-group">
										<input type="text" name="nom" class="form-control" value="${ utilisateur.nom }" />
									</div>
									<div class="form-group">
										<input type="text" name="prenom" class="form-control" value="${ utilisateur.prenom }" />
									</div>
	
									<div class="form-group">
										<input type="password" name="mdp1" class="form-control" value="${ utilisateur.mdp }" />
									</div>
									<div class="form-group">
										<input type="password" name="mdp2" class="form-control" value="${ utilisateur.mdp }" />
									</div>
	
									<span  class="spanCredit">Credit : ${ utilisateur.credit } </span>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<input type="email" name="email" class="form-control" value="${ utilisateur.email }" />
									</div>
									<div class="form-group">
										<input type="tel" name="phone" class="form-control" value="${ utilisateur.telephone }" />
									</div>
									<div class="form-group">
										<input type="text" name="cdp" class="form-control" value="${ utilisateur.codePostal }" />
									</div>
									<div class="form-group">
										<input type="text" name="ville" class="form-control" value="${ utilisateur.ville }" />
									</div>
									<div class="form-group">
										<input type="text" name="rue" class="form-control" value="${ utilisateur.rue }" />
									</div>
								</div>
							</div>
						<div class="col-md-9" style="margin: 0 auto; display: flex;">
							<input type="submit" class="btnRegister" value="Enregistrer" />
						</div>
						</form>
						<div class="col-md-9" style="margin: 0 auto; display: flex;">
							<input type="submit" class="btnRegister" value="Supprimer mon compte" style="background-color: #b30000;" />
						</div>
					</div>

				</div>
			</div>
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