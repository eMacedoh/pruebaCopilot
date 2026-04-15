package action;

import java.util.ArrayList;


import beans.Usuario;
import beans.Modulo;
import beans.Modulo1;
import mantenimientos.acceso;

import java.io.IOException;
//SESION
import java.util.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

public class acessoAction extends ActionSupport implements SessionAware{
	
	private ArrayList<Usuario> lisUsu= new ArrayList<Usuario>();
	private Usuario objUsuario;
	private String idusuario;
	private String idcontrasena;
	
	private Map session;
	
	 //LISTAS PERSISTENTES DEL MENU
    public List <Modulo> modulosAUX = new ArrayList<Modulo>();
    public List <Modulo1> modulosAUXP = new ArrayList<Modulo1>();


    
	//************************************************************
		//acceso
		//metodo para cosultar usuario
		public String verificaUsuario () {
			
			
			try {
				System.out.println("entreeeeeeeeee a lista usuario");
				
				if(idusuario!=null){
		            session.put("s_usuario", idusuario);
		            session.put("s_contrasena", idcontrasena);
		        }else if(session.get("idusuario")!=null){
		        	idusuario = (String) session.get("s_usuario");
		        	idcontrasena = (String) session.get("s_contrasena");
		        }
				 System.out.println("usuariooo de sesiooon " + session.get("s_usuario"));
				
				
				//vamos a ver que tiene la lista
				acceso acc = new acceso();		
				lisUsu =	(ArrayList<Usuario>) acc.retornaUsuario(idusuario, idcontrasena);  // acc.retornaUsuario("ERICA", "12345");
				 System.out.println("usuariooooo  "+ lisUsu.size());
				 objUsuario = new  Usuario (null, null, null, null, null);
			for (int i = 0; i < lisUsu.size(); i++) {		
				objUsuario.setCveusuario( lisUsu.get(i).getCveusuario());
				objUsuario.setNomusuario(lisUsu.get(i).getNomusuario() );
				objUsuario.setContrasenia( lisUsu.get(i).getContrasenia()) ;
				objUsuario.setPerfil( lisUsu.get(i).getPerfil());
				objUsuario.setTipo( lisUsu.get(i).getTipo());
				System.out.println("usuariooooo dentro  " + objUsuario.getCveusuario());
												
			}	//for
			
			 if ( lisUsu.size() ==0) {
				 return "noAccess";
			 }else {
				 
			     //vamos a subir el objeto a sesion
	              session.put("usuario",objUsuario);

				 
			    //vamos a traer los modulos a los que tiene derecho de acuerdo al perfil
				 System.out.println("antesssssssssssssssssssssssss " + objUsuario.getNomusuario());
				
				 if(objUsuario!=null  ){

				
	                //obteniendo el nombre del usuario
	                String nombreUsuario=  objUsuario.getNomusuario();
                    System.out.println("nombreUsuario " + nombreUsuario);
                    
                    //obteniendo los modulos a los que tiene derecho (menu)
                    modulosAUX  = (ArrayList<Modulo>)  acc.retornaMenu(objUsuario.getPerfil());
                   
                    System.out.println("REGRESE-----------------------");
	                Iterator iterG = modulosAUX.iterator();
	                while(iterG.hasNext()){
	                	Modulo menu = (Modulo) iterG.next();
	                	System.out.println("VALOR -->" + menu.getCvemodulo());
	                    System.out.println("VALOR -->" + menu.getNommodulo());
	                    System.out.println("VALOR -->" + menu.getAction());
	
	                }
	
	                 //obteniendo los modulos hijos
	              //obteniendo los modulos a los que tiene derecho (menu)
                    modulosAUXP  = (ArrayList<Modulo1>)  acc.retornaMenu1(objUsuario.getPerfil());
                   
                    System.out.println("REGRESE 1-----------------------");
	                Iterator iterGp = modulosAUXP.iterator();
	                while(iterGp.hasNext()){
	                	Modulo1 menup = (Modulo1) iterGp.next();
	                	System.out.println("VALOR -->" + menup.getNompadre1());
	                    System.out.println("VALOR -->" + menup.getNommodulo1());
	                    System.out.println("VALOR -->" + menup.getAction1());
	
	                }
	                 if(modulosAUX == null || modulosAUX.size()==0){
	                    addActionError("***** Ud. no tiene acceso a este modulo, favor de contacar al administrador del sistema ***** ");
	                    return "error";
	                }
			 }	 //usuario          
			   return "barra";
			 }
		
			} catch (Exception e) {
				e.printStackTrace();
				return "barra";
			}
		  }

	
		

		
	    public String cerrar() {
	        if (session != null) {
	            session.clear();
	        }
	       addActionMessage("Importante: *** La sesión ha terminado ***");
	       //addActionError("Importante: *** La sesión ha terminado ***");
	        return "SUCCESS";
	    }
	    

		
//getters y setters		

		public ArrayList<Usuario> getLisUsu() {
			return lisUsu;
		}


		public void setLisUsu(ArrayList<Usuario> lisUsu) {
			this.lisUsu = lisUsu;
		}


		public Usuario getObjUsuario() {
			return objUsuario;
		}


		public void setObjUsuario(Usuario objUsuario) {
			this.objUsuario = objUsuario;
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



		public String getIdusuario() {
			return idusuario;
		}



		public void setIdusuario(String idusuario) {
			this.idusuario = idusuario;
		}



		public String getIdcontrasena() {
			return idcontrasena;
		}



		public void setIdcontrasena(String idcontrasena) {
			this.idcontrasena = idcontrasena;
		}



		public Map getSession() {
			return session;
		}



		public void setSession(Map session) {
			this.session = session;
		}




		
}
