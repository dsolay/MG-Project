<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="text-center"> Eliminar Usuarios </h1>
         <c:url value="/Usuarios" var="registerUrl" /> <!-- URL petición-->
         
         <form method="POST" action="${registerUrl}" class="col-6 offset-3">
         
                <c:forEach items="${datos}" var="usuarios">
                
                    <input type="hidden" name="option" value="delete">
                    
                    <input type="hidden" name="evaid" value="${usuarios.id}">
                    
                    <h1>¿Desea eliminar este usuario? :  ${usuarios.nombre}</h1>           
                      
                </c:forEach>
                 <input type="submit" class="col-4 offset-4 btn btn-outline-success" >
        </form>
    </body>
</html>