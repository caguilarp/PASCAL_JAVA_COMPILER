/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador_pascal;

/**
 *
 * @author Fredy Zamora
 */

import java.util.*;

/**
 *
 * @author Fredy Zamora
 */
public class TablaSimbolos {
    HashMap t;
    
    public TablaSimbolos(){
        t= new HashMap();
    }
    public Simbolo insertar(String nombre){
        Simbolo s= new Simbolo(nombre, new Double(0));
        t.put(nombre, s);
        return s;
                }    
    public Simbolo buscar (String nombre){
        return (Simbolo)(t.get(nombre));
        
    }
    public void imprimir(){
               
        Iterator it= t.values().iterator();
   
        while(it.hasNext()){
       
          Simbolo s=(Simbolo)it.next();
      System.out.println(s.nombre + " ="+ s.valor);
        }
          System.out.println("-------Tabla de Simbolos-------");
          
        }
 
        }