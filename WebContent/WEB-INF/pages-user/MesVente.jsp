<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page mes vente</title>

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/mesVente.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/auctionMainCss/recurentElements.css" rel="stylesheet">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
	<!---------- NavBar ---------->
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
				<li class="nav-item"><a class="nav-link" href="#">Vendre un article</a></li>
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
					if (isAdmin) {
				%>
				<li class="nav-item nav-link auctionAdmin">Admin !</li>
				<%
					}
				%>
				<%
					if (isConnected) {
				%>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/ProfilCreer?compte=<%=userId%>">Mon
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

	<!---------- Corp ---------->

	<div class="container mainContainer">
		<div class="col-lg-6 mx-auto">
			<h3 style="text-align: center;">Nouvelle vente</h3>
			<form action="<%=request.getContextPath()%>/MesVente" method="post" enctype="multipart/form-data">
				<div class="col-md-12">
					<div class="form-group">
						Article : <input type="text" name="nomArticle" class="form-control" required />
					</div>

					<div class="form-group">
						Description : <textarea class="form-control" name="desciption" id="exampleFormControlTextarea1" rows="3" required></textarea>
					</div>
					<div class="auctionFiltres">

						<select name="categorie" class="filtresSelect" required>
							<option>Catégorie</option>
							<c:forEach var="categorie" items="${ categories }">
								<option value="${ categorie.id }">${ categorie.nomFr }</option>
							</c:forEach>
						</select>

					</div>
						<input id="upload" type="file" onchange="readURL(this);" name="image" />
						<label for="upload"	class="btn btn-light m-0 rounded-pill px-4">
							<i class="fa fa-cloud-upload mr-2 text-muted"></i>
							<small class="text-uppercase font-weight-bold text-muted">Télécharger une image</small>
						</label>

				</div>
				<div class="image-area mt-4" style="padding: 1em;">
						<img id="blah" src="<%=request.getContextPath()%>/images/dontTread2.jpg" alt="image" class="img-fluid rounded shadow-sm mx-auto d-block" style="max-width: 180px;"/>
				</div>


				<div class="form-group" style="width: 6em;">
					Mise à prix : <input type="number" name="prix" class="form-control" required/>
				</div>
				<div class="form-group">
					Début de l'enchère : <input type="date" name="debut" class="form-control" required/>
				</div>
				<div class="form-group">
					Fin de l'enchère : <input type="date" name="fin" class="form-control" required/>
				</div>
				<input type="submit" class="btnRegister" value="Enregistrer" />
				<a href="<%=request.getContextPath()%>/Accueil">Annuler</a>
			</form>
		</div>
	</div>


	<!-- FOOTER -->
	<footer class="container-fluid text-center auctionFooter"
		style="border-top: 3px solid #b30000; background-color: #474747;">
		<p>
			<font color="#FFFFFF">AuctionWebTeam ©ENI-2020 Amilcar | Lewis | Victor</font>
		</p>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/js/bootstrap.js"></script>
		<script type="text/javascript">
	    function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	
	            reader.onload = function (e) {
	                $('#blah')
	                    .attr('src', e.target.result);
	            };
	
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	</script>
</body>
</html>