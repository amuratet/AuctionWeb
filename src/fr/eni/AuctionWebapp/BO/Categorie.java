package fr.eni.AuctionWebapp.BO;

public class Categorie {
	//	=======================================================
	//					CONSTANTES
	//	=======================================================

	//	=======================================================
	//					ATTRIBUTS
	//	=======================================================
	private int id;
	private String libelle;
	private String nomFr;

	//	=======================================================
	//					CONSTRUCTEURS
	//	=======================================================
	public Categorie(int id, String libelle, String nomFr) {
		this.id = id;
		this.libelle = libelle;
		this.nomFr = nomFr;
	}
	
	//	=======================================================
	//					GETTERS & SETTERS
	//	=======================================================
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public String getNomFr() {
		return nomFr;
	}

	public void setNomFr(String nomFr) {
		this.nomFr = nomFr;
	}

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("Catégorie n° " + getId());
		sb.append(" --- Intitulé : " + getNomFr());
		return sb.toString();
	}

}
