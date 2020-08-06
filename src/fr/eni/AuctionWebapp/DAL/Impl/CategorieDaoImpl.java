package fr.eni.AuctionWebapp.DAL.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.eni.AuctionWebapp.BO.Categorie;
import fr.eni.AuctionWebapp.DAL.CategorieDao;
import fr.eni.AuctionWebapp.DAL.DALException;
import fr.eni.AuctionWebapp.DAL.Utils.FournisseurConnexion;

public class CategorieDaoImpl implements CategorieDao{

	//	=======================================================
	//					CONSTANTES
	//	=======================================================
	private static final String SELECT_ALL = "SELECT * FROM CATEGORIES;";
	
	private static final String SELECT_BY_ID = "SELECT * FROM CATEGORIES WHERE no_categorie = ?;";
	
	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	@Override
	public List<Categorie> selectAll() throws DALException {
		List<Categorie> categories = new ArrayList<Categorie>();
		PreparedStatement req = null;
		ResultSet res = null;
		
		try (Connection cnx = FournisseurConnexion.obtenirConnexion()) {
			req = cnx.prepareStatement(SELECT_ALL);
			res = req.executeQuery();
			
			Categorie categorie = null;
			
			while (res.next()) {
				categorie = new Categorie(
						res.getInt("no_categorie"),
						res.getString("libelle"),
						res.getString("nomFr")
						);
				categories.add(categorie);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException("Echec de la connexion à la BDD :(");
		} finally {
			try {
				if (req != null) {
					req.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return categories;
	}

	@Override
	public Categorie selectCategorie() throws DALException {
		// TODO Auto-generated method stub
		return null;
	}

}
