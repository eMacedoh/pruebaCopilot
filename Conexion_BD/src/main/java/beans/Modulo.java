package beans;

public class Modulo {
	
	private String cvemodulo;
	private String nommodulo;
	private String action;
	private String nompadre;
	private String orden;
	
	public Modulo(String cvemodulo, String nommodulo, String action, String nompadre, String orden) {
		super();
		this.cvemodulo = cvemodulo;
		this.nommodulo = nommodulo;
		this.action = action;
		this.nompadre = nompadre;
		this.orden = orden;
	}
	
	
	public String getCvemodulo() {
		return cvemodulo;
	}
	public void setCvemodulo(String cvemodulo) {
		this.cvemodulo = cvemodulo;
	}
	public String getNommodulo() {
		return nommodulo;
	}
	public void setNommodulo(String nommodulo) {
		this.nommodulo = nommodulo;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getNompadre() {
		return nompadre;
	}
	public void setNompadre(String nompadre) {
		this.nompadre = nompadre;
	}
	public String getOrden() {
		return orden;
	}
	public void setOrden(String orden) {
		this.orden = orden;
	}
	
	
}
