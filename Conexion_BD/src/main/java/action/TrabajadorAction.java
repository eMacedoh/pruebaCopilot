package action;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.dispatcher.RequestMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.Modulo;
import beans.Modulo1;
import beans.Trabajador;
import beans.Usuario;
import mantenimientos.acceso;
import mantenimientos.gestionTrabajador;




public class TrabajadorAction extends ActionSupport implements SessionAware {



	//variables declaracion 
	private String cod1;
	private String nombte1;
	private String apellido1;
	private int edad1;
	private int genero_cod1;
	private int departamento_cod1;
	private Trabajador objTra;
	private ArrayList<Trabajador> lisTrab= new ArrayList<Trabajador>();

	private String prueba;
	private String valor = null;
	
	 private Map session  = ActionContext.getContext().getSession();
	private Usuario objUsuario;
	 //LISTAS PERSISTENTES DEL MENU

    public List <Modulo> modulosAUX = new ArrayList<Modulo>();
    public List <Modulo1> modulosAUXP = new ArrayList<Modulo1>();


	//**************************************************************

 //metodo para dear de alta
 	public String ingresarCero ()  {
 	
 		System.out.println("entre a cero");
 		
 		try {
 			 //********************************************************************************valida sesion						
 			//********************************************************************************valida sesion						
 			  if(session.containsKey("usuario")){
 			              objUsuario = (Usuario) session.get("usuario");	             			   
 			  }else{
 				                addActionError("**** La sesion ha expirado *** favor de iniciar una nueva sesion *** ");
 				                return "SESION";
 			  }
 			//********************************************************************************fin sesion	
 			//********************************************************************************fin sesion			
 		System.out.println("el valor del usuario e sesion essss " +  objUsuario.getNomusuario());
 		acceso acc = new acceso();	
 		modulosAUX  = (ArrayList<Modulo>)  acc.retornaMenu(objUsuario.getPerfil());
 	    modulosAUXP  = (ArrayList<Modulo1>)  acc.retornaMenu1(objUsuario.getPerfil());
 	    
 	    
 			return "exito";
 		} catch (Exception e) {
 			e.printStackTrace();
 			return "error";
 		}
 	}
 	
 	
   public String ingresar ()  {
	
		try {
			 //********************************************************************************valida sesion						
			//********************************************************************************valida sesion						
		//	  if(session.containsKey("usuario")){
		//	              objUsuario = (Usuario) session.get("usuario");	             			   
		//	  }else{
		//		                addActionError("**** La sesion ha expirado *** favor de iniciar una nueva sesion *** ");
		//		                return "SESION";
		//	  }
			//********************************************************************************fin sesion	
			//********************************************************************************fin sesion			
		//System.out.println("el valor del usuario 2  e sesion essss " +  objUsuario.getNomusuario());
		//acceso acc = new acceso();	
 		//modulosAUX  = (ArrayList<Modulo>)  acc.retornaMenu(objUsuario.getPerfil());
 	   // modulosAUXP  = (ArrayList<Modulo1>)  acc.retornaMenu1(objUsuario.getPerfil());
 	    
 	    
		
		objTra = new Trabajador(cod1, nombte1, apellido1, edad1, genero_cod1, departamento_cod1);
		
		System.out.println("el valor de codigo es: " + objTra.getCod());
		System.out.println("el valor de nombre es: " + objTra.getNombte());
		
		
		
		gestionTrabajador gt = new gestionTrabajador();
		boolean ruta;
		ruta= gt.RegistrarEntradas(objTra);
		if (ruta) {
			 addActionMessage("Registro dado de alta con éxito");
				return "exito";
		}else {
			addActionMessage("Error al procesar la infomación. Registro duplicado o incompleto");
			return "error";
		}
		 
		} catch (Exception e) {
			e.printStackTrace();
			addActionMessage("Error al procesar la infomación. Registro duplicado o incompleto");
			return "error";
		}
	}
	


//metodo para conultar
public String listaTotal () {
	
	try {
		System.out.println("entreeeeeeeeee a lista total");
		//vamos a ver que tiene la lista
		gestionTrabajador gt = new gestionTrabajador();
		
		 lisTrab =	(ArrayList<Trabajador>) gt.retornaLista();
		System.out.println("rgreseeeeeeeeel  "+ lisTrab.size());
	for (int i = 0; i < lisTrab.size(); i++) {		
		System.out.println("reg: " + lisTrab.get(i).getCod());
		System.out.println("Nombre: "  + lisTrab.get(i).getNombte());
		System.out.println("Apellido: "  + lisTrab.get(i).getApellido());
	}	
	   prueba = "hola mensa";
	   return "exito";
	} catch (Exception e) {
		e.printStackTrace();
		return "error";
	}
  }
   
	
	
	//metodo para consultar un solo registro y regrese un solo valor
	public String buscaRegistro() {
		
		try {       
			//vamos a ver que tiene la lista
			gestionTrabajador gt = new gestionTrabajador();
			valor = gt.retornaCodigo("002");
			
		    System.out.println("el valor regresado es " + valor);
		
		
		   return "exito";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	 
	//metodo para modificar un regitro
	public String modificaRegistro() {
	
		System.out.println("entreeeeeeeeee a modificar");
		//colocando valores fijos
		cod1= "002";
		nombte1= "Gustavo Alejandro";
		apellido1= "Garduño";
		edad1 = 25;
		genero_cod1 =1;
		departamento_cod1 = 3;
		
		boolean res =false;		;
		objTra = new Trabajador(cod1, nombte1, apellido1, edad1, genero_cod1, departamento_cod1);
		
		System.out.println("el valor de codigo es: " + objTra.getCod());
		System.out.println("el valor de nombre es: " + objTra.getNombte());
		try {
			
			gestionTrabajador gt = new gestionTrabajador();
			res =gt.RegistrarModificacion(objTra);
			if (res) {
			 return "exito";
			} else {
			 return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}	
		
		//metodo para eliminar un regitro
		public String eliminaRegistro() {
				
			System.out.println("entreeeeeeeeee a eliminar");
			//colocando valores fijos
			cod1= "004";
			
			boolean res =false;		
			try {
				
				gestionTrabajador gt = new gestionTrabajador();
				res =gt.RegistrarEliminar(cod1);
				if (res) {
				 return "exito";
				} else {
				 return "error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}		
		
}

//getters y setters



	public Trabajador getObjTra() {
		return objTra;
	}


	public void setObjTra(Trabajador objTra) {
		this.objTra = objTra;
	}


	public String getCod1() {
		return cod1;
	}



	public void setCod1(String cod1) {
		this.cod1 = cod1;
	}



	public String getNombte1() {
		return nombte1;
	}



	public void setNombte1(String nombte1) {
		this.nombte1 = nombte1;
	}



	public String getApellido1() {
		return apellido1;
	}



	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}



	public int getEdad1() {
		return edad1;
	}



	public void setEdad1(int edad1) {
		this.edad1 = edad1;
	}



	public int getGenero_cod1() {
		return genero_cod1;
	}



	public void setGenero_cod1(int genero_cod1) {
		this.genero_cod1 = genero_cod1;
	}



	public int getDepartamento_cod1() {
		return departamento_cod1;
	}



	public void setDepartamento_cod1(int departamento_cod1) {
		this.departamento_cod1 = departamento_cod1;
	}



	public String getPrueba() {
		return prueba;
	}



	public void setPrueba(String prueba) {
		this.prueba = prueba;
	}



	public ArrayList<Trabajador> getLisTrab() {
		return lisTrab;
	}



	public void setLisTrab(ArrayList<Trabajador> lisTrab) {
		this.lisTrab = lisTrab;
	}



	public String getValor() {
		return valor;
	}



	public void setValor(String valor) {
		this.valor = valor;
	}



	public List<Modulo> getModulosAUX() {
		return modulosAUX;
	}



	public void setModulosAUX(List<Modulo> modulosAUX) {
		this.modulosAUX = modulosAUX;
	}



	public List<Modulo1> getModulosAUXP() {
		return modulosAUXP;
	}



	public void setModulosAUXP(List<Modulo1> modulosAUXP) {
		this.modulosAUXP = modulosAUXP;
	}



	public Usuario getObjUsuario() {
		return objUsuario;
	}



	public void setObjUsuario(Usuario objUsuario) {
		this.objUsuario = objUsuario;
	}



	public Map getSession() {
		return session;
	}



	public void setSession(Map session) {
		this.session = session;
	}






	
	
	
	
}
