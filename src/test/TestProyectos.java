package test;

import daoImp.ProyectosDaoImp;
import model.Proyectos;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class TestProyectos {
	Proyectos po = new Proyectos();
	ProyectosDaoImp pdi = new ProyectosDaoImp();

	public void save() {
		po.setNombre_proyecto("matematica");
		po.setDescripcion("integrales multiples");
		po.setId_usuario((short) 2);

		try {
			pdi.save(po);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(short id) {

		po.setId(id);
		po.setNombre_proyecto("lenguaje");
		po.setDescripcion("ver si pasa la paes");
		po.setId_usuario((short)1);

		try {
			pdi.update(po);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(short id) {
		po.setId(id);

		try {
			pdi.delete(po);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void findAll(){
		List<Map<String, String>> proyectos;

		try {
			proyectos = pdi.findAll();

			if ( proyectos != null) {
				for (Map<String, String> proyecto:
						proyectos) {
					Iterator it = proyecto.keySet().iterator();

					while (it.hasNext()) {
						String key = (String) it.next();
						System.out.println("Clave: " + key + " -> Valor: " + proyecto.get(key));
					}
					System.out.println("----------------------------------------------------------\n");
				}
			}
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void find(String filed, String value) {
		try {
			List<Proyectos> listProyecto = pdi.find(filed, value);

			for (Proyectos proyecto:
					listProyecto) {

				System.out.println("id -> " + proyecto.getId());
				System.out.println("nombre -> " + proyecto.getNombre_proyecto());
				System.out.println("descripcion -> " + proyecto.getDescripcion());
				System.out.println("id_usuario -> " + proyecto.getId_usuario());

				System.out.println("----------------------------------------------------------\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		TestProyectos test = new TestProyectos();
		
		//test.save();

		//test.update((short) 21);

		//test.delete((short) 21);

		//test.findAll();

		test.find("nombre_proyecto", "Daltfresh");
	}

}
