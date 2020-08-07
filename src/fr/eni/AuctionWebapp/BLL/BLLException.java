package fr.eni.AuctionWebapp.BLL;

public class BLLException extends Exception{
	//	=======================================================
	//					CONSTANTES
	//	=======================================================
	private static final long serialVersionUID = 1L;

	//	=======================================================
	//					ATTRIBUTS
	//	=======================================================

	//	=======================================================
	//					CONSTRUCTEURS
	//	=======================================================
	public BLLException() {
		super();
	}
	public BLLException(String message) {
		super(message);
	}
	public BLLException(String message, Throwable exception) {
		super(message, exception);
	}

	//	=======================================================
	//					MÉTHODES PUBLIQUES
	//	=======================================================
	@Override
	public String getMessage() {
		StringBuilder builder = new StringBuilder();
		builder.append("Erreur dans la couche BLL --> ");
		builder.append(super.getMessage());
		return builder.toString();
	}

}
