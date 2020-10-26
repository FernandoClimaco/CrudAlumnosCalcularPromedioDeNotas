<%-- 
    Document   : eliminar
    Created on : 10-15-2020, 07:10:23 PM
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
         //   try{
            // obtener el ID desde la base de datos desde el formulario consultar.jsp
            int idid = Integer.parseInt(request.getParameter("id"));
            // ref. al driver:
            Class.forName("com.mysql.jdbc.Driver");
            // 1. obtener la cadena de conexion:
            Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnosjsp","root","");
            // 2. preparar consulta:
            PreparedStatement myStmt = myCon.prepareStatement(" delete from alumnos where id=? ");
            // 3. valor a mi parametro
            myStmt.setInt(1,idid);
            // 4. ejecutar consulta:
            myStmt.executeUpdate();
            out.println("Datos eliminados");
            request.getRequestDispatcher("consultar.jsp").forward(request,response);
             
          /*  }catch(Exception exc){
            exc.printStackTrace();
            }
        */
        %>
        
    </body>
</html>
