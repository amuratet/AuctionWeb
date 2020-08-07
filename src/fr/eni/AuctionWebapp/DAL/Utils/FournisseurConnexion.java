package fr.eni.AuctionWebapp.DAL.Utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FournisseurConnexion {

	//	=======================================================
	//					ATTRIBUTS
	//	=======================================================
	private static DataSource dataSource;

	//	=======================================================
	//					MÉTHODES PROTÉGÉES
	//	=======================================================
	static {
		Context context;
		try {
			context = new InitialContext();
			FournisseurConnexion.dataSource = (DataSource) context.lookup("java:comp/env/jdbc/pool_cnx");
		} catch (NamingException e) {
			e.printStackTrace();
			throw new RuntimeException("Erreur --> Impossible de se connecter à la base de données");
		}
	}
	
	public static Connection obtenirConnexion() throws SQLException {
		return FournisseurConnexion.dataSource.getConnection();
	}

	//	=======================================================
	//					MÉTHODES PRIVÉES
	//	=======================================================
}
