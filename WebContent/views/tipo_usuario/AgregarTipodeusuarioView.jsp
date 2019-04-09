<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	</head>
	<body class ="container">
		<h1 class="tex-center">${mensaje}</h1>
	
		<c:url value="/Tipodeusuario" var="registerUrl"/> <!-- URL petición-->
		<form method="POST" action="${registerUrl}" class="col-6 offset-3">
		   <input type="hidden" name="option" value="add">
		
		  	<section class="form-group">
			    <label>Descripcion</label>
				<input type="text" name="descripcion" class="form-control">
		 	</section>
		 	
		   	<section class="form-group">
			    <label>Id</label>
				<input type="text" name="id" class="form-control">
		 	</section>
		 	
		    <section class="form-group">
			    <label>Tipo</label>
				<input type="text" name="id" class="form-control">
		    </section>
		    
		   	<input type="submit" class="col-4 offset-4 btn btn-outline-success" >
		</form>
    </body>
</html>
