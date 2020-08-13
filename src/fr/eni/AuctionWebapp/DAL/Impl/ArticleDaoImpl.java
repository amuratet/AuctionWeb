package fr.eni.AuctionWebapp.DAL.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
			+ "c.libelle,c.nomFr,u.no_utilisateur,u.pseudo FROM ARTICLES_VENDUS a INNER JOIN CATEGORIES c ON c.no_categorie = a.no_categorie INNER JOIN UTILISATEURS u ON u.no_utilisateur = a.no_utilisateur;";
	
	private static final String SELECT_ALL_BY_CAT = "SELECT a.no_article,a.nom_article,a.description,a.date_debut_encheres,a.date_fin_encheres,a.prix_initial,a.prix_vente,a.no_utilisateur,a.no_categorie,a.photo,"
											+ "c.libelle,c.nomFr,u.no_utilisateur,u.pseudo FROM ARTICLES_VENDUS a INNER JOIN CATEGORIES c ON c.no_categorie = a.no_categorie INNER JOIN UTILISATEURS u ON u.no_utilisateur = a.no_utilisateur WHERE c.libelle = ?;";
	
	private static final String INSERT_ARTICLE = "INSERT INTO ARTICLES_VENDUS (nom_article,description,date_debut_encheres,date_fin_encheres,prix_initial,prix_vente,no_utilisateur,no_categorie,photo)"
			+ "VALUES (?,?,?,?,?,?,?,?,?);";

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
						res.getInt("no_utilisateur"),
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
							res.getInt("no_utilisateur"),
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
		java.sql.Date dateDebut = new java.sql.Date(article.getDateDebut().getTime());
		java.sql.Date dateFin = new java.sql.Date(article.getDateFin().getTime());
		System.out.println("date debut : " + dateDebut);
		System.out.println("date fin : " + dateFin);
		PreparedStatement req = null;
		ResultSet res = null;
	// 1.nom_article, 2.description, 3.date_debut_encheres, 4.date_fin_encheres, 5.prix_initial, 6.prix_vente 7.no_utilisateur, 8.no_categorie
		try (Connection cnx = FournisseurConnexion.obtenirConnexion()){
			req = cnx.prepareStatement(INSERT_ARTICLE, Statement.RETURN_GENERATED_KEYS);
			req.setString(1, article.getNom());
			System.out.println("nom " + article.getNom());
			req.setString(2, article.getDescription());
			System.out.println("desc " + article.getDescription());
			req.setDate(3, dateDebut);
			req.setDate(4, dateFin);
			req.setInt(5, article.getPrixInitial());
			req.setInt(6, article.getPrixInitial());
			req.setInt(7, article.getIdVendeur());
			req.setInt(8, article.getIdCategorie());
			req.setString(9, article.getPhoto());
			
			int nbLignesInserees = req.executeUpdate();
			System.out.println("nombre de lignes insérées : " + nbLignesInserees);
			if (nbLignesInserees == 1) {
				res = req.getGeneratedKeys();
				if (res.next())
					article.setId(res.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException("Insertion article ratée",e);
		} finally {
			try {
				if (req != null)
					req.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void deleteArticle(int idArticle) throws DALException {
		// TODO Auto-generated method stub
	}
}
