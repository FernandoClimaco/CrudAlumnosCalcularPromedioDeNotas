<%-- 
    Document   : consultar
    Created on : 10-15-2020, 04:20:34 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar registros</title>
    </head>
    <body> 
        <form>
            <br><br><br>
        <center>
            
              <table border="1" style="width:580px">
                  <tr>
                      <td colspan="7"> Listado de ALUMNOS</td>
                      <td>
                          <a href="insertar.jsp">
                             <img src="Imagenes/nuevo.png" style="height:25px"> 
                          </a>
                      </td>
                  </tr>    
                <tr style="background:green ; color: yellow" align="center" >
                    <td> ID : </td>
                    <td> NUMERO DE LISTA: </td>
                    <td> NOMBRE: </td>
                    <td> MATERIA: </td>
                    <td> NOTA 1:  </td>
                    <td> NOTA 2: </td>
                    <td> PROMEDIO:  </td> 
                     <td> ACCION: </td>
                </tr>
              
        
        <%
            try{
         // referencia al driver
        Class.forName("com.mysql.jdbc.Driver"); 
        // inicializacion de las conexiones
        Connection myCon = null;
        PreparedStatement myStmt = null; 
        ResultSet myRs = null;
        // 1. preparar la cadena de conexion
       myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnosjsp","root","");
       //2. consulta preparada
       myStmt = myCon.prepareStatement("select * from alumnos ");
       // 3. asignar valores a los parametos:
       // 4. ejercutar consulta y recorrerla
       myRs = myStmt.executeQuery();
       while(myRs.next()){ 
        %>
        <tr align="center" >
                    <td> <%=myRs.getInt(1)%></td>
                    <td> <%=myRs.getInt(2)%></td>
                    <td> <%=myRs.getString(3)%></td>
                    <td> <%=myRs.getString(4)%></td>
                    <td> <%=myRs.getDouble(5)%></td>
                    <td> <%=myRs.getDouble(6)%></td>
                    <td> <%=myRs.getDouble(7)%></td>
                    <td>
                        <a href="editar.jsp?id=<%=myRs.getInt(1)%>"> 
                          <img src="Imagenes/editar.png" style="height:25px">
                        </a>
                                    //
                        <a href="eliminar.jsp?id=<%=myRs.getInt(1)%>"> 
                            <img src="Imagenes/eliminar.png" style="height:25px">
                        </a>
                    </td>
                  
                </tr>
            
            
        
        
        <%
        }
             }catch(Exception exc){
             exc.printStackTrace();
             }
        %>
           </table>
         </center>
        </form>
    </body>
</html>
