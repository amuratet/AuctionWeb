<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page de connexion</title>

<link
	href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">


<link href="<%=request.getContextPath()%>/css/PageConnexion.css"
	rel="stylesheet">

<style>
/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}
</style>

</head>
<body>

	<nav class="navbar navbar-inverse auctionNavbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img alt="Logo"
					src="<%=request.getContextPath()%>/pictos/pictoAuctionWeb.png"
					width="55" style="position: relative; top: -.7em;"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Accueil</a></li>
					<li><a href="#">Produits</a></li>
					<li><a href="#">Enchères</a></li>
					<li><a href="#">Retraits</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							Mon Compte</a></li>
					<li><a href="#"><span
							class="glyphicon glyphicon-shopping-cart"></span> Panier</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login-form-1">
				<h3>Se connecter</h3>
				<form>
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="Entrer votre Email" value="" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Entrer Mot de passe" value="" />
					</div>
					<label> <input type="checkbox"> Se souvenir de moi.
					</label>
					<div class="form-group">
						<input type="submit" class="btnSubmit" value="Connexion" />
					</div>

					<div class="form-group">
						<a href="#" class="ForgetPwd">Mot de passe oublier?</a>
					</div>
					<div class="form-group">
						<input type="submit" class="btnRegister" value="Inscription" />
					</div>
				</form>
			</div>

		</div>
	</div>

	<!-- FOOTER -->
	<footer class="container-fluid text-center"
		style="border-top: 3px solid #B91439; background-color: #474747;">
		<p>
			<font color="#FFFFFF">AuctionWebTeam ©ENI-2020 Amilcar |
				Lewis|Victor</font>
		</p>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/js/bootstrap.js"></script>
</body>
</html>