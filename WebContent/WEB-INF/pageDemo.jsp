<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Projet ENI Web">
	<meta name="author" content="Équipe Delta">
	<title>ENI Projet en équipe</title>
	
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/vendor/bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="<%=request.getContextPath()%>/css/ajustementsPerso.css" rel="stylesheet">
	
	<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
</head>


<body>

	<!-- HEADER -->
	<header class="py-3 bg-dark header-demodule fixed-top">
	    <div class="container text-center text-white">
	        <h1>AuctionWebapp</h1>
		</div>
	</header>
	
	<div class="mainContainer">
		
		<div class="pictosTeam">
			<img src="<%= request.getContextPath() %>/pictos/amilcar.jpg" alt="Alk" width="8%" style="display:inline-block;" />
			<img src="<%= request.getContextPath() %>/pictos/lewis.jpg" alt="Guyzmo" width="8%" style="display:inline-block;" />
			<img src="<%= request.getContextPath() %>/pictos/victor.jpg" alt="Cluster" width="8%" style="display:inline-block;" />
			<img src="<%= request.getContextPath() %>/pictos/profCut.jpg" alt="Prof" width="8%" style="display:inline-block;" />
		</div>
		<div class="logoTeam">
			<img src="<%= request.getContextPath() %>/pictos/logoAuctionWeb.png" alt="Logo team" width="15%;" />
		</div>
	
		<div class="accueilGo">
			<a class="entree" href="<%=request.getContextPath()%>/Accueil">Entrer</a>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer class="row bg-dark footer-demodule fixed-bottom py-1">
	<div class="col-lg-4 offset-lg-4 text-center text-white">
		<p>Team AuctionWeb ©ENI-2020 Alk | Guyzmo | Cluster</p>
	</div>
	</footer>

</body>
</html>