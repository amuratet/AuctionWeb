package fr.eni.AuctionWebapp.BLL;

import java.util.List;

import fr.eni.AuctionWebapp.BO.Utilisateur;
import fr.eni.AuctionWebapp.DAL.DALException;
import fr.eni.AuctionWebapp.DAL.UtilisateurDao;
import fr.eni.AuctionWebapp.DAL.Utils.DaoFactory;

public class UtilisateurManager {

	// =======================================================
	// ATTRIBUTS
	// =======================================================
	private UtilisateurDao utilisateurDao;

	// =======================================================
	// CONSTRUCTEURS
	// =======================================================
	public UtilisateurManager() {
		this.utilisateurDao = DaoFactory.getUtilisateurDao();
	}

	// =======================================================
	// MÉTHODES PUBLIQUES
	// =======================================================
	public List<Utilisateur> selectAll() throws DALException {
		return utilisateurDao.selectAll();
	}

	public Utilisateur selectById(int id) throws DALException {
		return utilisateurDao.selectById(id);
	}

}
