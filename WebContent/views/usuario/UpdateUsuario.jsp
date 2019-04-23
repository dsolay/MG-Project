<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    </head>
    <body class="container">
         <h1 class="text-center"> Actualizar Evaluacion </h1>
         <c:url value="/Evaluacion" var="registerUrl" /> <!-- URL petición-->
         <form method="POST" action="${registerUrl}" class="col-6 offset-3">
         		<input type="hidden" name="redirect" value="false">
                <c:forEach items="${datos}" var="evaluacion">
                    <input type="hidden" name="option" value="update">
                    <input type="hidden" name="evaid" value="${evaluacion.id}">
                    <section class="form-group">
                        <label> Nombres: </label>
                        <input type="text" name="nombres" class="form-control" value="${usuario.nombre}">
                    </section>  
                              
                    <section class="form-group">
                            <label> Apellidos:</label>
                            <input type="text" name="apellidos" class="form-control" value="${usuario.nota}">
                    </section>
                    
                    <section class="form-group">
                            <label> Email:</label>
                            <input type="text" name="email" class="form-control" value="${usuario.instructor}">
                    </section>
                    
                     <section class="form-group">
                            <label> Username:</label>
                            <input type="text" name="username" class="form-control" value="${usuario.fecha}">
                    </section>
                    
                     <section class="form-group">
                            <label> Password:</label>
                            <input type="text" name="password" class="form-control" value="${usuario.fecha}">
                    </section>
                    
                     <section class="form-group">
                            <label> Id_tipo_usuario:</label>
                            <input type="text" name="id_tipo_usuario" class="form-control" value="${usuario.fecha}">
                    </section>

                   <h1></h1>
                </c:forEach>
                 <input type="submit" class="col-4 offset-4 btn btn-outline-success" >
        </form>
    </body>
</html>