package controller;
import java.util.ArrayList;
import java.util.List;

import dao.TipoUsuarioDao;
import daoImp.TipoUsuarioDaoImp;
import model.TipoUsuario;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

;


@WebServlet(name = " TipoUsuario", urlPatterns = {"/TipoUsuario"})//URL del servlet
public class ControllerTipoUsuario extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	//Objeto de tipo CustomerDao
	private final TipoUsuarioDao tUsuarioDao = TipoUsuarioDaoImp.getInstance();

    public ControllerTipoUsuario() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //captura de parametro action  //paso 2
        String action = request.getParameter("action");

        //Opciones
        switch (action) {
		case "index":
			try {
				request.setAttribute("list", this.listar());
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			request.getRequestDispatcher("views/tipo_usuario/List.jsp").forward(request, response);
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


		boolean redirect = request.getParameter("redirect").equals("true");
		String tipo = request.getParameter("tipo");
		String descripcion= request.getParameter("descripcion");

		byte id = 0;

		if(request.getParameter("id") != null){
			id =  Byte.parseByte(request.getParameter("id"));
		}

		System.out.print("------------------------" + redirect + "-----------------------------");

		switch (option) {
			case "update":
				if (redirect) {
					request.setAttribute("datos", this.crearLista(id, tipo, descripcion));
					request.getRequestDispatcher("views/tipo_usuario/UpdateTipoUsuario.jsp").forward(request, response);
				} else {
					try {
						this.update(id, tipo, descripcion);
					} catch (Exception e) {
						e.printStackTrace();
					}

					String contextPath= "";
					response.sendRedirect(response.encodeRedirectURL(contextPath + "/InfusionActivity_war_exploded/TipoUsuario?action=index"));
				}
				break;
				default:
					response.getWriter().append("error dato no valido");
					break;
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
	                    response.sendRedirect(response.encodeRedirectURL(contextPath + contextPath + "/infusion-Activity?action=index"));
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
		                    
		                     this.deleteTipoUsario(id);
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
		//---------------------------------------------Metodos----------------------------------------------------- 
        private List<Map<String, String>> listar() throws Exception{
    		return tUsuarioDao.findAll();
       	}

		private  List<TipoUsuario> crearLista(byte id, String tipo, String descripcion){
			//crear la lista
			List<TipoUsuario> list_tipo_usuario = new ArrayList<>();

			//Objeto
			TipoUsuario tipo_usuario  = new TipoUsuario(id, tipo, descripcion);

			//add to list
			list_tipo_usuario.add(tipo_usuario);

			return list_tipo_usuario;
		}

		private String  save(byte id, String tipo, String descripcion) throws Exception{
			//construccion del objeto
			TipoUsuario tipo_usuario = new TipoUsuario(id, tipo, descripcion);

			tUsuarioDao.save(tipo_usuario);

			return "ok";
		}

		private String  update(byte id, String tipo, String descripcion) throws Exception{
			//construccion del objeto
			TipoUsuario tipo_usuario = new TipoUsuario(id, tipo, descripcion);

			tUsuarioDao.update(tipo_usuario);

			return "ok";
		}
       /*

        private String deleteTipodeusario(byte id) throws Exception{
        	//System.out.println("entre---------------------delete");
        	Tipodeusuario tipodeusuario = new Tipodeusuario();
        	tipodeusuario.setId(id);
            tipodeusuarioDao.delete(tipodeusuario);
            return "ok"; 
       }
         */
}
