package test;

import dao.ProyectosDao;
import daoImp.ProyectosDaoImp;
import model.Proyectos;

public class TestProyectos {
	Proyectos po = new Proyectos();
	ProyectosDaoImp pdi = new ProyectosDaoImp();

	
	public void update() throws Exception {	
		
	po.setNombre_proyecto("lenguaje");	
	po.setDescripcion("ver si pasa la paes");
	po.setId_usuario((short)1);
	
	pdi.updateProyectos(po);
	
	 	
	}

	public static void main(String[] args) {
		TestProyectos test = new TestProyectos();
		
		try {
			test.update();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
