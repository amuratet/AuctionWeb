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
 * Servlet implementation class Profil
 */
@WebServlet("/ProfilModifier")
public class ProfilModifier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("compte"));

		System.out.println("Id du vendeur : " + userId + " " + userId instanceof String ? "oui" : "non");

		Utilisateur utilisateur = null;

		try {
			UtilisateurManager utilisateurManager = new UtilisateurManager();
			utilisateur = utilisateurManager.selectById(userId);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erreur", "Echec lors de la récupération de l'utilisateur");
		}
		request.setAttribute("utilisateur", utilisateur);
		request.setAttribute("userId", userId);
		System.out.println(utilisateur.toString());

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/ProfilModifier.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
