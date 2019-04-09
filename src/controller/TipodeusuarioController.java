package controller;
import modelo.Tipodeusuario;
import java.util.ArrayList;
import java.util.List;

import dao.TipodeusuarioDao;
import daoImp.TipodeusuarioDaoImp;
import modelo.Tipodeusuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

;


@WebServlet(name = " Tipodeusuario", urlPatterns = {"/Tipodeusuario"})//URL del servlet
public class TipodeusuarioController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	//Objeto de tipo CustomerDao
	private final TipodeusuarioDao tipodeusuarioDao = TipodeusuarioDaoImp.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipodeusuarioController() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //captura de parametro action  //paso 2
        String action = request.getParameter("action");
        //Opciones
        switch (action) {
		case "index":
			
			try {

				request.setAttribute("tipodeusuarioList", this.listar());
				
			} catch (Exception e) {
				
				System.out.println("Error");
				
			}

			
			request.getRequestDispatcher("views/tipo_usuario/ListarTipodeusuarioView.jsp").forward(request, response);
			
			break;
			
		case "add":
			
			 request.getRequestDispatcher("AgregarTipodeusuarioView.jsp").forward(request, response);
				
	    break;	
		default:
			response.getWriter().append("error dato no valido"); 
			break;
		}
        
    
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
        String option = request.getParameter("option");
        
        
        String redirect = request.getParameter("redirect");
        String tipoDescripcion= request.getParameter("descripcion");
        String tipoTipo = request.getParameter("tipo");
        
        
        byte id = 0; 
        
        if(request.getParameter("tipoId") != null){
           
       	 id =  Byte.parseByte(request.getParameter("tipoId"));
          
        } 
        System.out.println("-------------------------"+option+"--------------------------------------");
        switch (option) {
           case "add":
           	try {
                    this.guardarTipodeusuarios(tipoDescripcion, tipoTipo );
                    request.setAttribute("mensaje", "dato agregado");
               } catch (Exception ex) {
               	request.setAttribute("mensaje", "Error al guardar el dato");
               	System.out.println("Error al guardar el dato");
               }
           	 request.getRequestDispatcher("AgregarTipodeusuarioView.jsp").forward(request, response);
           	break;  
           	
           case "update":
         
        	   System.out.print("------------------------"+redirect+"-----------------------------");
               if("true".equals(redirect)){
                   try {
						request.setAttribute("datos", this.crearLista(id, tipoDescripcion, tipoTipo));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                   request.getRequestDispatcher("UpdateTipodeusuarioView.jsp").forward(request, response);
               }else{
                  
                   request.setAttribute("mensaje", "test");
	               try {
	                    
	                     this.updateTipodeusarios(id , tipoDescripcion, tipoTipo);
	                     
	                    } catch (Exception ex) {
	                        System.out.println(ex+".............---");

	                    
	                    }
	                    String contextPath= "";
	                    response.sendRedirect(response.encodeRedirectURL(contextPath + contextPath + "/CrudJsp/Customer?action=index"));
               }
              
           break;
           	 //Delete Customer
	            case "delete":   
	            	System.out.print("------------------------"+redirect+"-----------------------------");
	                if("true".equals(redirect)){    
	                	request.setAttribute("datos", this.crearLista((byte) id, 	tipoDescripcion, tipoTipo));
	                    request.getRequestDispatcher("DeleteTipodeusuarioView.jsp").forward(request, response);
	                }else{
	
		               try {
		                    
		                     this.deleteTipodeusario(id);
		                    } catch (Exception ex) {
		                        System.out.println(ex+".............---");
		                       // Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
		                    }
		                    String contextPath= "";
		                    response.sendRedirect(response.encodeRedirectURL(contextPath + "/CrudJsp/Tipodeusuario?action=index"));
		               }
	               
	            break;
             
           default:
			      response.getWriter().append("error dato no valido"); 
			      break;
		}
        
    }
        
      private void guardarTipodeusuarios(String tipoDescripcion, String tipoTipo) {
		// TODO Auto-generated method stub
		
	}
		//---------------------------------------------Metodos----------------------------------------------------- 
        private  List<Tipodeusuario>  listar() throws Exception{
       	 //Lista de Customer
            List<Tipodeusuario> tipodeusuarios = tipodeusuarioDao.findAllTipodeusuarios ();
            //Retornar Lista 
            return tipodeusuarios ;
            
       }
        private  List<Tipodeusuario>  crearLista(byte id, String tipoDescripcion, String tipoTipo){
        	//crear la lista
            List<Tipodeusuario> listaTipodeusuario = new ArrayList<Tipodeusuario>();
            //Objeto
            Tipodeusuario tipodeusuario  = new Tipodeusuario();
            //Set  datos
            tipodeusuario.setId(id);

            tipodeusuario.setDescripcion(tipoDescripcion);
            tipodeusuario.setTipo(tipoTipo);
         
            //add to list
            listaTipodeusuario.add(tipodeusuario);
            return listaTipodeusuario;
            
       }
        private String  guardarCustomers(String firstName, String descripcion, String tipo) throws Exception{
            //construccion del objeto
        	Tipodeusuario tipodeusuario = new Tipodeusuario();
        	tipodeusuario.setDescripcion(descripcion);
        	tipodeusuario.setTipo(tipo);
          
            tipodeusuarioDao.saveTipodeusuario(tipodeusuario);
            System.out.println("OK tipodeusuario controller");
            
            return "ok";
       }
        private String deleteTipodeusario(byte id) throws Exception{
        	//System.out.println("entre---------------------delete");
        	Tipodeusuario tipodeusuario = new Tipodeusuario();
        	tipodeusuario.setId(id);
            tipodeusuarioDao.deleteTipodeusuario(tipodeusuario);
            return "ok"; 
       }
        private String  updateTipodeusarios(byte id, String descripcion ,String tipo) throws Exception{
       	 //construccion del objeto
        	Tipodeusuario tipodeusuario=new Tipodeusuario();
        	tipodeusuario.setId(id);
        	tipodeusuario.setDescripcion(descripcion);
        	tipodeusuario.setTipo(tipo);
        
        	tipodeusuarioDao.updateTipodeusuario(tipodeusuario);
          
           return "ok";
      } 
}
