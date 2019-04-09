package test;

import java.awt.List;

import daoImp.UsuarioDaoImp;
import modelo.Usuario;

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
		
		UsuarioDaoImp usuarioDaoImp = new UsuarioDaoImp();
		
		 try {
			 
			List listaUsuario = usuarioDaoImp.findAllUsuario();
			 //for each
			 for(Usuario elementosUsuario: listaUsuario) {
				 
				 System.out.print("ID: "+elementosUsuario.getId());
				 System.out.print("nombres: "+elementosUsuario.getNombres()+" ");
				 System.out.print("nota: "+elementosUsuario.getApellidos()+" ");
				 System.out.print("instructor: "+elementosUsuario.getEmail()+" ");
				 System.out.println("fecha: "+elementosUsuario.getUsername()+" "); 	 
			 }
		} catch (Exception e) {
			 System.out.println("Error al listar datos");
            
		}
		
	}
}
