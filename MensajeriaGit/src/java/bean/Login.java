/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import com.mongodb.*;

/**
 *
 * @author Paul
 */
public class Login {
    private String Usuario;
    private String Contraseña;
    private Conexion Con;

    public Login(String Usuario, String Contraseña) {
        this.Usuario = Usuario;
        this.Contraseña = Contraseña;
        this.Con = new Conexion("BDMensajeria");
        Con.CrearConexion();
    }

    public String getUsuario() {
        return Usuario;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }
    
    @Override
    public String toString(){
        return Usuario + "#" + Contraseña;
    }
    
    public boolean ValidarLogIn(){
        BasicDBObject Datos = new BasicDBObject();
        Datos.put("Usuario",Usuario);
        Datos.put("Contraseña", Datos);
        return Con.ConsultarDatos("Usuario", Datos);
    }
}
