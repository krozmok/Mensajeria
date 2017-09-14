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
public class CConexion {
    private String aDBName;
    private DBCollection aColeccion;
    private DBCursor aCursor;
    private DB aDB;
    protected MongoClient aMCliente;
    public CConexion(String DBName) {
        this.aDBName = DBName;
        CrearConexion();
    }
    
    public void CrearConexion(){
        aMCliente = new MongoClient("25.94.233.89",27017);
        aDB = aMCliente.getDB(aDBName);
        
    }
    public boolean ConsultarDatos(String CollectionName, BasicDBObject Datos){
        aColeccion = aDB.getCollection(CollectionName);
        aCursor = aColeccion.find(Datos);
        return aCursor.hasNext();
    }
    public DBCursor RecuperarDatos(String CollectionName, BasicDBObject Datos){
        aColeccion = aDB.getCollection(CollectionName);
        aCursor = aColeccion.find(Datos);
        return aCursor;
    }
    public void InsertarDatos(String CollectionName, BasicDBObject Datos){
        aColeccion = aDB.getCollection(CollectionName);
        aColeccion.insert(Datos);
    }
    public void Update(String CollectionName, BasicDBObject DatosViejos, BasicDBObject DatosNuevos)
    {
        aColeccion = aDB.getCollection(CollectionName);
        aColeccion.update(DatosViejos,DatosNuevos);
    }
}
