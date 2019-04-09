<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Eliminar datos </title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
				integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
				crossorigin="anonymous">
</head>
<body>
	<h1 class="text-center">Eliminar Tipo de usuarios</h1>
	<c:url value="/Tipodeususario" var="registerUrl" /> <!-- URL petición-->
	
	<form method="POST" action="${registerUrl}" class="col-6 offset-3">
	
			<c:forEach items="${datos}" var="tipodeususario">
                
                    <input type="hidden" name="option" value="delete">
                    
                    <input type="hidden" name="custId" value="${tipodeusuario.id}">
                    
                    <h1>¿Desea eliminar este usuario? :  ${Tipodeusuario.descripcion}</h1>           
                      
            </c:forEach>
               <input type="submit" class="col-4 offset-4 btn btn-outline-success" >
	</form>
</body>
</html>