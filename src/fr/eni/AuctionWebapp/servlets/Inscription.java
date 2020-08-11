package fr.eni.AuctionWebapp.servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.AuctionWebapp.BLL.UtilisateurManager;
import fr.eni.AuctionWebapp.BO.Utilisateur;

/**
 * Servlet pour l'inscription d'un nouvel utilisateur
 * @author alk
 */
@WebServlet("/Inscription")
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String vaLaBas = "/Accueil";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/Inscription.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String erreur = null;
		
		if (!checkSameMdp(request.getParameter("mdp1"), request.getParameter("mdp2"))) {
			erreur = "Les mots de passe ne sont pas identiques !";
			vaLaBas = "/WEB-INF/pages-user/Inscription.jsp";
		}
		// Récupération des données envoyées par le formulaire d'inscription
		String pseudo = request.getParameter("pseudo");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String mdp = request.getParameter("mdp1");
		String email = request.getParameter("email");
		String telephone = checkTelephone((request.getParameter("telephone")));
		String rue = request.getParameter("rue");
		String cp = request.getParameter("cp");
		String ville = request.getParameter("ville");
		
		List<String> donneesFormulaire = Arrays.asList(pseudo,nom,prenom,mdp,email,rue,cp,ville);
		for (String donnee : donneesFormulaire) {
			if (!checkStringFullfilled(donnee)) {
				erreur = "Erreur : Vous n'avez pas rempli tous les champs...";
				vaLaBas = "/WEB-INF/pages-user/Inscription.jsp";
			}
		}
		// Instanciation de la classe Utilisateur avec les données
		Utilisateur utilisateur = new Utilisateur(pseudo, nom, prenom, email, telephone, rue, cp, ville, mdp);
		System.out.println("utilisateur : " + utilisateur.toString());
		
		try {
			UtilisateurManager utilisateurManager = new UtilisateurManager();
			if (erreur == null) {
				utilisateurManager.insert(utilisateur);
				vaLaBas = "/Accueil";
			}
		} catch (Exception e) {
			e.printStackTrace();
			erreur = erreur != null ? erreur : "Une erreur est survenue lors de votre inscription";
			vaLaBas = "/WEB-INF/pages-user/Inscription.jsp";
		}
		
		if (erreur != null)
			request.setAttribute("erreur", erreur);
		else
			request.setAttribute("succes", "Vous avez bien été inscrit, vous pouvez vous connecter :)");
		
		ServletContext servletContext = getServletContext();
		RequestDispatcher rd = servletContext.getRequestDispatcher(vaLaBas);
		rd.forward(request, response);
	}
	
	//	=======================================================
	//					MÉTHODES PRIVÉES
	//	=======================================================
	private Boolean checkSameMdp(String mdp1, String mdp2) {
		return mdp1.equals(mdp2);
	}
	
	private String checkTelephone(String tel) {
		if (tel == null || tel.isBlank() || tel.isEmpty())
			return "non communiqué";
		else
			return tel;
	}
	
	private Boolean checkStringFullfilled(String string) {
		return (string != null && !string.isBlank() && !string.isEmpty());
	}
	

}
