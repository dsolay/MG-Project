package model;

public class Proyectos {

    public Proyectos() {


    }

    private short id;
    private String nombre_proyecto;
    private String descripcion;
    private short id_usuario;


    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getNombre_proyecto() {
        return nombre_proyecto;
    }

    public void setNombre_proyecto(String nombre_proyecto) {
        this.nombre_proyecto = nombre_proyecto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public short getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(short id_usuario) {
        this.id_usuario = id_usuario;
    }
}

