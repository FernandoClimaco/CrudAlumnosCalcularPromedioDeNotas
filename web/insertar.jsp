<%-- 
    Document   : consultar
    Created on : 10-15-2020, 04:07:59 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
    </head>
    <body>
        <form action="">
            <center>
                 <b><br><br>
                <h1>Registros de Alumnos </h1>
               <table>
                   
                   <tr>
                       <td>Numero de lista: </td>
                       <td> <input type="text" name="numeroLista" placeholder="Ingresar numero de lista"> </td>
                   </tr>
                   
                   <tr>
                       <td>Nombre :</td>
                       <td> <input type="text" name="nombre" placeholder="Ingresar nombre"> </td>
                   </tr>
                   
                   
                   <tr>
                       <td>Materia:</td>
                       <td> <input type="text" name="materia" placeholder="Ingresar materia"> </td>
                   </tr>
                   
                   
                   <tr>
                       <td>Nota 1:</td>
                       <td> <input type="text" name="n1" placeholder="Ingresar nota 1"> </td>
                   </tr>
                   
                   
                   <tr>
                       <td>Nota 2 :</td>
                       <td> <input type="text" name="n2" placeholder="Ingresar nota 2"></td>
                   </tr>
                   
                   
                   <tr>
                       <td colspan="2"> <input type="submit" name="btnInsertar" value="Insertar datos"></td>
                   </tr>
                   
                   
               </table>
            </center>
            
            
            <%
              if(request.getParameter("btnInsertar")!= null){
            int nLista = Integer.parseInt(request.getParameter("numeroLista"));
            String nombre =  request.getParameter("nombre");
            String materia = request.getParameter("materia");
            double nota1 = Double.parseDouble(request.getParameter("n1"));
            double nota2 = Double.parseDouble(request.getParameter("n2"));
            double promedio = (nota1+nota2)/2 ;
            int i = 0;
             // ref. el driver de conexion
             Class.forName("com.mysql.jdbc.Driver");
             try{
                 // 1. obteniendo la cadena de conexion
                 Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnosjsp","root","");
                 // 2. preparar consulta
                 PreparedStatement myStmt = myCon.prepareStatement("insert into alumnos values(?,?,?,?,?,?,?)");
                 // 3.Asignar valores a los parametros
                 myStmt.setInt(1,i);
                 myStmt.setInt(2,nLista);
                 myStmt.setString(3,nombre);
                 myStmt.setString(4,materia);
                 myStmt.setDouble(5,nota1);
                 myStmt.setDouble(6,nota2);
                 myStmt.setDouble(7,promedio);
                 // 4. Ejecutar consulta:
                 myStmt.executeUpdate();
                 out.println("Los datos se han insertados");
                 request.getRequestDispatcher("consultar.jsp").forward(request, response);
             
             }catch(Exception exc){
             exc.printStackTrace();
             }
             }
            %>
        </form>
    </body>
</html>
