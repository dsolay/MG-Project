<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="o" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	</head>
	
	<body class="container">
	
	<h1 class="tex-center"> ${mensaje} </h1>
	
	<o:url value="/Usuarios" var="registerUrl"/> <!-- URL peticion -->
	
	<form method="POST" action="${registerUrl}" class="col-6 offset-3">
	
		 <input type="hidden" name="option" value="add">
	
 		<section class="form-group"> 
 			<label>Nombres</label>
 			<input type="text" name="Nombres" class="form-control">
 		</section>
 			
 		<section class="form-group"> 
 			<label>Apellidos</label>
 			<input type="text" name="apellidos" class="form-control">
 		</section>		
 			
 		<section class="form-group"> 
 			<label>Email</label>
 			<input type="text" name="email" class="form-control">
 		</section>	
 			
 		<section class="form-group"> 
 			<label>Username</label>
 			<input type="text" name="username" class="form-control">
 		</section>	
 		
 		
 		<section class="form-group"> 
 			<label>Password</label>
 			<input type="text" name="password" class="form-control">
 		</section>	
 	
 	
 		<section class="form-group"> 
 			<label>id_tipo_usuario</label>
 			<input type="text" name="id_tipo_usuario" class="form-control">
 		</section>	
 		
 		<input type="submit" class="col-4 offset-4 btn btn-outline-success">
 	</form>
</body>
</html>
 
