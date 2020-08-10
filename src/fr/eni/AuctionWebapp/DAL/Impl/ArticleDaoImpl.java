package fr.eni.AuctionWebapp.DAL.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.eni.AuctionWebapp.BO.Article;
import fr.eni.AuctionWebapp.DAL.ArticleDao;
import fr.eni.AuctionWebapp.DAL.DALException;
import fr.eni.AuctionWebapp.DAL.Utils.FournisseurConnexion;

public class ArticleDaoImpl implements ArticleDao {

	//	=======================================================
	//					CONSTANTES
	//	=======================================================
	private static final String SELECT_ALL = "SELECT a.no_article,a.nom_article,a.description,a.date_debut_encheres,a.date_fin_encheres,a.prix_initial,a.prix_vente,a.no_utilisateur,a.no_categorie,a.photo,"
			+ "c.libelle,c.nomFr,u.pseudo FROM ARTICLES_VENDUS a INNER JOIN CATEGORIES c ON c.no_categorie = a.no_categorie INNER JOIN UTILISATEURS u ON u.no_utilisateur = a.no_utilisateur;";
	
	private static final String SELECT_ALL_BY_CAT = "SELECT a.no_article,a.nom_article,a.description,a.date_debut_encheres,a.date_fin_encheres,a.prix_initial,a.prix_vente,a.no_utilisateur,a.no_categorie,a.photo,"
											+ "c.libelle,c.nomFr,u.pseudo FROM ARTICLES_VENDUS a INNER JOIN CATEGORIES c ON c.no_categorie = a.no_categorie INNER JOIN UTILISATEURS u ON u.no_utilisateur = a.no_utilisateur WHERE c.libelle = ?;";

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	@Override
	public List<Article> selectAll() throws DALException {
		List<Article> articles = new ArrayList<Article>();
		PreparedStatement req = null;
		ResultSet res = null;
		
		try (Connection cnx = FournisseurConnexion.obtenirConnexion()) {
			req = cnx.prepareStatement(SELECT_ALL);
			res = req.executeQuery();
			
			Article article = null;
			
			while (res.next()) {
				article = new Article (
						res.getInt("no_article"),
						res.getString("nom_article"),
						res.getString("description"),
						res.getDate("date_debut_encheres"),
						res.getDate("date_fin_encheres"),
						res.getInt("prix_initial"),
						res.getInt("prix_vente"),
						res.getInt("no_utilisateur"),
						res.getInt("no_categorie"),
						res.getString("photo"),
						res.getString("libelle"),
						res.getString("nomFr"),
						res.getString("pseudo")
						);
				articles.add(article);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException("Impossible de se connecter à la BDD :(");
		} finally {
			try {
				if (req != null)
					req.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return articles;
	}
	
	@Override
	public List<Article> selectAll(String categorie) throws DALException {
		List<Article> articles = new ArrayList<Article>();
		PreparedStatement req = null;
		ResultSet res = null;
		
		try (Connection cnx = FournisseurConnexion.obtenirConnexion()) {
			req = cnx.prepareStatement(SELECT_ALL_BY_CAT);
			req.setString(1, categorie);
			res = req.executeQuery();
			
			Article article = null;
			
			while (res.next()) {
				article = new Article (
							res.getInt("no_article"),
							res.getString("nom_article"),
							res.getString("description"),
							res.getDate("date_debut_encheres"),
							res.getDate("date_fin_encheres"),
							res.getInt("prix_initial"),
							res.getInt("prix_vente"),
							res.getInt("no_utilisateur"),
							res.getInt("no_categorie"),
							res.getString("photo"),
							res.getString("libelle"),
							res.getString("nomFr"),
							res.getString("pseudo")
						);
				articles.add(article);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException("Impossible de se connecter à la BDD :(");
		} finally {
			try {
				if (req != null)
					req.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return articles;
	}
	
	@Override
	public Article selectArticle(int idArticle) throws DALException {
		return null;
	}
	
	@Override
	public void insertArticle(Article article) throws DALException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void deleteArticle(int idArticle) throws DALException {
		// TODO Auto-generated method stub
		
	}
}
