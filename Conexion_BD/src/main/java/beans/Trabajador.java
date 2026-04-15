package beans;

public class Trabajador {
	
	private String cod;
	private String nombte;
	private String apellido;
	private int edad;
	private int genero_cod;
    private int departamento_cod;
    
	
	public Trabajador(String cod, String nombte, String apellido, int edad, int genero_cod, int departamento_cod) {
		super();
		this.cod = cod;
		this.nombte = nombte;
		this.apellido = apellido;
		this.edad = edad;
		this.genero_cod = genero_cod;
		this.departamento_cod = departamento_cod;
	}
    
    
	public Trabajador() {
		super();
	}


	public String getCod() {
		return cod;
	}


	public void setCod(String cod) {
		this.cod = cod;
	}


	public String getNombte() {
		return nombte;
	}


	public void setNombte(String nombte) {
		this.nombte = nombte;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public int getEdad() {
		return edad;
	}


	public void setEdad(int edad) {
		this.edad = edad;
	}


	public int getGenero_cod() {
		return genero_cod;
	}


	public void setGenero_cod(int genero_cod) {
		this.genero_cod = genero_cod;
	}


	public int getDepartamento_cod() {
		return departamento_cod;
	}


	public void setDepartamento_cod(int departamento_cod) {
		this.departamento_cod = departamento_cod;
	}

	

}
