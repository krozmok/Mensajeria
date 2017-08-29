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
public class Conexion {
    private String DBName;
    private DBCollection coleccion;
    private DBCursor cursor;
    private DB db;
    protected MongoClient mCliente;
    public Conexion(String DBName) {
        this.DBName = DBName;
        CrearConexion();
    }
    
    public void CrearConexion(){
        mCliente = new MongoClient("127.0.0.1",27017);
        db = mCliente.getDB(DBName);
        
    }
    public boolean ConsultarDatos(String CollectionName, BasicDBObject Datos){
        coleccion = db.getCollection(CollectionName);
        cursor = coleccion.find(Datos);
        return cursor.hasNext();
    }
    public DBCursor RecuperarDatos(String CollectionName, BasicDBObject Datos){
        coleccion = db.getCollection(CollectionName);
        cursor = coleccion.find(Datos);
        return cursor;
    }
    public void InsertarDatos(String CollectionName, BasicDBObject Datos){
        coleccion = db.getCollection(CollectionName);
        coleccion.insert(Datos);
    }
}
