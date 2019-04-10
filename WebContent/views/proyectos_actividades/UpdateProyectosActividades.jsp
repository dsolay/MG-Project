<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="daoImp.ProyectosActividadesDaoImp" %>
<%@ page import="daoImp.UsuarioDaoImp" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/8/19
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="Cc" uri="http://java.sun.com/jsp/jstl/core" %>

<%--header--%>
<jsp:include page="../components/header.jsp"/>


<h1 class="text-center"> Actualizar Proyecto </h1>
 
<c:url value="/ProyectosActividades" var="registerUrl" />

<c:set var="data" scope="application" value="${datos}"/>
 
<form method="POST" action="${registerUrl}" class="col-6 offset-3">
	<c:forEach items="${data}" var="proyectos_actividades">
		<input type="hidden" name="option" value="update">
		
		<div class="form-row">
			<div class="form-group col-md-6">
			  <label for="inputId">ID</label>
			  <input type="text" class="form-control" id="inputId" value="${proyectos_actividades.id}" disabled>
			</div>
			
			<div class="form-group col-md-6">
			  <label for="inputProject">Proyecto</label>
			  <input type="text" class="form-control" id="inputProject" value="${param.proyecto}" disabled>
			</div>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-12">
			  <label for="inputActividad">Actividad</label>
			  <input type="text" class="form-control" id="inputActividad" value="${param.actividad}">
			</div>
		</div>

		<div class="form-row">

		</div>
		
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="selecUsername">Username</label>
				<select class="custom-select mr-sm-2" id="selecUsername">
					<option selected><c:out value="${param.username}"/></option>
					<%
						try {
							List<Map<String, String>> users = UsuarioDaoImp.getInstance().findAllUsuario();
							request.setAttribute("users", users);
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					<c:forEach items="${requestScope.users}" var="user">
						<option value="${user['username']}"></option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group col-md-4">
				<label for="dateEntrega">Fecha de Entrega:</label>
				<%
					String fecha_entrega = request.getParameter("entrega");
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					request.setAttribute("fecha_entrega", LocalDate.parse(fecha_entrega, formatter).format(formatter));
				%>
				<input type="date" class="form-control" id="dateEntrega" value="${requestScope.fecha_entrega}"/>
			</div>
			
			<div class="form-group col-md-4">
				<label for="selectPrioridad">Prioridad</label>
				<select class="custom-select mr-sm-2" id="selectPrioridad">
					<option selected><c:out value="${param.prioridad}"/></option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="3">4</option>
					<option value="3">5</option>
				</select>
			</div>
		</div>

		<div class="form-row">
			<div class="custom-control custom-checkbox my-1 mr-sm-2">
				<c:choose>
					<c:when test="${param.estado == 1}">
						<input type="checkbox" class="custom-control-input" id="customControlInline" checked>
					</c:when>
					<c:when test="${param.estado == 0}">
						<input type="checkbox" class="custom-control-input" id="customControlInline">
					</c:when>
				</c:choose>

				<label class="custom-control-label" for="customControlInline">Activa</label>
			</div>
		</div>
		<h1></h1>
	</c:forEach>
    <input type="submit" class="col-4 offset-4 btn btn-outline-success" >
</form>
        
<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>