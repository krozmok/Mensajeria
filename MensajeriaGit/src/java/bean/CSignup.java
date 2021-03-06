/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import com.mongodb.BasicDBObject;
import com.mongodb.*;
import java.util.Date;

/**
 *
 * @author Paul
 */
public class CSignup {
    private String aNombre;
    private String aUsuario;
    private String aFechaNacimiento;
    private String aSexo;
    private String aContrasena;
    private String aPreguntaSecreta;
    private String aRespuesta;
    private CConexion aBDCon;
    private int Sesiones = 0;
    private boolean Conectado = false;

    public CSignup() {
    }

    public String getaNombre() {
        return aNombre;
    }

    public String getaUsuario() {
        return aUsuario;
    }

    public String getaFechaNacimiento() {
        return aFechaNacimiento;
    }

    public String getaSexo() {
        return aSexo;
    }

    public String getaContrasena() {
        return aContrasena;
    }

    public String getaPreguntaSecreta() {
        return aPreguntaSecreta;
    }

    public String getaRespuesta() {
        return aRespuesta;
    }

    public CConexion getaBDCon() {
        return aBDCon;
    }

    public void setaNombre(String aNombre) {
        this.aNombre = aNombre;
    }

    public void setaUsuario(String aUsuario) {
        this.aUsuario = aUsuario;
    }

    public void setaFechaNacimiento(String aFechaNacimiento) {
        this.aFechaNacimiento = aFechaNacimiento;
    }

    public void setaSexo(String aSexo) {
        this.aSexo = aSexo;
    }

    public void setaContrasena(String aContrasena) {
        this.aContrasena = aContrasena;
    }

    public void setaPreguntaSecreta(String aPreguntaSecreta) {
        this.aPreguntaSecreta = aPreguntaSecreta;
    }

    public void setaRespuesta(String aRespuesta) {
        this.aRespuesta = aRespuesta;
    }

    public void setaBDCon(CConexion aBDCon) {
        this.aBDCon = aBDCon;
    }

    public void Insertar(){
        this.aBDCon = new CConexion("BDMensajeria");
        BasicDBObject Query = new BasicDBObject();
        Query.put("Usuario", this.aUsuario);
        DBCursor C = aBDCon.RecuperarDatos("Usuario",Query);
        if(!C.hasNext()){
        
        BasicDBObject Documento = new BasicDBObject();
        Documento.put("Nombre", this.aNombre);
        Documento.put("Usuario", this.aUsuario);
        Documento.put("FechaNacimiento", this.aFechaNacimiento);
        Documento.put("Sexo", this.aSexo);
        Documento.put("Contraseña", this.aContrasena);
        Documento.put("PreguntaSecreta", this.aPreguntaSecreta);
        Documento.put("Respuesta", this.aRespuesta);
        Documento.put("Sesiones",this.Sesiones);
        Documento.put("Conectado",this.Conectado);
        this.aBDCon.InsertarDatos("Usuario", Documento);
        }
    }
}
