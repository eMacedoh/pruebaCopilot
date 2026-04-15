package mantenimientos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.commons.collections.bag.SynchronizedSortedBag;

import beans.Trabajador;
import utils.MySQLConexion;


public class gestionTrabajador {
	
	//variables
	private ArrayList<Trabajador> listaTrabajador= new ArrayList<Trabajador>();
	
	
    //Insertar en la BD
	public boolean RegistrarEntradas (Trabajador data) { //trabajador es el BEan
		
		System.out.println("entre a regisstrarEnrada");
		Connection cnx=null;
		PreparedStatement pstm = null;
		
		try {
			cnx = MySQLConexion.getConnection();
			String sql = "INSERT INTO trabajador VALUES (?,?,?,?,?,?)";
			pstm = cnx.prepareStatement(sql);
			   pstm.setString(1, data.getCod());
			   pstm.setString(2, data.getNombte());
			   pstm.setString(3, data.getApellido());
			   pstm.setInt(4, data.getEdad());
			   pstm.setInt(5, data.getGenero_cod());
			   pstm.setInt(6, data.getDepartamento_cod());
			   
			   pstm.executeUpdate();
			   return true;
		} catch (Exception e) {					
			 e.printStackTrace();
			 return false;
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (cnx !=null) {
					cnx.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
				return false;
			}
		}
		
		
	}
	
	//consulta de lista en la BD
	 //Para consultar una lista
		public ArrayList<Trabajador> retornaLista() throws SQLException {
			//datos de conexion
			System.out.println("entre a consulta lista");
			Connection cnx=null;
			PreparedStatement ps = null;
	        //variables
			ArrayList<Trabajador> ls= new ArrayList<Trabajador>();
			
			try {
				cnx = MySQLConexion.getConnection();
				ps=cnx.prepareStatement("SELECT * FROM TRABAJADOR");
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					Trabajador t = new Trabajador(
					rs.getString("cod"),
					rs.getString("nombte"),
					rs.getString("apellido"),
					rs.getInt("edad"),
					rs.getInt("genero_cod"),
					rs.getInt("departamento_cod")					
					);
					
					ls.add(t);
					
					System.out.println("codigo valor: " + t.getCod());
					System.out.println("name valor: " + t.getNombte());
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
				
		
	
		 //Para consultar un valor de un registro en la BD
			public static String retornaCodigo(String codigo) throws SQLException {
				//datos de conexion
				System.out.println("entre a consulta un valor" + codigo);
				Connection cnx=null;					
		        //variables
				String resultado = null;
				try {
					cnx = MySQLConexion.getConnection();
					Statement st = cnx.createStatement();
					ResultSet rs = st.executeQuery("SELECT NOMBTE  FROM TRABAJADOR WHERE COD = " + codigo);
					while (rs.next()) {
						
						resultado =rs.getString("NOMBTE");
					}
					 System.out.println("entre a consultaAAAAAAA el valor es " + resultado);
			        cnx.close();
			        st.close();
			        rs.close();
			}catch (Exception e) {
				// TODO: handle exception
			  }
				return resultado;
			}	
		
			
	//modificacion a un registro
	public static boolean RegistrarModificacion (Trabajador data) { //trabajador es el BEan
		
		System.out.println("entre a modificar registro");
		Connection cnx=null;
		PreparedStatement pstm = null;
		boolean resultado = false;
		try {
			cnx = MySQLConexion.getConnection();
			String sql = "UPDATE  TRABAJADOR SET nombte=?,apellido=?, edad=?, genero_cod=?, departamento_cod=? WHERE COD= ? ";
			pstm = cnx.prepareStatement(sql);
			   pstm.setString(1, data.getNombte());
			   pstm.setString(2, data.getApellido());
			   pstm.setInt(3, data.getEdad());
			   pstm.setInt(4, data.getGenero_cod());
			   pstm.setInt(5, data.getDepartamento_cod());
			   pstm.setString(6, data.getCod());
			   pstm.executeUpdate();
			   resultado=true;
			   return resultado;
		} catch (Exception e) {
			 e.printStackTrace();	
			  resultado=false;
			  return resultado;
					 
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (cnx !=null) {
					cnx.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
		
     //eliminacion de un registro
		public boolean RegistrarEliminar (String codigo) { //trabajador es el BEan
			
			System.out.println("entre a eliminar registro");
			Connection cnx=null;
			PreparedStatement pstm = null;			
			try {
				cnx = MySQLConexion.getConnection();
				
				String sql = "DELETE FROM TRABAJADOR WHERE COD = ?";
				pstm = cnx.prepareStatement(sql);
				   pstm.setString(1, codigo);
				   int filasBorradas = pstm.executeUpdate();				   
				   System.out.println("Se han borrado " + filasBorradas + " registros.");
				   return true;
			} catch (Exception e) {
				 e.printStackTrace();	
				 return false;
			} finally {
				try {
					if (pstm != null) {
						pstm.close();
					}
					if (cnx !=null) {
						cnx.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
		}
	
	}
