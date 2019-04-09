package test;

import java.util.List;
import java.util.Iterator;
import java.util.Map;

import daoImp.UsuarioDaoImp;
import model.Usuario;

public class TestUsuario {
	private UsuarioDaoImp usua = new UsuarioDaoImp();
	private Usuario usuario = new Usuario();
	
	public void save() {
		 usuario.setNombres("Alberto Oscar");
		 
		 usuario.setApellidos("Chamuco Tobar");
		 
		 usuario.setEmail("asdfas@sadas.com");
		 
		 usuario.setUsername("JUan");
		 
		 usuario.setPassword("48520520");
		 
		 usuario.setId_tipo_usuario((byte) 2);
		 
		 try {
			 
			 UsuarioDaoImp usua = new UsuarioDaoImp();
			 
			 usua.saveUsuario(usuario);
			 
			 System.out.println("Dato guardado");
			 
		 } catch (Exception e) {
			 
			 System.out.println("Error al actualizar registros:" +e.getMessage());
		 }
	}
	
	public void update(short id) {
		 usuario.setId(id);
		 usuario.setNombres("juan camaney");
		 usuario.setApellidos("Galicia Merito");
		 usuario.setEmail("aaaaaa@YYY.com");
		 usuario.setUsername("username");
		 usuario.setPassword("11111111");
		 usuario.setId_tipo_usuario((byte) 1);
		 
		 
		 try {
			 
			 UsuarioDaoImp usua = new UsuarioDaoImp();
			 
			 usua.updateUsuario(usuario);
			 
			 System.out.println("Dato Modificado");
			 
		 } catch (Exception e) {
			 
			 System.out.println("Error al actualizar registros:" +e.getMessage());
		 }
	}
	
	public void delete() {
		
		 
	     usuario.setId((short) 22);
	     
		 try {
			 
		 UsuarioDaoImp usua = new UsuarioDaoImp();
		 
		 usua.deleteUsuario(usuario);
		 
	 } catch (Exception e) {
		 
		 System.out.println("Error al actualizar registros:" +e.getMessage());
	 }
		
	}
	
	public void findAll() {
		
		List<Map<String, String>> usuarios;

		try {
			usuarios = usua.findAllUsuario();

			if ( usuarios != null) {
				for (Map<String, String> usuario:
					usuarios) {
					Iterator it = usuario.keySet().iterator();

					while (it.hasNext()) {
						String key = (String) it.next();
						System.out.println("Clave: " + key + " -> Valor: " + usuario.get(key));
					}
					System.out.println("----------------------------------------------------------\n");
				}
			}
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
		
	}
}
