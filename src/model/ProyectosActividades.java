package model;

public class ProyectosActividades {
    private short id;
    private String nombre;
    private byte prioridad;
    private byte estado;
    private String fecha_creacion;
    private String fecha_entrega;
    private short id_usuario;
    private short id_proyecto;

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public byte getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(byte prioridad) {
        this.prioridad = prioridad;
    }

    public byte getEstado() {
        return estado;
    }

    public void setEstado(byte estado) {
        this.estado = estado;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public String getFecha_entrega() {
        return fecha_entrega;
    }

    public void setFecha_entrega(String fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }

    public short getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(short id_usuario) {
        this.id_usuario = id_usuario;
    }

    public short getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(short id_proyecto) {
        this.id_proyecto = id_proyecto;
    }
}
