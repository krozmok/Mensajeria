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
    private String aUsuario;
    private String aContraseña;
    private Conexion Con;
    

    public Login() {
    }

    public void setaUsuario(String aUsuario) {
        this.aUsuario = aUsuario;
    }

    public void setaContraseña(String aContraseña) {
        this.aContraseña = aContraseña;
    }

    public void setCon(Conexion Con) {
        this.Con = Con;
    }

  
    
    
    public boolean ValidarLogIn(){
        this.Con = new Conexion("BDMensajeria");
        Con.CrearConexion();
        BasicDBObject Datos = new BasicDBObject();
        Datos.put("Usuario",aUsuario);
        Datos.put("Contraseña", aContraseña);
        Cursor cur = Con.RecuperarDatos("Usuario", Datos);
        if (cur.hasNext()) {
            //Creamos un nuevo DBObject de manera que se actualizarán
            //las sesiones y el estado de conectado
            BasicDBObject update = new BasicDBObject();
            update.append("$inc", new BasicDBObject().append("Sesiones", 1));
            update.append("$set", new BasicDBObject().append("Conectado", true));
            
            Con.Update("Usuario", Datos, update);
            return true;
        }
        else
            return false;
    }
}
