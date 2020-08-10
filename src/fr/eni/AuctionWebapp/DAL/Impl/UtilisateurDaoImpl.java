package fr.eni.AuctionWebapp.DAL.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import fr.eni.AuctionWebapp.BO.Utilisateur;
import fr.eni.AuctionWebapp.DAL.DALException;
import fr.eni.AuctionWebapp.DAL.UtilisateurDao;
import fr.eni.AuctionWebapp.DAL.Utils.FournisseurConnexion;

public class UtilisateurDaoImpl implements UtilisateurDao{

	//	=======================================================
	//					CONSTANTES
	//	=======================================================
	private static final String SELECT_ALL = "SELECT u.no_utilisateur,u.pseudo,u.nom,u.prenom,u.email,u.telephone,u.rue,u.code_postal,u.ville,u.credit,u.administrateur FROM UTILISATEURS u;";
	private static final String SELECT_BY_ID = "SELECT u.no_utilisateur,u.pseudo,u.nom,u.prenom,u.email,u.telephone,u.rue,u.code_postal,u.ville,u.credit,u.administrateur FROM UTILISATEURS u WHERE u.no_utilisateur = ?;";

	//	=======================================================
	//					ATTRIBUTS
	//	=======================================================

	//	=======================================================
	//					CONSTRUCTEURS
	//	=======================================================

	//	=======================================================
	//					GETTERS & SETTERS
	//	=======================================================

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	@Override
	public List<Utilisateur> selectAll() throws DALException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Utilisateur selectById(int id) throws DALException {
		Utilisateur utilisateur;
		PreparedStatement req = null;
		ResultSet res = null;
		
		try (Connection cnx = FournisseurConnexion.obtenirConnexion()) {
			req = cnx.prepareStatement(SELECT_BY_ID);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException("Impossible de se connecter à la DB :(");
		}
		return null;
	}

	//	=======================================================
	//					MÉTHODES PRIVÉES
	//	=======================================================
}
