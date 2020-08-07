package fr.eni.AuctionWebapp.BO;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Article {
	
	//	=======================================================
	//					CONSTANTES
	//	=======================================================
//	private static DateFormat simpleDate = new SimpleDateFormat("dd/MM/yyyy");

	// =======================================================
	// 					ATTRIBUTS
	// =======================================================
	private int id;
	private String nom;
	private String description;
	private Date dateDebut;
	private Date dateFin;
	private int prixInitial;
	private int prixVente;
	private int idUtilisateur;
	private int idCategorie;
	private String photo;
	private String catLibelle;
	private String catNomFr;

	// =======================================================
	// 					CONSTRUCTEURS
	// =======================================================
	public Article(int id, String nom, String description, Date dateDebut, Date dateFin, int prixInitial, int prixVente,
			int idUtilisateur, int idCategorie, String photo, String catLibelle, String catNomFr) {
		this.id = id;
		this.nom = nom;
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.prixInitial = prixInitial;
		this.prixVente = prixVente;
		this.idUtilisateur = idUtilisateur;
		this.idCategorie = idCategorie;
		this.photo = photo;
		this.catLibelle = catLibelle;
		this.catNomFr = catNomFr;
	}

	// =======================================================
	// 					GETTERS & SETTERS
	// =======================================================
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Date getDateFin() {
		return dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	public int getPrixInitial() {
		return prixInitial;
	}

	public void setPrixInitial(int prixInitial) {
		this.prixInitial = prixInitial;
	}

	public int getPrixVente() {
		return prixVente;
	}

	public void setPrixVente(int prixVente) {
		this.prixVente = prixVente;
	}

	public int getIdUtilisateur() {
		return idUtilisateur;
	}

	public void setIdUtilisateur(int idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}

	public int getIdCategorie() {
		return idCategorie;
	}

	public void setIdCategorie(int idCategorie) {
		this.idCategorie = idCategorie;
	}
	
	public String getPhoto() {
		return photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getCatLibelle() {
		return catLibelle;
	}
	
	public void setCatLibelle(String catLibelle) {
		this.catLibelle = catLibelle;
	}
	
	public String getCatNomFr() {
		return catNomFr;
	}
	
	public void setCatNomFr(String catNomFr) {
		this.catNomFr = catNomFr;
	}

	// =======================================================
	// 					MÉTHODES PUBLIQUES
	// =======================================================
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("Article n°" + getId());
		sb.append(" --- nom : " + getNom());
		sb.append(" --- description : " + getDescription());
		sb.append(" --- Démarré le : " + getDateDebut());
		sb.append(" --- finit le : " + getDateFin());
		sb.append(" --- Prix initial : " + getPrixInitial() != null ? getPrixInitial() : "0");
		sb.append(" --- Prix vente : " + getPrixVente() != null ? getPrixVente() : "0");
		sb.append(" --- Catégorie : " + getCatNomFr());
		return sb.toString();
	}
	
	// =======================================================
	// 					MÉTHODES PRIVÉES
	// =======================================================
//    private static java.sql.Date convertUtilToSql(java.util.Date uDate) {
//        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
//        return sDate;
//    }
//    private static java.util.Date convertSqlToUtil(java.sql.Date sDate) {
//    	java.util.Date uDate = new java.util.Date(sDate.getTime());
//    	return uDate;
//    }
	
}
