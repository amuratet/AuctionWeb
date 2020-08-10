<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page mes vente</title>

<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/mesVente.css"
	rel="stylesheet">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>
<body>
	<!---------- NavBar ---------->
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

	<!---------- Corp ---------->

	<div class="container mainContainer">
		<div class="col-lg-6 mx-auto">
			<h3 style="text-align: center;">Mes Ventes</h3>
			<div class="col-md-12">
				<div class="form-group">
					Aritcle : <input type="text" name="nomArticle" class="form-control"
						value="" />
				</div>

				<div class="form-group">
					Description : <label for="exampleFormControlTextarea1"></label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
				<div class="auctionFiltres">
					<p class="titreFiltrer">Filtrer</p>

					<form action="<%=request.getContextPath()%>/Accueil" method="get">
						<select name="filtreCategorie" class="filtresSelect">
							<option value="">Catégories</option>

							<c:forEach var="categorie" items="${ categories }">
								<option value="${ categorie.libelle }">${ categorie.nomFr }</option>
							</c:forEach>
						</select>
						<button type="submit">${ boutonFiltre }</button>
					</form>

				</div>
				<input id="upload" type="file" onchange="readURL(this);"
					class="form-control border-0" style="background-color: #60de5b">
				<label id="upload-label" for="upload"
					class="font-weight-light text-muted"> </label> <label for="upload"
					class="btn btn-light m-0 rounded-pill px-4"> <i
					class="fa fa-cloud-upload mr-2 text-muted"></i><small
					class="text-uppercase font-weight-bold text-muted">Télécharger
						une image</small>
				</label>

			</div>
			<div class="image-area mt-4">
				<img id="imageResult" src="#" alt=""
					class="img-fluid rounded shadow-sm mx-auto d-block">
			</div>


			<div class="form-group">
				Mise à prix : <input type="text" name="prix" class="form-control"
					value="" />
			</div>
			<div class="form-group">
				Début de l'enchère : <input type="date" name="debut"
					class="form-control" placeholder="" value="" />
			</div>
			<div class="form-group">
				Fin de l'enchère : <input type="date" name="fin"
					class="form-control" placeholder="" value="" />
			</div>
			<div class="retrait">
				Rue : <input type="text" name="rue" class="form-control"
					placeholder="" value="" /> Ville : <input type="text" name="ville"
					class="form-control" placeholder="" value="" /> Code postal : <input
					type="text" name="codePostal" class="form-control" placeholder=""
					value="" />
			</div>
			<input type="submit" class="btnRegister" value="Enregistrer" /> <input
				type="submit" class="btnRegister" value="Annuler" />
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