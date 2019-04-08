package controller;

import dao.ProyectosActividadesDao;
import daoImp.ProyectosActividadesDaoImp;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerProyectosActividades
 */
@WebServlet(name= "ProyectosActividades", urlPatterns="/ProyectosActividades")
public class ControllerProyectosActividades extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProyectosActividadesDao pado = ProyectosActividadesDaoImp.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerProyectosActividades() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");

		switch (action) {
			case "index":
				request.setAttribute("listProyectosActividades", this.listar());
				request.getRequestDispatcher("views/proyectos_actividades/List.jsp").forward(request, response); 
				break;
			default:
				response.getWriter().append("Served at: ").append(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 *  METODOS
	 * @return
	 */

	public List<Map<String, String>> listar() {
		try {
			return pado.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
