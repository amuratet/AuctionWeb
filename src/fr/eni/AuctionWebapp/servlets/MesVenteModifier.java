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

import fr.eni.AuctionWebapp.BLL.CategorieManager;
import fr.eni.AuctionWebapp.BO.Categorie;

/**
 * Servlet implementation class MesVenteModifier
 */
@WebServlet("/MesVenteModifier")
public class MesVenteModifier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
List<Categorie> categories = new ArrayList<Categorie>();
		
		try {
			CategorieManager categorieManager = new CategorieManager();
			categories = categorieManager.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erreur", "Échec dans la récupérations des catégories");
		}
		request.setAttribute("categories", categories);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/MesVenteModifier.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
