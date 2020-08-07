<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<body>

	<%
		String userConnected = (String) getInitParameter("userConnected");
	Boolean isConnected = userConnected == "true";
	// 	isConnected = false;
	isConnected = true;
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark auctionNavbar">
		<a class="navbar-brand" href="#">AuctionWebapp</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="#"><img alt="Logo"
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

	<div class="container register">
		<div class="row">
			<div class="col-md-9 centered">
				
						
						<h3 class="register-heading">Mon profil</h3>
						<div class="row register-form">
							<div class="col-md-9 centered">
								<div class="form-group">
									Pseudo :<input type="text" name="pseudo" class="form-control"
										placeholder="Pseudo *" value="" />
								</div>
								<div class="form-group">
									Nom :<input type="text" name="nom" class="form-control"
										placeholder="Nom *" value="" />
								</div>
								<div class="form-group">
									Prénom :<input type="text" name="prenom" class="form-control"
										placeholder="Prenom *" value="" />
								</div>
								<div class="form-group">
									Email :<input type="email" name="email" class="form-control"
										placeholder="Email *" value="" />
								</div>
								<div class="form-group">
									Téléphone :<input type="tel" name="phone" class="form-control"
										placeholder="Téléphone *"
										pattern="^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$"
										value="" required />
								</div>
								<div class="form-group">
									Rue :<input type="text" name="rue" class="form-control"
										placeholder="Rue *" value="" />
								</div>

								<div class="form-group">
									Ville :<input type="text" name="vile" class="form-control"
										placeholder="Ville *" value="" />
								</div>

								<div class="form-group">
									Code postal :<input type="text" name="cdp" class="form-control"
										placeholder="Code postal *"
										pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" value="" required />
								</div>
								<div class="col-md-9" style="margin: 0 auto; display: flex;">
									<a href="<%=request.getContextPath()%>/ProfilModifier"></a>
									<input type="submit" class="btnRegister" value="Modifier"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
</body>
</html>