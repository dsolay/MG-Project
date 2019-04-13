package controller;

import dao.ProyectosActividadesDao;
import daoImp.ProyectosActividadesDaoImp;
import daoImp.ProyectosDaoImp;
import daoImp.UsuarioDaoImp;
import model.ProyectosActividades;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
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
				request.setAttribute("list", this.listar());

				request.getRequestDispatcher("views/proyectos_actividades/ListProyectosActividades.jsp").forward(request, response);
				break;
			case "add":

				try {
					List<Map<String, String>> users = UsuarioDaoImp.getInstance().findAllUsuario();
					List<Map<String, String>> projects = ProyectosDaoImp.getInstance().findAll();

					request.setAttribute("users", users);
					request.setAttribute("projects", projects);
				} catch (Exception e) {
					e.printStackTrace();
				}

				request.getRequestDispatcher("views/proyectos_actividades/AddProyectosActividades.jsp").forward(request, response);
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

		boolean redirect = request.getParameter("redirect").equals("true");

		Short id = request.getParameter("id") != null ? Short.parseShort(request.getParameter("id")) : 0;

		String username = request.getParameter("username");
		String proyecto = request.getParameter("proyecto");
		String actividad= request.getParameter("actividad");
		byte prioridad = request.getParameter("prioridad") != null ? Byte.parseByte(request.getParameter("prioridad")) : 0;
		String estado_value = request.getParameter("estado");
		String entrega= request.getParameter("entrega");
		short id_proyecto = request.getParameter("id_proyecto") != null ? Short.parseShort(request.getParameter("id_proyecto")) : 0;

		byte estado = 0;

		if (estado_value != null) {
			if (estado_value.equals("on")) {
				estado = (byte) 1;
			}
		}

		switch (option) {
		case "add":
			try {
				short id_usuario = UsuarioDaoImp.getInstance().find("username", username).get(0).getId();
				id_proyecto = ProyectosDaoImp.getInstance().find("nombre_proyecto", proyecto).get(0).getId();

				this.doAction(this.crearLista(id, actividad, prioridad, estado, entrega, id_usuario, id_proyecto), "save");
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "update":
			if (redirect) {
				try {
					List<Map<String, String>> users = UsuarioDaoImp.getInstance().findAllUsuario();
					request.setAttribute("users", users);
				} catch (Exception e) {
					e.printStackTrace();
				}

				request.getRequestDispatcher("views/proyectos_actividades/UpdateProyectosActividades.jsp").forward(request, response);
			} else {
				try {
					short id_usuario = UsuarioDaoImp.getInstance().find("username", username).get(0).getId();
					this.doAction(this.crearLista(id, actividad, prioridad, estado, entrega, id_usuario, id_proyecto), "update");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			break;

		case "delete":
			if (redirect) {
				request.getRequestDispatcher("views/proyectos_actividades/DeleteProyectosActividades.jsp").forward(request, response);
			} else {
				this.doAction(this.crearLista(id, null, (byte) 0, (byte) 0, null, (short) 0, (short) 0), "delete");
			}
			break;

		default:
			break;
		}

		String contextPath = request.getContextPath();
		response.sendRedirect(response.encodeRedirectURL(contextPath + "/ProyectosActividades?action=index"));
	}

	/**
	 *  METODOS
	 * @return
	 */

	public List<Map<String, String>> listar() {
		List<Map<String, String>> proyecos_actividades;
				
		try {
			proyecos_actividades = pado.findAll();

			for (Map<String, String> actividad:
				 proyecos_actividades) {

				Map<String, String> map = this.getTimeRemaining(actividad.get("entrega"));
				actividad.put("restante", map.get("time"));
			}

			return  proyecos_actividades;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Map<String, String> getTimeRemaining(String fecha_entrega) {
		Map<String, String> entrega = new HashMap<>();

		LocalDate fentrega = LocalDate.parse(fecha_entrega, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate current_date = LocalDate.now();

		Period period = Period.between(current_date, fentrega);

		short days = Short.parseShort(String.valueOf(period.getDays()));
		if (days < 0) {
			entrega.put("time", "0");
		} else {
			entrega.put("time", String.valueOf(days));
		}

		return entrega;
	}

	private  List<ProyectosActividades> crearLista(short id, String actividad, byte prioridad, byte estado, String entrega, short id_usuario, short id_proyecto){
		//crear la lista
		List<ProyectosActividades> list_tipo_usuario = new ArrayList<>();

		//Objeto
		ProyectosActividades tipo_usuario  = new ProyectosActividades(id, actividad, prioridad, estado, entrega, id_usuario, id_proyecto);

		//add to list
		list_tipo_usuario.add(tipo_usuario);

		return list_tipo_usuario;
	}

	private void doAction(List<ProyectosActividades> list, String action) {
		for (ProyectosActividades pa:
			 list) {
			try {
				switch (action) {
					case "save":
						pado.save(pa);
						break;
					case "update":
						pado.update(pa);
						break;
					case "delete":
						pado.delete(pa);
						break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
