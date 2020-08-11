<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page de connexion</title>

<link href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/pageConnexion.css" rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/profilCreer.css"
	rel="stylesheet">

<style>

</style>

</head>
<body>

	<%
		String userConnected = (String) getInitParameter("userConnected");
	Boolean isConnected = userConnected == "true";
	isConnected = false;
	// 	isConnected = true;
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
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/Accueil">Accueil<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="">Enchères</a></li>
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link" href="">Vendre un
						article</a></li>
				<%
					}
				%>
			</ul>
			<ul class="navbar-nav">
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link" href="">Mon
						profil</a></li>
				<li class="nav-item"><a class="nav-link" href="">Se
						déconnecter</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/Inscription">S'inscrire</a></li>
               
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login-form-1">
				<h3>Se connecter</h3>
				<form action="<%= request.getContextPath()%>/Connexion" method="post">
					<div class="form-group">
						<input type="text" name="email" class="form-control"	placeholder="Entrer votre Email" />
					</div>
					<div class="form-group">
						<input type="password" name="mdp" class="form-control" placeholder="Entrer Mot de passe" />
					</div>
					<label> <input type="checkbox" name="checkSouvenir"> Se souvenir de moi.</label>
					<div class="form-group" style="text-align: center;">
						<input type="submit" class="btnSubmit" value="Connexion" />
					</div>

					<div class="form-group">
						<p>Pas encore membre ?</p>
						<a class="btnA btnRegister" href="<%=request.getContextPath()%>/Inscription">S'inscrire</a>
					</div>
				</form>
			</div>

		</div>
	</div>

	<!-- FOOTER -->
	<footer class="container-fluid text-center footerConnexion"
		style="border-top: 3px solid #B91439; background-color: #474747;">
		<p>
			<font color="#FFFFFF">AuctionWebTeam ©ENI-2020 Amilcar | Lewis | Victor</font>
		</p>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/js/bootstrap.js"></script>
</body>
</html>