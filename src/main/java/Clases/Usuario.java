package Clases;

public class Usuario {
    private int Id_Rol;
    private String Nombre_Usuario;
    private String Apellido_Usuario;
    private String TipoDocumento_Usuario;
    private String DocumentoIdentidad_Usuario;
    private String CorreoElectronico_Usuario;
    private String Contrasena_Usuario;
    private boolean Estado_Usuario;
    private String Codigo;
    
    public Usuario(){}

    public Usuario(int Id_Rol, String Nombre_Usuario, String Apellido_Usuario, String TipoDocumento_Usuario, String DocumentoIdentidad_Usuario, String CorreoElectronico_Usuario, String Contrasena_Usuario, String Codigo) {
        this.Id_Rol = Id_Rol;
        this.Nombre_Usuario = Nombre_Usuario;
        this.Apellido_Usuario = Apellido_Usuario;
        this.TipoDocumento_Usuario = TipoDocumento_Usuario;
        this.DocumentoIdentidad_Usuario = DocumentoIdentidad_Usuario;
        this.CorreoElectronico_Usuario = CorreoElectronico_Usuario;
        this.Contrasena_Usuario = Contrasena_Usuario;
        this.Codigo = Codigo;
    }

    public Usuario(int Id_Rol, String Nombre_Usuario, String Apellido_Usuario, String TipoDocumento_Usuario, String DocumentoIdentidad_Usuario, String CorreoElectronico_Usuario, String Contrasena_Usuario, boolean Estado_Usuario, String Codigo) {
        this.Id_Rol = Id_Rol;
        this.Nombre_Usuario = Nombre_Usuario;
        this.Apellido_Usuario = Apellido_Usuario;
        this.TipoDocumento_Usuario = TipoDocumento_Usuario;
        this.DocumentoIdentidad_Usuario = DocumentoIdentidad_Usuario;
        this.CorreoElectronico_Usuario = CorreoElectronico_Usuario;
        this.Contrasena_Usuario = Contrasena_Usuario;
        this.Estado_Usuario = Estado_Usuario;
        this.Codigo = Codigo;
    }

    public void setId_Rol(int Id_Rol) {
        this.Id_Rol = Id_Rol;
    }

    public void setNombre_Usuario(String Nombre_Usuario) {
        this.Nombre_Usuario = Nombre_Usuario;
    }

    public void setApellido_Usuario(String Apellido_Usuario) {
        this.Apellido_Usuario = Apellido_Usuario;
    }

    public void setTipoDocumento_Usuario(String TipoDocumento_Usuario) {
        this.TipoDocumento_Usuario = TipoDocumento_Usuario;
    }

    public void setDocumentoIdentidad_Usuario(String DocumentoIdentidad_Usuario) {
        this.DocumentoIdentidad_Usuario = DocumentoIdentidad_Usuario;
    }

    public void setCorreoElectronico_Usuario(String CorreoElectronico_Usuario) {
        this.CorreoElectronico_Usuario = CorreoElectronico_Usuario;
    }

    public void setContrasena_Usuario(String Contrasena_Usuario) {
        this.Contrasena_Usuario = Contrasena_Usuario;
    }

    public void setEstado_Usuario(boolean Estado_Usuario) {
        this.Estado_Usuario = Estado_Usuario;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public int getId_Rol() {
        return this.Id_Rol;
    }

    public String getNombre_Usuario() {
        return this.Nombre_Usuario;
    }

    public String getApellido_Usuario() {
        return this.Apellido_Usuario;
    }

    public String getTipoDocumento_Usuario() {
        return this.TipoDocumento_Usuario;
    }

    public String getDocumentoIdentidad_Usuario() {
        return this.DocumentoIdentidad_Usuario;
    }

    public String getCorreoElectronico_Usuario() {
        return this.CorreoElectronico_Usuario;
    }

    public String getContrasena_Usuario() {
        return this.Contrasena_Usuario;
    }

    public boolean isEstado_Usuario() {
        return this.Estado_Usuario;
    }

    public String getCodigo() {
        return this.Codigo;
    }
    
}
