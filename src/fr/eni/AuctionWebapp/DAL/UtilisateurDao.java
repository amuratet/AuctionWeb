package fr.eni.AuctionWebapp.DAL;

import java.sql.SQLException;
import java.util.List;

import fr.eni.AuctionWebapp.BO.Utilisateur;

public interface UtilisateurDao {

	public List<Utilisateur> selectAll() throws DALException;

	public Utilisateur selectById(int id) throws DALException;

	public Utilisateur selectByMailForCnx(String email) throws DALException;

	public void insert(Utilisateur utilisateur) throws DALException;

	public void update(Utilisateur utilisateur) throws DALException, SQLException;

}
