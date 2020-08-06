package fr.eni.AuctionWebapp.DAL;

import java.util.List;

import fr.eni.AuctionWebapp.BO.Article;

public interface ArticleDao {
	
	public List<Article> selectAll() throws DALException;
	
	public List<Article> selectAll(String categorie) throws DALException;
	
	public Article selectArticle(int idArticle) throws DALException;
	
	public void insertArticle(Article article) throws DALException;
	
	public void deleteArticle(int idArticle) throws DALException;

}
