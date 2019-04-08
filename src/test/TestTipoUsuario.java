package test;

import java.util.List;

import daoImp.TipodeusuarioDaoImp;
import model.Tipodeusuario;

public class TestTipoUsuario {
	private TipodeusuarioDaoImp tudi = new TipodeusuarioDaoImp();
	private Tipodeusuario tu = new Tipodeusuario();
	
	public void delete(byte id) {
		tu.setId(id);
		
		try {
			tudi.deleteTipodeusuario(tu);
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		TestTipoUsuario test = new TestTipoUsuario();
		
		// test.findAll();
		// test.delete((byte) 2);

	}

}
