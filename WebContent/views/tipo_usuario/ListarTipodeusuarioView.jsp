<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!DOCTYPE html>
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Servlet, JSP and JDBC CRUD Operations</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<title>Insert title here</title>
</head>

<body class="container">
	<h1 class="text-center">Listado De Tipo De Usuarios</h1>
	<table class="table table-striped text-center">
	<tr>
		<th>ID</th>
		<th>Descripcion</th>
		<th>Tipo</th>
	</tr>
	<c:forEach items="${tipodeusuarioList}" var="tipodeusuario">
	<tr>
		<td>${tipodeusuario.id }</td>
		<td>${tipodeusuario.descripcion }</td>
		<td>
		<form action="<c:url value="/Tipodeusuario"/>" method="POST">
                                            <input type="hidden" name="redirect" value="true"><!-- input oculto -->
                                            <input type="hidden" name="option" value="delete"><!-- input oculto -->
						                    <input type="hidden" name="custId" value="${tipodeusuario.id}"><!-- input oculto -->
                                            <input type="hidden" name="descripcion" value="${tipodeusuario.descripcion}"><!-- input oculto -->
								   			<input type="submit" value="Delete" class="btn btn-outline-danger">
					</form>
				</td>
				<td>
					<form action="<c:url value="/Tipodeusuario"/>" method="POST">
                                             <input type="hidden" name="redirect" value="true"><!-- input oculto -->
                                             <input type="hidden" name="option" value="update"><!-- input oculto -->
                                             <input type="hidden" name="custId" value="${tipodeusuario.id}"><!-- input oculto -->
                                             <input type="hidden" name="descripcion" value="${tipodeusuario.descripcion}"><!-- input oculto -->
                                             <input type="hidden" name="tipo" value="${tipodeusuario.tipo }"><!-- input oculto -->
                                             <input type="submit" value="Update" class="btn btn-outline-success">
					</form>
				</td>
				
			</tr>
		</c:forEach>
	</table>

</body>
</html>