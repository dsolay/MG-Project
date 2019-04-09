package test;

import java.util.List;
import daoImp.TipodeusuarioDaoImp;
import modelo.Tipodeusuario;

public class TestTipoUsuario {
	private TipodeusuarioDaoImp tudi = new TipodeusuarioDaoImp();
	private Tipodeusuario tu = new Tipodeusuario();
	

	public void delete(byte id) {
		tu.setId(id);
		
		try {
			tudi.deleteTipodeusuario(tu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void save() {		
		tu.setTipo("hgfhgf");
		tu.setDescripcion("lhgutdhgfht");
		
		try {
			long flag = tudi.saveTipodeusuario(tu);
			
			if (flag == 1) {
				System.out.println("insertado");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void findAll() {
		try {
			List<Tipodeusuario> tipousuario = tudi.findAllTipodeusuarios();
			
			for (Tipodeusuario tipodeusuario : tipousuario) {
				System.out.println(tipodeusuario.getId() + " " + tipodeusuario.getTipo() + " " + tipodeusuario.getDescripcion());
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void update(byte id) {
		tu.setId(id);
		tu.setTipo("adninistrador");
		tu.setDescripcion("admin");
		
		try {
			tudi.updateTipodeusuario(tu);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static void main(String[] args) {
		TestTipoUsuario test = new TestTipoUsuario();
		
		// test.findAll();
		// test.delete((byte) 2);
		//test.update((byte) 2);

	}
}
