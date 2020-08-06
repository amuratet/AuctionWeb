package fr.eni.AuctionWebapp.BLL;

import java.util.List;

import fr.eni.AuctionWebapp.BO.Article;
import fr.eni.AuctionWebapp.DAL.ArticleDao;
import fr.eni.AuctionWebapp.DAL.DALException;
import fr.eni.AuctionWebapp.DAL.Utils.DaoFactory;

public class ArticleManager {

	//	=======================================================
	//					ATTRIBUTS
	//	=======================================================
	private ArticleDao articleDao;

	//	=======================================================
	//					CONSTRUCTEURS
	//	=======================================================
	public ArticleManager() throws BLLException {
		this.articleDao = DaoFactory.getArticleDao();
	}

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	public List<Article> selectAll() throws DALException, BLLException {
		return articleDao.selectAll();
	}
	
	public List<Article> selectAll(String categorie) throws DALException, BLLException {
		return articleDao.selectAll();
	}
	
	public void insertArticle(Article article) throws DALException, BLLException {
		articleDao.insertArticle(article);
	}
	
	public void deleteArticle(int idArticle) throws DALException, BLLException {
		articleDao.deleteArticle(idArticle);
	}
	

}
