package mantenimientos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Modulo;
import beans.Modulo1;
import beans.Usuario;
import utils.MySQLConexion;

public class acceso {
	
	//variables
	private ArrayList<Usuario> listaUsuario= new ArrayList<Usuario>();
	private ArrayList<Modulo>  listaModulo= new ArrayList<Modulo>();
	private ArrayList<Modulo1> listaModulo1= new ArrayList<Modulo1>();
	
	 //Para consultar una lista
	public ArrayList<Usuario> retornaUsuario(String usu, String contra) throws SQLException {
		//datos de conexion
		System.out.println("entre a consulta lista");
		Connection cnx=null;
		PreparedStatement ps = null;
        //variables
		ArrayList<Usuario> ls= new ArrayList<Usuario>();
		
		try {
			cnx = MySQLConexion.getConnection();
			ps=cnx.prepareStatement("SELECT * FROM USUARIOS WHERE CVEUSUARIO = '" + usu + "' and contrasenia = '" + contra + "'");
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				Usuario U = new Usuario(
				rs.getString("cveusuario"),
				rs.getString("nomusuario"),
				rs.getString("contrasenia"),
				rs.getString("perfil"),
				rs.getString("tipo")
						
				);
				
				ls.add(U);
				
				System.out.println("codigo valor: " + U.getCveusuario());
				System.out.println("name valor: " + U.getNomusuario());
			} //while
			rs.close();
			ps.close();
	        cnx.close();

	}catch (Exception e) {
		// TODO: handle exception
	  }
		System.out.println("tamaaaaño de lista " + ls.size());
		return ls;
	}	
	
	
	//para obtenr lo smodulos a los que tiene derrecho
	 //Para consultar una lista
		public ArrayList<Modulo> retornaMenu(String perfil) throws SQLException {
			//datos de conexion
			System.out.println("entre a consulta de modulos");
			Connection cnx=null;
			PreparedStatement ps = null;
	        //variables
			ArrayList<Modulo> ls= new ArrayList<Modulo>();
			
			try {
				cnx = MySQLConexion.getConnection();				
				String query ="SELECT modulos.CVEMODULO, NOMMODULO, ACTION,MODPADRE,ORDEN FROM  modulos "
						+ " LEFT OUTER JOIN modulos_perfil  ON modulos.CVEMODULO=modulos_perfil.CVEMODULO "
						+ " WHERE PERFIL='" + perfil +"' ORDER BY ORDEN  ";
				System.out.println("el Coeri es " + query);
				ps=cnx.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					Modulo M = new Modulo(
					rs.getString("CVEMODULO"),
					rs.getString("NOMMODULO"),
					rs.getString("ACTION"),
					rs.getString("MODPADRE"),
					rs.getString("ORDEN")
					
							
					);
					
					ls.add(M);
					
					System.out.println("codigo valor: " + M.getCvemodulo());
					System.out.println("name valor: " + M.getNommodulo());
				} //while
				rs.close();
				ps.close();
		        cnx.close();

		}catch (Exception e) {
			// TODO: handle exception
		  }
			System.out.println("tamaaaaño de lista " + ls.size());
			return ls;
		}	
		
		
		//para obtenr lo smodulos a los que tiene derrecho (H I J O S)
		 //Para consultar una lista
			public ArrayList<Modulo1> retornaMenu1(String perfil) throws SQLException {
				//datos de conexion
				System.out.println("entre a consulta de modulos 1");
				Connection cnx=null;
				PreparedStatement ps = null;
		        //variables
				ArrayList<Modulo1> ls= new ArrayList<Modulo1>();
				
				try {
					cnx = MySQLConexion.getConnection();				
					String query ="SELECT modulos.CVEMODULO as CVEMODULO1, NOMMODULO as NOMMODULO1, ACTION as ACTION1, MODPADRE as MODPADRE1, ORDEN as ORDEN1 FROM  modulos "
							+ " LEFT OUTER JOIN modulos_perfil  ON modulos.CVEMODULO=modulos_perfil.CVEMODULO "
							+ " WHERE PERFIL='" + perfil +"' ORDER BY ORDEN  ";
					System.out.println("el Coeri 1 es " + query);
					ps=cnx.prepareStatement(query);
					ResultSet rs=ps.executeQuery();
					while (rs.next()) {
						Modulo1 M1 = new Modulo1(
						rs.getString("CVEMODULO1"),
						rs.getString("NOMMODULO1"),
						rs.getString("ACTION1"),
						rs.getString("MODPADRE1"),
						rs.getString("ORDEN1")
									
						);
						
						ls.add(M1);
						
						System.out.println("codigo valor1 : " + M1.getCvemodulo1());
						System.out.println("name valor1 : " + M1.getNommodulo1());
					} //while
					rs.close();
					ps.close();
			        cnx.close();

			}catch (Exception e) {
				// TODO: handle exception
			  }
				System.out.println("tamaaaaño de lista " + ls.size());
				return ls;
			}	
	
	
	
	public ArrayList<Usuario> getListaUsuario() {
		return listaUsuario;
	}

	public void setListaUsuario(ArrayList<Usuario> listaUsuario) {
		this.listaUsuario = listaUsuario;
	}


	public ArrayList<Modulo> getListaModulo() {
		return listaModulo;
	}


	public void setListaModulo(ArrayList<Modulo> listaModulo) {
		this.listaModulo = listaModulo;
	}


	public ArrayList<Modulo1> getListaModulo1() {
		return listaModulo1;
	}


	public void setListaModulo1(ArrayList<Modulo1> listaModulo1) {
		this.listaModulo1 = listaModulo1;
	}


	

}
