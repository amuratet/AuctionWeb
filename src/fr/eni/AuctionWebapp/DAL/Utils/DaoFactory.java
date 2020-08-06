package fr.eni.AuctionWebapp.DAL.Utils;

import fr.eni.AuctionWebapp.DAL.ArticleDao;
import fr.eni.AuctionWebapp.DAL.CategorieDao;
import fr.eni.AuctionWebapp.DAL.Impl.ArticleDaoImpl;
import fr.eni.AuctionWebapp.DAL.Impl.CategorieDaoImpl;

public class DaoFactory {

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	public static ArticleDao getArticleDao() {
		return new ArticleDaoImpl();
	}
	
	public static CategorieDao getCategorieDao() {
		return new CategorieDaoImpl();
	}

}
