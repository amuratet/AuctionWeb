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
		request.setAttribute("vendeurId", userId);
		System.out.println(utilisateur.toString());

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/ProfilModifier.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("vendeurId : " + request.getParameter("vendeurId") );
		int vendeurId = Integer.parseInt(request.getParameter("vendeurId"));
		System.out.println("Id du vendeur : " + vendeurId + " " + vendeurId instanceof String ? "oui" : "non");

//		int vendeurId = 1;

		
		System.out.println("Compte : " + vendeurId);
		String pseudo = request.getParameter("pseudo");

		System.out.println("Compte : " + pseudo);
		String nom = request.getParameter("nom");

		System.out.println("Compte : " + nom);
		String prenom = request.getParameter("prenom");
		System.out.println("Compte : " + prenom);

		String mdp1 = request.getParameter("mdp1");
		System.out.println("Compte : " + mdp1);

		String mdp2 = request.getParameter("mdp2");
//
//		if (!mdp1.equals(mdp2)) {
//			request.setAttribute("erreur", "Les mots de passe ne sont pas identiques.");
//			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/ProfilCreer.jsp");
//			rd.forward(request, response);
//		}

		String email = request.getParameter("email");
		System.out.println("Compte : " + email);

		String telephone = request.getParameter("phone");
		System.out.println("Compte : " + telephone);

		String codePostal = request.getParameter("cdp");
		System.out.println("Compte : " + codePostal);

		String ville = request.getParameter("ville");
		System.out.println("Compte : " + ville);

		String rue = request.getParameter("rue");
		System.out.println("Compte : " + rue);

		Utilisateur utilisateur = null;

		try {
			UtilisateurManager utilisateurManager = new UtilisateurManager();
			utilisateur = new Utilisateur(vendeurId,pseudo, nom, prenom, email, telephone, rue, codePostal, ville, mdp1);
			utilisateurManager.update(utilisateur);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erreur", "Echec lors de la récupération de l'utilisateur");
		}
		request.setAttribute("utilisateur", utilisateur);
		request.setAttribute("userId", vendeurId);
		System.out.println(utilisateur.toString());

		request.setAttribute("succes", "Votre profil a bien été modifé");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/Accueil.jsp");
		rd.forward(request, response);
	}

}