package fr.eni.AuctionWebapp.DAL;

import java.util.List;

import fr.eni.AuctionWebapp.BO.Categorie;

public interface CategorieDao {
	
	public List<Categorie> selectAll() throws DALException;
	
	public Categorie selectCategorie() throws DALException;
	

}
