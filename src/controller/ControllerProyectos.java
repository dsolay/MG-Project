package controller;

//importar
import model.Proyectos;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.ProyectosDao;
import daoImp.ProyectosDaoImp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProyectosDao;



/**
* Servlet implementation class CustomerController
*/                            //Paso 1
@WebServlet(name = "Proyectos", urlPatterns = {"/Proyectos"})//URL del servlet
public class ControllerProyectos extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	//Objeto de tipo CustomerDao
	private final  ProyectosDao proyectosDao = ProyectosDaoImp.getInstance();
     
  /**
   * @return 
 * @return 
 * @see HttpServlet#HttpServlet()
   */
  public  ControllerProyectos() {
      super();
      // TODO Auto-generated constructor stub
  }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //captura de parametro action  //paso 2
      String action = request.getParameter("action");
      //Opciones
      switch (action) {
		case "index"://Listado de Customer
			
			try {
				//Seteo de la lista
				request.setAttribute("proyectosList", this.listar());
				
			} catch (Exception e) {
				
				System.out.println("Error");
				
			}
			
			//redirect y paso de la lista a la vista
          request.getRequestDispatcher("ListarProyectosView.jsp").forward(request, response);
			
			break;
			
		case "add"://Listado de Customer
			
			 request.getRequestDispatcher("AgregarProyectosView.jsp").forward(request, response);
				
	    break;	
		default:
			response.getWriter().append("error dato no valido"); 
			break;
		}
      
     
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			 //captura de parametro action  //paso 2
	       String option = request.getParameter("option");
	       

			boolean redirect = request.getParameter("redirect").equals("true");

			Short Id = request.getParameter("id") != null ?Short.parseShort(request.getParameter("id")) : 0;
			String Nombre_proyecto = request.getParameter("nombre_proyecto");
			String Descripcion = request.getParameter("descripcion");
			short Id_usuario = request.getParameter("id_usuario") != null ? Short.parseShort(request.getParameter("id_usuario")) : 0;
		
			System.out.println(Id);
			System.out.println(Id_usuario);
			switch (option) {
			
			case "add":
				
				break;
			case "update":
				if (redirect) {
					request.setAttribute("datos", this.crearLista(Id, Nombre_proyecto,Descripcion,Id_usuario));
					request.getRequestDispatcher("views/proyectos/UpdateProyectos.jsp").forward(request, response);
				} else {
					try {
						this.update(this.crearLista(Id, Nombre_proyecto,Descripcion,Id_usuario));
					} catch (Exception e) {
						e.printStackTrace();
					}

					String contextPath= "";
					response.sendRedirect(response.encodeRedirectURL(contextPath + "/InfusionActivity_war_exploded/TipoUsuario?action=index"));
				}
				break;

			default:
				break;
			}
	}
	
	//---------------------------------------------Metodos----------------------------------------------------- 
	
	//Listar
  private  List<Map<String, String>>  listar() throws Exception{
  	 //Lista de Customer
      List<Map<String, String>> proyectos = ProyectosDao.findAll();
       //Retornar Lista 
       return proyectos;
       
  }
  
  //Crear listado para eliminar y modificar
  private  List<Customer>  crearLista(int id, String custFirstName, String custLastName, String custMobile, String custEmail){
  	//crear la lista
      List<Customer> listaCustomer = new ArrayList<Customer>();
      //Objeto
      Customer customer = new Customer();
      //Set  datos
      customer.setId(id);

      customer.setFirst_name(custFirstName);
      customer.setLast_name(custLastName);
      customer.setMobile(custMobile);
      customer.setEmail(custEmail);
      
      //add to list
      listaCustomer.add(customer);
      return listaCustomer;
      
 }
  
  
  //Guardar
  private String  guardarCustomers(String firstName, String lastName, String email,String mobile) throws Exception{
      //construccion del objeto
  	Customer customer = new Customer();
      customer.setFirst_name(firstName);
      customer.setLast_name(lastName);
      customer.setEmail(email);
      customer.setMobile(mobile);
      customerDao.saveCustomer(customer);
     // customerDao.saveCustomer(customer);
      System.out.println("OK custumer controller");
      return "ok";
 }
  private String deleteCustumers(int id) throws Exception{
  	//System.out.println("entre---------------------delete");
  	Customer customer = new Customer();
  	customer.setId(id);
      customerDao.deleteCustomer(customer);
      return "ok"; 
 }
  
//Update CUSTUMER
  private String  updateCustumers(int id, String firstName, String lastName, String email,String mobile) throws Exception{
  	 //construccion del objeto
  	Customer customer = new Customer();
  	customer.setId(id);
      customer.setFirst_name(firstName);
      customer.setLast_name(lastName);
      customer.setEmail(email);
      customer.setMobile(mobile);
       customerDao.updateCustomer(customer);
     // customerDao.saveCustomer(customer);
      //System.out.println("OK custumer controller");
      return "ok";
 } 

}
