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


@WebServlet(name = "Proyectos", urlPatterns = {"/Proyectos"})
public class ControllerProyectos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ProyectosDao proyectosDao = ProyectosDaoImp.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerProyectos() {
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
				System.out.println(this.listar());
				//response.getWriter().print(this.listar());
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

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
