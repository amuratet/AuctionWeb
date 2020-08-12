package fr.eni.AuctionWebapp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.eni.AuctionWebapp.BLL.UtilisateurManager;
import fr.eni.AuctionWebapp.BO.Utilisateur;

/**
 * Servlet implementation class Connexion
 */
@WebServlet("/Connexion")
public class Connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String vaLaBas = "/Accueil";
	private String erreur = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/Connexion.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = 0;
		Boolean isAdmin = false;
		HttpSession session = request.getSession();
		String email = checkStringFullfilled(request.getParameter("email"));
		String mdp = checkStringFullfilled(request.getParameter("mdp"));
		System.out.println("params : " + email + " " + mdp);

		try {
			UtilisateurManager utilisateurManager = new UtilisateurManager();
			Utilisateur utilisateur = utilisateurManager.selectByMailForCnx(email);
			userId = utilisateur.getId();
			isAdmin = utilisateur.getAdmin();
			System.out.println("utilisateur mdp : " + utilisateur.getMdp() + " --- form mdp : " + mdp);
			if (!checkMDP(utilisateur.getMdp(), mdp)) {
				erreur = "Vous n'avez pas entré le bon mot de passe";
				vaLaBas = "/WEB-INF/pages-user/Connexion.jsp"; 
			} else {
				erreur = null;
				vaLaBas = "/Accueil";
			}
		} catch (Exception e) {
			e.printStackTrace();
			erreur = erreur != null ? erreur : "Une erreur est survenue de type paranormale";
		}
		
		if (erreur != null)
			request.setAttribute("erreur", erreur);
		else
			request.setAttribute("succes", "Vous êtes maintenant connecté :)");
		
		String idUser = Integer.toString(userId);
		session.setAttribute("userId", idUser);
		session.setAttribute("isAdmin", isAdmin == true ? "oui" : "non");
		System.out.println("admin : " + isAdmin);
		System.out.println("session : " + session.getAttribute("userId"));
		
		ServletContext servletContext = getServletContext();
		RequestDispatcher rd = servletContext.getRequestDispatcher(vaLaBas);
		rd.forward(request, response);
	}

	// =======================================================
	// MÉTHODES PRIVÉES
	// =======================================================
	private String checkStringFullfilled(String chaine) {
		if (chaine == null || chaine.isBlank() || chaine.isEmpty()) {
			erreur = "Vous n'avez pas correctement rempli les champs";
			vaLaBas = "/WEB-INF/pages-user/Connexion.jsp";
		}
		return chaine;
	}
	
	private Boolean checkMDP(String mdp1, String mdp2) {
		return mdp1.equals(mdp2);
	}

}
