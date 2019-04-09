package controller;

import dao.ProyectosActividadesDao;
import daoImp.ProyectosActividadesDaoImp;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.*;
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
				ArrayList<String> thead = new ArrayList<String>();
				thead.add("ID");
				thead.add("Proyecto");
				thead.add("Actividad");
				thead.add("Username");
				thead.add("Creado");
				thead.add("Entrega");
				thead.add("Restante");
				thead.add("Prioridad");
				thead.add("Estado");
				
				request.setAttribute("list", this.listar());
				request.setAttribute("thead", thead);
				
				request.getRequestDispatcher("views/proyectos_actividades/List.jsp").forward(request, response); 
				break;
			case "add":
				//request.setAttribute("listProyectosActividades", this.listar());
				//request.getRequestDispatcher("views/proyectos_actividades/List.jsp").forward(request, response);
				break;
			default:
				response.getWriter().append("Served at: ").append(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String option = request.getParameter("option");
		
		switch (option) {
		case "add":
			
			break;
		case "update":
			
			break;

		default:
			break;
		}
	}

	/**
	 *  METODOS
	 * @return
	 */

	public List<Map<String, String>> listar() {
		List<Map<String, String>> proyecos_actividades = null;
				
		try {
			proyecos_actividades = pado.findAll();

			for (Map<String, String> actividad:
				 proyecos_actividades) {

				Map<String, String> map = this.getTimeRemaining(actividad.get("fecha_entrega"));
				actividad.put("time", map.get("time"));
				actividad.put("units", map.get("units"));
			}

			return  proyecos_actividades;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Map<String, String> getTimeRemaining(String fecha_entrega) {
		Map<String, String> entrega = new HashMap<>();

		String time;
		String units;

		LocalDate fentrega = LocalDate.parse(fecha_entrega, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate current_date = LocalDate.now();

		Period period = Period.between(current_date, fentrega);
		int days = period.getDays();

		if (days <= 0) {
			time = "0";
			units = "Finalizada";
		} else {
			time = String.valueOf(days);
			units = (days > 1 ) ? "dias" : "dia";
		}

		entrega.put("units", units);
		entrega.put("time", time);

		return entrega;
	}
}
