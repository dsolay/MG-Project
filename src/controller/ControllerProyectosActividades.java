package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.ProyectosActividadesDao;
import daoImp.ProyectosActividadesDaoImp;
import model.ProyectosActividades;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action) {
			case "index":
				request.setAttribute("project_name", request.getParameter("project_name"));
				request.setAttribute("project_id", request.getParameter("project_id"));
				request.getRequestDispatcher("views/proyectos_actividades/ListProyectosActividades.jsp").forward(request, response);
				break;
			case "ajax":
				Gson gson = new Gson();
				JsonObject jsonResponse = new JsonObject();

				String value = request.getParameter("search[value]");
				short limit = (request.getParameter("length") == null) ? (short) 5: Short.parseShort(request.getParameter("length"));
				String field = (request.getParameter("field") == null) ? "" : request.getParameter("field");
				String project = (request.getParameter("project") == null) ? "" : request.getParameter("project");

				int draw = (request.getParameter("draw") != null ) ? Integer.parseInt(request.getParameter("draw")) : 1;
				short offset = this.validateParameter(request.getParameter("start"));

				jsonResponse.addProperty("draw", draw);
				Map<String, String> params = new HashMap<>();

				if (! field.isEmpty()) {
					params.put("field", field);
				}

				params.put("project", project);
				params.put("value", value);
				params.put("order", "ASC");
				
				if (limit != -1) {
					params.put("limit", String.valueOf(limit));
					params.put("offset", String.valueOf(offset));
				}

				List<Map<String, String>> data = this.listar(params, true);

				int records = this.getNumRecords(value, project);

				jsonResponse.addProperty("recordsTotal", records);
				jsonResponse.addProperty("recordsFiltered", records);

				jsonResponse.add("data", gson.toJsonTree(data));

				response.setContentType("application/json");
				response.setHeader("Cache-Control", "no-store");
				response.getWriter().print(jsonResponse);
				break;
			default:
				response.getWriter().append("Served at: ").append(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		short id = this.validateParameter(request.getParameter("id"));
		short id_usuario = this.validateParameter(request.getParameter("usuario"));
		String actividad = request.getParameter("actividad");
		byte prioridad = Byte.parseByte(String.valueOf(this.validateParameter(request.getParameter("prioridad"))));
		String entrega= request.getParameter("entrega");
		short id_proyecto = this.validateParameter(request.getParameter("project_id"));
		byte estado = 0;

		if (request.getParameter("estado") != null) {
			if (request.getParameter("estado").equals("on")) {
				estado = 1;
			}
		}
		
		request.setAttribute("project_name", request.getParameter("project_name"));
		request.setAttribute("project_id", id_proyecto);

		switch (action) {
			case "index":
				doGet(request, response);
			break;
			case "add":
				try {
					this.doAction(this.createPA(id, actividad, prioridad, estado, entrega, id_usuario, id_proyecto), "save");
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("views/proyectos_actividades/ListProyectosActividades.jsp").forward(request, response);
				break;
			case "update":
				try {
					this.doAction(this.createPA(id, actividad, prioridad, estado, entrega, id_usuario, id_proyecto), "update");
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("views/proyectos_actividades/ListProyectosActividades.jsp").forward(request, response);
				break;
			case "delete":
				try {
					this.doAction(this.createPA(id), "delete");
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("views/proyectos_actividades/ListProyectosActividades.jsp").forward(request, response);
				break;

			default:
				break;
		}
	}

	/**
	 *  METODOS
	 * @return
	 */

	public List<Map<String, String>> listar(Map<String, String> params, boolean filter) {
		List<Map<String, String>> proyecos_actividades;
				
		try {
			proyecos_actividades = pado.find(params, filter);

			for (Map<String, String> actividad:
				 proyecos_actividades) {

				int days = this.getTimeRemaining(actividad.get("entrega"));

				if (days <= 0 && actividad.get("estado").equals("1")) {
					actividad.put("estado", "0");
				} else if (days > 0 && actividad.get("estado").equals("0")) {
					actividad.put("estado", "1");
				}
				this.doAction(this.createPA(actividad), "update");

				actividad.put("restante", String.valueOf((days < 0) ? 0 : days));
			}

			return  proyecos_actividades;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getTimeRemaining(String fecha_entrega) {
		LocalDate fentrega = LocalDate.parse(fecha_entrega, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate current_date = LocalDate.now();

		Period period = Period.between(current_date, fentrega);

		return Integer.parseInt(String.valueOf(period.getDays()));
	}

	private  ProyectosActividades createPA(short id, String actividad, byte prioridad, byte estado, String entrega, short id_usuario, short id_proyecto){
		return new ProyectosActividades(id, actividad, prioridad, estado, entrega, id_usuario, id_proyecto);
	}

	private  ProyectosActividades createPA(short id){
		ProyectosActividades pa = new ProyectosActividades();

		pa.setId(id);
		return pa;
	}

	private ProyectosActividades createPA(Map<String, String> mapPA){
		ProyectosActividades pa = new ProyectosActividades();

		pa.setId_usuario(Short.parseShort(mapPA.get("id")));
		pa.setNombre(mapPA.get("actividad"));
		pa.setPrioridad(Byte.parseByte(mapPA.get("prioridad")));
		pa.setEstado(Byte.parseByte(mapPA.get("estado")));
		pa.setFecha_entrega(mapPA.get("entrega"));
		pa.setId_usuario(Short.parseShort(mapPA.get("id_usuario")));
		pa.setId_proyecto(Short.parseShort(mapPA.get("id_proyecto")));

		return pa;
	}

	private void doAction(ProyectosActividades pa, String action) {
		try {
			switch (action) {
				case "save":
					pado.save(pa);
					break;
				case "update":
					pado.update(pa);
					break;
				case "delete":
					pado.delete(pa.getId());
					break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private int getNumRecords(String value, String project) {
		try {
			return pado.getNumRecords(value, project);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	private short validateParameter(String param) {
		if (param != null) {
			if (! param.isEmpty()) {
				return Short.parseShort(param);
			}
		}
		return 0;
	}
}
