package fr.eni.AuctionWebapp.DAL;

import java.util.List;

import fr.eni.AuctionWebapp.BO.Utilisateur;

public interface UtilisateurDao {
	
	public List<Utilisateur> selectAll() throws DALException;
	
	public Utilisateur selectById(int id) throws DALException;

}
