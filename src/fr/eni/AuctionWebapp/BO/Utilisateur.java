package fr.eni.AuctionWebapp.BO;

/**
 * Classe pour définir le métier de Utilisateur (en DB : UTILISATEURS)
 * @author alk
 */
public class Utilisateur {

	//	=======================================================
	//					ATTRIBUTS
	//	=======================================================
	private int id;
	private String pseudo;
	private String nom;
	private String prenom;
	private String email;
	private String rue;
	private String codePostal;
	private String ville;
	private String mdp;
	private int credit;
	private Boolean admin;
	

	//	=======================================================
	//					CONSTRUCTEURS
	//	=======================================================
	public Utilisateur(int id, String pseudo, String nom, String prenom, String email, String rue, String codePostal,
			String ville, String mdp, int credit, Boolean admin) {
		super();
		this.id = id;
		this.pseudo = pseudo;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.rue = rue;
		this.codePostal = codePostal;
		this.ville = ville;
		this.mdp = mdp;
		this.credit = credit;
		this.admin = admin;
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
	
	
	public String getPseudo() {
		return pseudo;
	}
	
	
	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}
	
	
	public String getNom() {
		return nom;
	}
	
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	
	public String getPrenom() {
		return prenom;
	}
	
	
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	
	public String getEmail() {
		return email;
	}
	
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getRue() {
		return rue;
	}
	
	
	public void setRue(String rue) {
		this.rue = rue;
	}
	
	
	public String getCodePostal() {
		return codePostal;
	}
	
	
	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}
	
	
	public String getVille() {
		return ville;
	}
	
	
	public void setVille(String ville) {
		this.ville = ville;
	}
	
	
	public String getMdp() {
		return mdp;
	}
	
	
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}
	
	
	public int getCredit() {
		return credit;
	}
	
	
	public void setCredit(int credit) {
		this.credit = credit;
	}
	
	
	public Boolean getAdmin() {
		return admin;
	}
	
	
	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================

	//	=======================================================
	//					MÉTHODES PRIVÉES
	//	=======================================================
}
