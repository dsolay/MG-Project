package test;

import model.ProyectosActividades;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.*;

import daoImp.ProyectosActividadesDaoImp;

public class TestProyectosActividades {
	ProyectosActividadesDaoImp pado = new ProyectosActividadesDaoImp();
	ProyectosActividades pa = new ProyectosActividades();
	
    public void Save() {
    	pa.setNombre("actividad 2");
    	pa.setPrioridad((byte) 1);
    	pa.setEstado((byte) 1);
    	pa.setFecha_entrega("2019/06/20");
    	pa.setId_usuario((short) 1);
    	pa.setId_proyecto((short) 1);
    	
    	try {
			pado.save(pa);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }

    public void Update(short id) {
    	pa.setId(id);
    	pa.setNombre("test update");
    	pa.setPrioridad((byte) 2);
    	pa.setEstado((byte) 1);
    	pa.setFecha_entrega("2019/05/20");
		pa.setId_usuario((short) 1);
		pa.setId_proyecto((short) 3);
    	
    	try {
			System.out.println(pado.update(pa));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }

    public void Delete(short id) {
    	try {
			pado.delete(id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }

	public void find(Map<String, String> params, boolean filter) {
		List<Map<String, String>> actividades;

		try {
			actividades = pado.find(params, filter);

			if ( actividades != null) {
				for (Map<String, String> actividad:
						actividades) {
					Iterator it = actividad.keySet().iterator();

					while (it.hasNext()) {
						String key = (String) it.next();
						System.out.println("Clave: " + key + " -> Valor: " + actividad.get(key));
					}
					System.out.println("----------------------------------------------------------\n");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getNumRecords(String value, String project) {
    	try {
    		System.out.println(pado.getNumRecords(value, project));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getTimeRemaining(String fecha_entrega) {
		LocalDate fentrega = LocalDate.parse(fecha_entrega, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate current_date = LocalDate.now();

		Period period = Period.between(current_date, fentrega);

		return Integer.parseInt(String.valueOf(period.getDays()));
	}

    public static void main(String[] args) {
    	TestProyectosActividades test = new TestProyectosActividades();
    	
    	//test.FindAll((short) 0);

		Map<String, String> params = new HashMap<>();

		//params.put("field", "id");
		params.put("value", "");
		params.put("project", "2");
		params.put("order", "ASC");
		//params.put("limit", "0");
		//params.put("offset", "0");
		test.find(params, true);
    	
    	//test.Update((short) 24);
    	
    	// test.testSave();
    	
		// test.testDelete((short) 20);

		//test.getNumRecords("a");

		//System.out.println(test.getTimeRemaining("2019-04-23"));
    }
}
