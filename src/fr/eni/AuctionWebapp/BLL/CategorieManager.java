package fr.eni.AuctionWebapp.BLL;

import java.util.List;

import fr.eni.AuctionWebapp.BO.Categorie;
import fr.eni.AuctionWebapp.DAL.CategorieDao;
import fr.eni.AuctionWebapp.DAL.DALException;
import fr.eni.AuctionWebapp.DAL.Utils.DaoFactory;

public class CategorieManager {

	//	=======================================================
	//					ATTRIBUTS
	//	=======================================================
	private CategorieDao categorieDao;

	//	=======================================================
	//					CONSTRUCTEURS
	//	=======================================================
	public CategorieManager() throws BLLException {
		this.categorieDao = DaoFactory.getCategorieDao();
	}

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	public List<Categorie> selectAll() throws DALException, BLLException {
		return categorieDao.selectAll();
	}
	
	public Categorie selectCategorie() throws DALException, BLLException {
		return categorieDao.selectCategorie();
	}

	//	=======================================================
	//					MÉTHODES PRIVÉES
	//	=======================================================
}
