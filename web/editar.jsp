<%-- 
    Document   : editar
    Created on : 10-15-2020, 06:05:55 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
      <%
      // obteniendo el ID desde la base de datos del formulario consultar.jsp
      int id = Integer.parseInt(request.getParameter("id"));
      try{
            // ref.al driver:
            Class.forName("com.mysql.jdbc.Driver");
            // 1. obteniendo la cadena de conexion
            Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnosjsp","root","");
            // 2. consulta preparada
            PreparedStatement myStmt = myCon.prepareStatement("select * from alumnos where id= ?");
            //  3. valor a los parametros:
            myStmt.setInt(1,id);
            // 4. ejecutar consulta y recorrerla
            ResultSet myRs = myStmt.executeQuery();
            while( myRs.next()){
      
      %>
        
        <form>
            <center>
                 <b><br><br>
                <h1>Editar  Alumnos </h1>
               <table>
                   
                    <tr>
                       <td>ID: </td>
                       <td> <input type="text" name="id"  readonly="readonly" value="<%=myRs.getInt(1)%>"> </td>
                   </tr>
                   
                   <tr>
                       <td>Numero de lista: </td>
                       <td> <input type="text" name="numeroLista" value="<%=myRs.getInt(2)%>"  > </td>
                   </tr>
                   
                   <tr>
                       <td>Nombre :</td>
                       <td> <input type="text" name="nombre" value="<%=myRs.getString(3)%>" > </td>
                   </tr>
                   
                   
                   <tr>
                       <td>Materia:</td>
                       <td> <input type="text" name="materia" value="<%=myRs.getString(4)%>" > </td>
                   </tr>
                  
                   
                   <tr>
                       <td>Nota 1:</td>
                       <td> <input type="text" name="n1" value="<%=myRs.getDouble(5)%>" > </td>
                   </tr>
                   
                   
                   <tr>
                       <td>Nota 2 :</td>
                       <td> <input type="text" name="n2"  value="<%=myRs.getDouble(6)%>" ></td>
                   </tr>
                   
                   <tr>
                       <td>Promedio :</td>
                       <td> <input type="text" name="promedio" readonly="readonly" value="<%=myRs.getDouble(7)%>" ></td>
                   </tr>
                   
                   
                   
                   <tr>
                       <td colspan="2"> <input type="submit" name="btnEditar" value="Editar datos"></td>
                   </tr>
                   
                   
               </table>
            </center> 
          </form>  
        
        <%
        } // fin del while
          }catch(Exception exc){
                exc.printStackTrace();
         }
        %>
        
        
        <%
            if(request.getParameter("btnEditar")!=null){
            try{
                // obteniendo los valores:
                int idid = Integer.parseInt(request.getParameter("id"));
                int nLista = Integer.parseInt(request.getParameter("numeroLista"));
                String nombre = request.getParameter("nombre");
                String materia = request.getParameter("materia");
                Double n1 = Double.parseDouble(request.getParameter("n1"));
                Double n2 = Double.parseDouble(request.getParameter("n2"));
                double promedio = (n1+n2)/2;
                
                // ref. al driver:
                Class.forName("com.mysql.jdbc.Driver");
                // 1. cadena de conexion
                  Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnosjsp","root","");
               // 2. consulta preparada
               PreparedStatement myStmt = myCon.prepareStatement("update alumnos set numeroLista=?,nombre=?,materia=?,nota1=?,nota2=?,promedio=? where id=?");
               //3. pasar valor a los parametros
              
               myStmt.setInt(1,nLista);
               myStmt.setString(2,nombre);
               myStmt.setString(3,materia);
               myStmt.setDouble(4,n1);
               myStmt.setDouble(5,n2);
               myStmt.setDouble(6,promedio);
                myStmt.setInt(7,idid);
               // 4 ejecutar consulta:
               myStmt.executeUpdate();
               out.println("Los datos se han modificado");
               request.getRequestDispatcher("consultar.jsp").forward(request, response);
               
            }catch(Exception exc){
            exc.printStackTrace();
            }
            } // fin del if.
        %>
        
        
        
        
        
    </body>
</html>
