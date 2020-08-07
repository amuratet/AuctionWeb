package fr.eni.AuctionWebapp.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.AuctionWebapp.BLL.ArticleManager;
import fr.eni.AuctionWebapp.BLL.CategorieManager;
import fr.eni.AuctionWebapp.BO.Article;
import fr.eni.AuctionWebapp.BO.Categorie;

/**
<<<<<<< HEAD:src/fr/eni/AuctionWebapp/servlets/Accueil.java
 * Servlet de la page Accueil
 * @author alk
=======
 * Servlet implementation class ProfilCreer
>>>>>>> pageProfil:src/fr/eni/AuctionWebapp/servlets/ProfilCreer.java
 */
@WebServlet("/ProfilCreer")
public class ProfilCreer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD:src/fr/eni/AuctionWebapp/servlets/Accueil.java
		String boutonFiltre = "Filtrer";
		List<Article> articles = new ArrayList<Article>();
		List<Categorie> categories = new ArrayList<Categorie>();
		
		String filtreCategorie = request.getParameter("filtreCategorie");
		
		if (filtreCategorie != null && !filtreCategorie.isEmpty()) {
			boutonFiltre = "Annuler";
			try {
				ArticleManager articleManager = new ArticleManager();
				articles = articleManager.selectAll(filtreCategorie);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("erreur", "Échec dans le filtrage des articles");
			}
			
		} else {
			boutonFiltre = "Filtrer";
			try {
				ArticleManager articleManager = new ArticleManager();
				articles = articleManager.selectAll();
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("erreur", "Échec dans la récupérations des articles");
			}
		}
		
		request.setAttribute("boutonFiltre", boutonFiltre);
		request.setAttribute("articles", articles);
		
		try {
			CategorieManager categorieManager = new CategorieManager();
			categories = categorieManager.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erreur", "Échec dans la récupérations des catégories");
		}
		request.setAttribute("categories", categories);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/Accueil.jsp");
=======
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/ProfilCreer.jsp");
>>>>>>> pageProfil:src/fr/eni/AuctionWebapp/servlets/ProfilCreer.java
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
