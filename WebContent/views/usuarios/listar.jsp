<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<title>Base De DATOS</title>

</head>

<body class = "container">
 		<h1 class= "text-center">Listada de Usuarios</h1>
 
 		<table class="table table-striped text-center">
 <tr>
 			<th>ID</th>
 			<th>Nombres</th>
 			<th>Apellidos</th>
 			<th>Email</th>
 			<th>Username</th> 
 			<th>Password</th>
 			<th>id_tipo_usuario</th>
 			<td>Update</td>
 			<td>Agregar</td>
		</tr>
 
 		<c:forEach items ="${usuarioList}" var = "usuario"> 
 		
 			<tr>
 	
 				<td>${usuario.id}</td>
 				<td>${usuario.nombres}</td>
 				<td>${usuario.apellidos}</td>
 				<td>${usuario.email}</td>
 				<td>${usuario.username}</td>
 				<td>${usuario.password}</td>
 				<td>${usuario.id_tipo_usuario}</td>
 	   			<td>
					<form action="<c:url value="/Usuario"/>" method="POST">
                                                 <input type="hidden" name="redirect" value="true"><!-- input oculto -->
                                                 <input type="hidden" name="option" value="delete"><!-- input oculto -->
						                         <input type="hidden" name="usuari" value="${usuario.id}"><!-- input oculto -->
                                                <input type="hidden" name="nombre" value="${usuario.nombre}"><!-- input oculto -->
						<input  type="submit" value="Delete" class="btn btn-outline-danger">
					</form>
				</td>
				<td>
					<form action="<c:url value="/Usuario"/>" method="POST">
                                            <input type="hidden" name="redirect" value="true"><!-- input oculto -->
                                            <input type="hidden" name="option" value="update"><!-- input oculto -->
                                            <input type="hidden" name="usuari" value="${usuario.id}"><!-- input oculto -->
                                            <input type="hidden" name="nombres" value="${usuario.nombres}"><!-- input oculto -->
                                            <input type="hidden" name="apellidos" value="${usuario.apellidos}"><!-- input oculto -->
					                        <input type="hidden" name="usuario" value="${usuario.email}"><!-- input oculto -->
                                            <input type="hidden" name="username" value="${usuario.username}"><!-- input oculto -->
                                            <input type="submit" value="text" class="btn btn-outline-success">
                                            <input type="hidden" name="password" value="${usuario.password}">
                                            <input type="hidden" name="id_tipo_usuario" value="${usuario.id_tipo_usuario}">
                                            
					</form>
				<td>
 			</tr>	
 		</c:forEach>
 
	 </table>
 
</body>
</html>