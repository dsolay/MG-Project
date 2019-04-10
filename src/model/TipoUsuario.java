package model;

public class TipoUsuario {
    private byte id;
    private String tipo;
    private String descripcion;

    public TipoUsuario() { }

    public TipoUsuario(byte id, String tipo, String descripcion) {
        this.id = id;
        this.tipo = tipo;
        this.descripcion = descripcion;
    }

    public byte getId() {
        return id;
    }


    public void setId(byte id) {
        this.id = id;
    }


    public String getDescripcion() {
        return descripcion;
    }


    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    public String getTipo() {
        return tipo;
    }


    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
