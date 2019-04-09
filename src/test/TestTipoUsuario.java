package test;

import daoImp.TipodeusuarioDaoImp;
import modelo.Tipodeusuario;

public class TestTipoUsuario {
	private TipodeusuarioDaoImp tudi = new TipodeusuarioDaoImp();
	private Tipodeusuario tu = new Tipodeusuario();
	
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
	
	public void delete() {
		TestTipoUsuario test = new TestTipoUsuario();
	}
	
	public void findAll() {
		TestTipoUsuario test = new TestTipoUsuario();
	}
	
	public static void main(String[] args) {
		TestTipoUsuario test = new TestTipoUsuario();
		
		// test.save();
		
		test.update((byte) 2);
	}
}
