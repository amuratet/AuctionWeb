package fr.eni.AuctionWebapp.DAL.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import fr.eni.AuctionWebapp.BO.Utilisateur;
import fr.eni.AuctionWebapp.DAL.DALException;
import fr.eni.AuctionWebapp.DAL.UtilisateurDao;
import fr.eni.AuctionWebapp.DAL.Utils.FournisseurConnexion;

public class UtilisateurDaoImpl implements UtilisateurDao {

	// =======================================================
	// CONSTANTES
	// =======================================================
//	private static final String SELECT_ALL = "SELECT u.no_utilisateur,u.pseudo,u.nom,u.prenom,u.email,u.telephone,u.rue,u.code_postal,u.ville,u.credit,u.administrateur FROM UTILISATEURS u;";
	private static final String SELECT_BY_ID = "SELECT u.no_utilisateur,u.pseudo,u.nom,u.prenom,u.email,u.telephone,u.rue,u.code_postal,u.ville,u.mot_de_passe,u.credit,u.administrateur FROM UTILISATEURS u WHERE u.no_utilisateur = ?;";
	
	private static final String SELECT_BY_EMAIL_FOR_CNX = "SELECT no_utilisateur, email, mot_de_passe, administrateur FROM UTILISATEURS WHERE email = ?;";
	
	private static final String INSERT_UTILISATEUR = "INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe,credit,administrateur)"
		+ "VALUES(?,?,?,?,?,?,?,?,?,0,0)";

	private static final String UPDATE_UTILISATEUR = "UPDATE UTILISATEURS SET pseudo=?,nom=?,prenom=?,email=?,telephone=?,rue=?,code_postal=?,ville=?,mot_de_passe=? WHERE no_utilisateur=?;";
		

	// =======================================================
	// MÉTHODES PUBLIQUES
	// =======================================================
	@Override
	public List<Utilisateur> selectAll() throws DALException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Utilisateur selectById(int id) throws DALException {
		Utilisateur utilisateur = null;
		PreparedStatement req = null;
		ResultSet res = null;

		try (Connection cnx = FournisseurConnexion.obtenirConnexion()) {
			req = cnx.prepareStatement(SELECT_BY_ID);
			req.setInt(1, id);

			res = req.executeQuery();

			if (res.next()) {

				utilisateur = new Utilisateur(res.getInt("no_utilisateur"), res.getString("pseudo"), res.getString("nom"), res.getString("prenom"), res.getString("email"), res
					.getString("telephone"), res.getString("rue"), res.getString("code_postal"), res.getString("ville"), res.getString("mot_de_passe"), res.getInt("credit"), res
						.getBoolean("administrateur"));
			} else {
				System.out.println("Erreur paranormale");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException("Impossible de se connecter à la DB :(");
		} finally {
			try {
				if (req != null)
					req.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return utilisateur;
	}

	@Override
	public Utilisateur selectByMailForCnx(String email) throws DALException {
		Utilisateur utilisateur = null;
		PreparedStatement req = null;
		ResultSet res = null;

		try (Connection cnx = FournisseurConnexion.obtenirConnexion()) {
			req = cnx.prepareStatement(SELECT_BY_EMAIL_FOR_CNX);
			req.setString(1, email);

			res = req.executeQuery();
			if (res.next()) {
				utilisateur = new Utilisateur(
						res.getInt("no_utilisateur"),
						res.getString("email"),
						res.getString("mot_de_passe"),
						res.getBoolean("administrateur")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException("Impossible de remonter l'utilisateur avec le mail " + email, e);
		} finally {
			try {
				if (req != null)
					req.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return utilisateur;
	}

	@Override
	public void insert(Utilisateur utilisateur) throws DALException {
		PreparedStatement req = null;
		ResultSet res = null;
		// 1.pseudo, 2.nom, 3.prenom, 4.email, 5.telephone, 6.rue, 7.code_postal, 8.ville, 9.mot_de_passe, 10.credit, 11.administrateur
		try (Connection cnx = FournisseurConnexion.obtenirConnexion()) {
			req = cnx.prepareStatement(INSERT_UTILISATEUR, Statement.RETURN_GENERATED_KEYS);
			req.setString(1, utilisateur.getPseudo());
			req.setString(2, utilisateur.getNom());
			req.setString(3, utilisateur.getPrenom());
			req.setString(4, utilisateur.getEmail());
			req.setString(5, utilisateur.getTelephone());
			req.setString(6, utilisateur.getRue());
			req.setString(7, utilisateur.getCodePostal());
			req.setString(8, utilisateur.getVille());
			req.setString(9, utilisateur.getMdp());

			int nbLignesInserees = req.executeUpdate();
			System.out.println("nombre de lignes insérées : " + nbLignesInserees);
			if (nbLignesInserees == 1) {
				res = req.getGeneratedKeys();
				if (res.next())
					utilisateur.setId(res.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException("Immpossible d'insérer l'utilisateur " + utilisateur, e);
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
	public void update(Utilisateur utilisateur) throws DALException, SQLException {
		PreparedStatement req = null;
		// 1.pseudo, 2.nom, 3.prenom, 4.email, 5.telephone, 6.rue, 7.code_postal, 8.ville, 9.mot_de_passe, 10.no_utilisateur
		 try (Connection cnx = FournisseurConnexion.obtenirConnexion()) {
			req = cnx.prepareStatement(UPDATE_UTILISATEUR, Statement.RETURN_GENERATED_KEYS );
			req.setString(1, utilisateur.getPseudo());
			req.setString(2, utilisateur.getNom());
			req.setString(3, utilisateur.getPrenom());
			req.setString(4, utilisateur.getEmail());
			req.setString(5, utilisateur.getTelephone());
			req.setString(6, utilisateur.getRue());
			req.setString(7, utilisateur.getCodePostal());
			req.setString(8, utilisateur.getVille());
			req.setString(9, utilisateur.getMdp());
			req.setInt(10,utilisateur.getId());
			
			req.executeUpdate();
		
		 	}catch (SQLException e) {
		 		throw new DALException("Impossible d'executée la requète.", e);
		}try {
			if (req != null)
				req.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// =======================================================
	// MÉTHODES PRIVÉES
	// =======================================================
}

