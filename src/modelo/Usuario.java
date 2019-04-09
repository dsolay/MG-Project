package modelo;

public class Usuario {
	
	//Declaracion de Atributos
	
	private short id ;
	
	private String nombres;
	
	private String apellidos;
	
	private String email;
	
	private String username;
	
	private String password;
	
	private byte id_tipo_usuario;
	
	//Constructor vacio
	
	public Usuario () {
		
	}

	public short getId() {
		return id;
	}

	public void setId(short id) {
		this.id = id;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public byte getId_tipo_usuario() {
		return id_tipo_usuario;
	}

	public void setId_tipo_usuario(byte id_tipo_usuario) {
		this.id_tipo_usuario = id_tipo_usuario;
	}

	
	

}
