<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page d'inscription</title>

<!---------- Style ---------->
<link href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/pageInscription.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/auctionMainCss/recurentElements.css" rel="stylesheet">


</head>
<body>

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
				<li class="nav-item"><a class="nav-link" href="">Enchères</a></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/Connexion">Se
						connecter</a></li>
			</ul>
		</div>
	</nav>
	
		<!-- On s'assure que tout s'est bien passé sinon alert -->
	<%
		if (request.getAttribute("erreur") != null) {
	%>
	<div class="alert alert-danger auctionAlert" role="alert" style="text-align: center;"><%=request.getAttribute("erreur")%></div>
	<%
		} else if (request.getAttribute("succes") != null) {
	%>
	<div class="alert alert-success auctionAlert" role="alert" style="text-align: center;"><%=request.getAttribute("erreur")%></div>
	<%
		}
	%>

	<div class="container register">
		<div class="row">
			<div class="col-md-9 register-right">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<h3 class="register-heading">Formulaire d'inscription</h3>
						<form action="<%= request.getContextPath()%>/Inscription" method="post">
							<div class="row register-form">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" name="pseudo" class="form-control" placeholder="Pseudo *" required />
									</div>
									<div class="form-group">
										<input type="text" name="nom" class="form-control" placeholder="Nom *" required />
									</div>
									<div class="form-group">
										<input type="text" name="prenom" class="form-control" placeholder="Prénom *" required />
									</div>
									<div class="form-group">
										<input type="password" name="mdp1" class="form-control" placeholder="Mot de passe *" required />
									</div>
									<div class="form-group">
										<input type="password" name="mdp2" class="form-control"	placeholder="Confirmer mot de passe *" required />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="Email" name="email" class="form-control" placeholder="Email *" required />
									</div>
									<div class="form-group">
										<input type="text" name="telephone" class="form-control" placeholder="Téléphone *" />
									</div>
									<div class="form-group">
										<input type="text" name="rue" class="form-control" placeholder="Rue *" required />
									</div>
									<div class="form-group">
										<input type="text" name="cp" class="form-control" placeholder="Code postal *" required />
									</div>
									<div class="form-group">
										<input type="text" name="ville" class="form-control" placeholder="Ville *" required />
									</div>
									<input type="submit" class="btnRegister" value="S'inscrire" />
								</div>
							</div>
						</form>
					</div>
				</div>
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
	<script src="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/js/bootstrap.js"></script>

</body>
</html>