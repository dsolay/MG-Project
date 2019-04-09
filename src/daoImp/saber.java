
package daoImp;
/*
 *Implementacion de los metodos Dao Custumer
 */
import dao.ProyectosDao;
import modelo.Proyectos;
import db.MySQLIConexion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDaoImp extends MySQLIConexion implements CustomerDao{
     
	//Atributo 
 	private static  CustomerDaoImp customerDaoImpl = null;
	private ArrayList customers;
	
	public CustomerDaoImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public long saveCustomer(Customer customer) throws Exception {
		
		String sql = "INSERT INTO CUSTOMER(first_name, last_name, email, mobile) values (?,?,?,?)";
		
		long bandera = 1;
		try {
			
			//abrir la conexion con mysql
			 this.conectar();
			 
			 //Preparar la ejecucion de la Query/Consulta
			 PreparedStatement statement = this.getCn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); 
			 //setear los datos a ?,?,?,?
			 statement.setString(1, customer.getFirst_name()); 
			 statement.setString(2, customer.getLast_name()); 
			 statement.setString(3, customer.getEmail()); 
			 statement.setString(4, customer.getMobile()); 
			 
			 //Ejecutar las sentencias sql
			 statement.executeUpdate();
			 bandera = 1;
		} catch (ClassNotFoundException | SQLException e) {
			//Mostrar error
			System.out.println("Error inesperado en inset: "+ e);
			throw e;
		}finally {	
			//cerrar conexion con mysql
			this.cerrarCn(); 
		} 
		return bandera;
	}

	@Override
	public void updateCustomer(Customer customer) throws Exception {
		 String sql = "UPDATE customer SET first_name = ?, last_name= ? , email= ?, mobile = ? WHERE id = ?";
	        try {
	            //Abrir Conexion con MySQL
	            this.conectar();
	            //Preparar la Querysate
	            PreparedStatement statment = this.getCn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            
	            statment.setString(1, customer.getFirst_name());
		        statment.setString(2, customer.getLast_name());
	            statment.setString(3, customer.getEmail());
		        statment.setString(4, customer.getMobile());
	            statment.setInt(5, customer.getId());
	            //Actualiza los valores
	            statment.executeUpdate();
	            System.out.println("Dato actualizado");
	        } catch (ClassNotFoundException | SQLException e) {
	        	 System.out.println("Error update");
	            throw e;
	        }finally{
	            this.cerrarCn();
	        }		
	}

	@Override
	public void deleteCustomer(Customer customer) throws Exception {
		
		String sql = "DELETE FROM customer WHERE id = ?";
		
        try {
            //Abrir Conexion con MySQL
            this.conectar();
            //Preparar la Query
            PreparedStatement statment = this.getCn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            statment.setInt(1, customer.getId());
            
            //Actualiza los valores
            statment.executeUpdate();
            
              System.out.println("Dato Eliminado");
              
        } catch (ClassNotFoundException | SQLException e) {
        	
        	 System.out.println("Error al eliminar el dato");
        	 
            throw e;
        }finally{
            this.cerrarCn();
        }		
		
	}

	@Override
	public List<Customer> findAllCustomers() throws Exception {
		String sql = "SELECT * FROM evaluacion";
		
		List<Customer> s = null;
		//Tabla   //objeto de tipo tabla
        ResultSet rs;
               
		try {
                    //Abrir Conexion con MySQL
                    this.conectar();
                    //Preparar la Query
                    PreparedStatement statment = this.getCn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    rs = statment.executeQuery();//Devuelve un resulset
                    //Lista
                    customers= new ArrayList();
                    //recorremos el resultSet
                    while (rs.next()){
                    	
                          //instancia de Objeto Customers
                          Customer customer = new Customer();
                          customer.setId(rs.getInt(1));
					      customer.setFirst_name(rs.getString(2));
					      customer.setLast_name(rs.getString(3));
					      customer.setEmail(rs.getString(4));
					      customer.setMobile(rs.getString(5));
					      
                          //Agregamos los elementos 
                          customers.add(customer);
                        }
			
		} catch (SQLException e) {
			            System.out.println("Error al listar datos");
                        throw  e;
		}finally{
                        //Cerrar conexion
                        this.cerrarCn();
                } 
                
		return customers;
	}
	
	//Instancia Dao Imp Para acceder a los metodos
    public static CustomerDao getInstance() {
		if (customerDaoImpl == null) {
			customerDaoImpl = new CustomerDaoImp();
		}	
		return customerDaoImpl;
    }
    public static void main(String[] args){
    	
    	
 	   Customer customer=new Customer();
 	   
 	   customer.setId(7);
 	   
 	   try {
 		   CustomerDaoImp cus = new CustomerDaoImp();		   
 		  cus.deleteCustomer(customer);
 	   }catch(Exception e) {
 		   System.out.println("error de registro:"+e.getMessage());
 	   }
 	   
 	   
 		 
 		
 	
 }
    }

	