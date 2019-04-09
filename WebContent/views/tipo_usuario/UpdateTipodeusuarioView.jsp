<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	</head>
<body class="container">
     <h1 class="text-center">Actualizar Tipo  de  usuario</h1>
     <c:url value="/Tipodeusuario" var="registerUrl" />
     <form method="POST" action="${datos}" class="col-6 offset-3">
          <c:forEach items="${datos}" var="tipousuario">
            <input type="hidden" name="option" value="update">
            <input type="hidden" name="TipoId" value="${tipodeusuario.id }">
          <section class="form-group">
               <label> Descripcion</label>
          <input type="text" name="descripcion" class="form-control" value="${tipodeusuario.descripcion}">
                    </section>            
                    <section class="form-group">
                            <label> Id:</label>
                            <input type="text" name="id" class="form-control" value="${tipodeusuario.id}">
                    </section>
                    <section class="form-group">
                            <label> Tipo:</label>
                            <input type="text" name="tipo" class="form-control" value="${tipodeusuario.tipo}">
                    </section>
             
                      <h1></h1>
                  </c:forEach>
                    <input type="submit" class="col-4 offset-4 btn btn-outline-success" >
       
            </form>
         </body> 
    </html>        
            
