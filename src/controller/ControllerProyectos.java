package controller;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.ProyectosDao;
import daoImp.ProyectosDaoImp;
import model.Proyectos;


import java.io.IOException;
import java.util.List;
import java.util.Map;
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
	private final ProyectosDao proyectosDao = ProyectosDaoImp.getInstance();
       
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
		String action = request.getParameter("action");

		switch (action) {
			case "index":
				request.setAttribute("listProyectos", this.listar());
				request.getRequestDispatcher("views/proyectos/ListProyectos.jsp").forward(request, response);
				break;
			case "ajax"://Listado de Customer
				Gson gson = new Gson();
				JsonObject jsonResponse = new JsonObject();

				String value = (request.getParameter("search") == null) ? "" : request.getParameter("search");

				jsonResponse.add("data", gson.toJsonTree(this.find("all", value)));

				response.setContentType("application/json");
				response.setHeader("Cache-Control", "no-store");
				response.getWriter().print(jsonResponse);
				break;
			default:
				response.getWriter().append("Served at: ").append(request.getContextPath());
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
				break;

			default:
				break;
			}
	}
	
	//---------------------------------------------Metodos----------------------------------------------------- 

	private List<Map<String, String>> listar() {
		try {
			return proyectosDao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<Proyectos> find(String field, String value) {
		List<Proyectos> po = null;
		try {
			po = proyectosDao.find(field, value);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return po;
	}

}
