package fr.eni.AuctionWebapp.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import fr.eni.AuctionWebapp.BLL.ArticleManager;
import fr.eni.AuctionWebapp.BLL.CategorieManager;
import fr.eni.AuctionWebapp.BO.Article;
import fr.eni.AuctionWebapp.BO.Categorie;

/**
 * Servlet implementation class MesVente
 */
@WebServlet("/MesVente")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024,
		maxFileSize = 1024 * 1024 * 5, 
		maxRequestSize = 1024 * 1024 * 5 * 5
)
public class MesVente extends HttpServlet {
	//	=======================================================
	//					CONSTANTES
	//	======================================================
	private static final long serialVersionUID = 1L;
	public static final String IMAGES_FOLDER = "/uploaded";
	
	//	=======================================================
	//					ATTRIBUTS
	//	======================================================
	public String uploadPath;
	
	//	=======================================================
	//					INIT
	//	======================================================
//	public void init() throws ServletException {
//		uploadPath = getServletContext().getRealPath( IMAGES_FOLDER );
//		File uploadDir = new File( uploadPath );
//		if ( ! uploadDir.exists() ) uploadDir.mkdir();
//	}
       

	//	=======================================================
	//					MÉTOHODES PROTECTED
	//	======================================================
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Categorie> categories = new ArrayList<Categorie>();
		
		try {
			CategorieManager categorieManager = new CategorieManager();
			categories = categorieManager.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erreur", "Échec dans la récupérations des catégories");
		}
		request.setAttribute("categories", categories);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/MesVente.jsp");
		rd.forward(request, response);	
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int vendeurId = Integer.parseInt((String) session.getAttribute("userId"));
		String nom = request.getParameter("nomArticle");
		String description = request.getParameter("desciption");
		int idCategorie = Integer.parseInt(request.getParameter("categorie"));
		int prix = Integer.parseInt(request.getParameter("prix"));
		
		String debut = request.getParameter("debut");
		String fin = request.getParameter("fin");
//		Transformation des dates
		DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
		Date debutParsee = null;
		Date finParsee = null;
		try {
			debutParsee = df.parse(debut);
			finParsee = df.parse(fin);
		} catch (ParseException e) {
			System.out.println("date pas bon");
			e.printStackTrace();
		}
		
//		upload image
//		Part image = request.getPart("image");
//		String imageNom = Paths.get(image.getSubmittedFileName()).getFileName().toString();
//		InputStream imageContenu = image.getInputStream();
		String uploadPath = getServletContext().getRealPath(IMAGES_FOLDER) + File.separator;
		System.out.println("=================\nupload path : " + uploadPath);
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) uploadDir.mkdir();
		
		Part image = request.getPart("image");
		String imageNom = Paths.get(image.getSubmittedFileName()).getFileName().toString();
		image.write(uploadPath + File.separator + imageNom);
		
		System.out.println("debut : " + debut);
		System.out.println("vendeurId = " + vendeurId);
		
		Article article = new Article(nom, description, debutParsee, finParsee, prix, idCategorie, vendeurId, imageNom);
		
		try {
			ArticleManager articleManager = new ArticleManager();
			articleManager.insertArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages-user/MesVente.jsp");
		rd.forward(request, response);	
	}

}
