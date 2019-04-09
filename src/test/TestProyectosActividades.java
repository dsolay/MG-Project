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
	
    public void testSave() {
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

    public void testUpdate(short id) {
    	pa.setId(id);
    	pa.setNombre("actividad 1");
    	pa.setPrioridad((byte) 2);
    	pa.setEstado((byte) 1);
    	pa.setFecha_entrega("2019/05/20");
    	
    	try {
			pado.update(pa);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }

    public void testDelete(short id) {
    	pa.setId(id);
    	
    	try {
			pado.delete(pa);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }

    public void testFindAll() {
		List<Map<String, String>> actividades;

		try {
			actividades = pado.findAll();

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
			System.out.println("Error: " + e.getMessage());
		}
    }

	/*public Map<String, String> getTimeRemaining(String fecha_entrega) {
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
			units = (days > 1 ) ? "días" : "día";
		}

		entrega.put("units", units);
		entrega.put("time", time);

		return entrega;
	}*/

    public static void main(String[] args) {
    	TestProyectosActividades test = new TestProyectosActividades();
    	
    	//test.testFindAll();
    	
    	// test.testUpdate((short) 20);
    	
    	// test.testSave();
    	
    	 // test.testDelete((short) 20);

		/*Map<String, String> testf = test.getTimeRemaining("2018-06-08");

		Iterator it = testf.keySet().iterator();

		while (it.hasNext()) {
			String key = (String) it.next();
			System.out.println("Clave: " + key + " -> Valor: " + testf.get(key));
		}
		System.out.println("----------------------------------------------------------\n");*/
    }
}
