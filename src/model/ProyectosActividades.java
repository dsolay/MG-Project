package model;

public class ProyectosActividades {
    private short id;
    private String nombre;
    private byte prioridad;
    private byte estado;
    private String fecha_entrega;
    private short id_usuario;
    private short id_proyecto;

    public ProyectosActividades() {}

    public ProyectosActividades(short id, String nombre, byte prioridad, byte estado, String fecha_entrega, short id_usuario, short id_proyecto) {
        this.id = id;
        this.nombre = nombre;
        this.prioridad = prioridad;
        this.estado = estado;
        this.fecha_entrega = fecha_entrega;
        this.id_usuario = id_usuario;
        this.id_proyecto = id_proyecto;
    }

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
