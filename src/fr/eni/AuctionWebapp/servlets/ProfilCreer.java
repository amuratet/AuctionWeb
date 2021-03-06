package fr.eni.AuctionWebapp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.AuctionWebapp.BLL.UtilisateurManager;
import fr.eni.AuctionWebapp.BO.Utilisateur;

/**
 * Servlet implementation class ProfilCreer
 * 
 * @author Lewis
 */
@WebServlet("/ProfilCreer")
public class ProfilCreer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("vendeurId : " + request.getParameter("compte"));
		int vendeurId = Integer.parseInt(request.getParameter("compte"));

		System.out.println("Id du vendeur : " + vendeurId + " " + vendeurId instanceof String ? "oui" : "non" );
		
		Utilisateur utilisateur = null;
		
		try {
			UtilisateurManager utilisateurManager = new UtilisateurManager();
			utilisateur = utilisateurManager.selectById(vendeurId);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erreur", "Echec lors de la récupération de l'utilisateur");
		}
		request.setAttribute("utilisateur", utilisateur);
		request.setAttribute("vendeurId", vendeurId);
		System.out.println(vendeurId);
		System.out.println(utilisateur.toString());
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/ProfilCreer.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
