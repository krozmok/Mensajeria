/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;

/**
 *
 * @author Paul
 */
public class Signup {
    private String Nombre;
    private Date FechaNacimiento;
    private String Sexo;
    private String Constraseña;
    private String PreguntaSecreta;
    private String Respuesta;

    public Signup(String Nombre, Date FechaNacimiento, String Sexo, String Constraseña, String PreguntaSecreta, String Respuesta) {
        this.Nombre = Nombre;
        this.FechaNacimiento = FechaNacimiento;
        this.Sexo = Sexo;
        this.Constraseña = Constraseña;
        this.PreguntaSecreta = PreguntaSecreta;
        this.Respuesta = Respuesta;
    }
    
    
    
    
}
