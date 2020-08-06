package fr.eni.AuctionWebapp.DAL;

public class DALException extends Exception {
	//	=======================================================
	//					CONSTANTES
	//	=======================================================
	private static final long serialVersionUID = 1L;

	//	=======================================================
	//					CONSTRUCTEURS
	//	=======================================================
	public DALException() {
		super();
	}
	public DALException(String message) {
		super(message);
	}
	public DALException(String message, Throwable exception) {
		super(message, exception);
	}

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	@Override
	public String getMessage() {
		StringBuffer sb = new StringBuffer("Erreur couche DAL -->");
		sb.append(super.getMessage());
		return sb.toString();
	}

}
