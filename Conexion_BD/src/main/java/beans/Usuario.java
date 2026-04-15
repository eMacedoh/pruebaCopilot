package beans;

public class Usuario {
	private String cveusuario;
	private String nomusuario;
	private String contrasenia;
	private String perfil;
	private String tipo;
	
	
	public Usuario(String cveusuario, String nomusuario, String contrasenia, String perfil, String tipo) {
		super();
		this.cveusuario = cveusuario;
		this.nomusuario = nomusuario;
		this.contrasenia = contrasenia;
		this.perfil = perfil;
		this.tipo = tipo;
	}


	public String getCveusuario() {
		return cveusuario;
	}


	public void setCveusuario(String cveusuario) {
		this.cveusuario = cveusuario;
	}


	public String getNomusuario() {
		return nomusuario;
	}


	public void setNomusuario(String nomusuario) {
		this.nomusuario = nomusuario;
	}


	public String getContrasenia() {
		return contrasenia;
	}


	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}


	public String getPerfil() {
		return perfil;
	}


	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	
	
	
}
