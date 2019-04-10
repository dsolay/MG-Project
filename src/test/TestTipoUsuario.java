package test;

import daoImp.TipoUsuarioDaoImp;
import model.TipoUsuario;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class TestTipoUsuario {
	private TipoUsuarioDaoImp tudi = new TipoUsuarioDaoImp();
	private TipoUsuario tu = new TipoUsuario();

	public void delete(byte id) {
		tu.setId(id);
		
		try {
			tudi.delete(tu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void save() {		
		tu.setTipo("guest");
		tu.setDescripcion("usuario invitado");
		
		try {
			tudi.save(tu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void findAll() {
		List<Map<String, String>> tipos_usuarios;

		try {
			tipos_usuarios = tudi.findAll();

			if ( tipos_usuarios != null) {
				for (Map<String, String> tipo_usuario:
						tipos_usuarios) {
					Iterator it = tipo_usuario.keySet().iterator();

					while (it.hasNext()) {
						String key = (String) it.next();
						System.out.println("Clave: " + key + " -> Valor: " + tipo_usuario.get(key));
					}
					System.out.println("----------------------------------------------------------\n");
				}
			}
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}

	public void update(byte id) {
		tu.setId(id);
		tu.setTipo("admin");
		tu.setDescripcion("usuario con todos los privilegios");
		
		try {
			tudi.update(tu);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static void main(String[] args) {
		TestTipoUsuario test = new TestTipoUsuario();
		
		//test.save();
		//test.update((byte) 4);
		//test.delete((byte) 4);
		test.findAll();
	}
}
