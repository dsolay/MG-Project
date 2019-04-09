<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/8/19
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--header--%>
<jsp:include page="../components/header.jsp"/>


<h1 class="text-center"> Actualizar Proyecto </h1>
 
<c:url value="/ProyectosActividades" var="registerUrl" />
 
<form method="POST" action="${registerUrl}" class="col-6 offset-3">
	<c:forEach items="${datos}" var="pa">
		<input type="hidden" name="option" value="update">
		<input type="hidden" name="custId" value="1">
		
		<div class="form-row">
			<div class="form-group col-md-6">
			  <label for="inputId">ID</label>
			  <input type="text" class="form-control" id="inputId" disabled>
			</div>
			
			<div class="form-group col-md-6">
			  <label for="inputProject">Proyecto</label>
			  <input type="text" class="form-control" id="inputProject" disabled>
			</div>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-6">
			  <label for="inputActividad">Actividad</label>
			  <input type="text" class="form-control" id="inputActividad">
			</div>
			
			<div class="form-group col-md-6">
			  <label for="inputUsername">Username</label>
			  <input type="text" class="form-control" id="inputUsername">
			</div>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputActividad">Fecha de Entrega</label>
				<input id="datepicker" width="276" />
		        <script>
			        $('#datepicker').datepicker({
			            uiLibrary: 'bootstrap4'
			        });
			    </script>
			</div>
			
			<div class="form-group col-md-6">
				<label for="inputUsername">Prioridad</label>
				<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
				<option selected>Choose...</option>
				<option value="1">One</option>
				<option value="2">Two</option>
				<option value="3">Three</option>
				</select>
			</div>
		</div>
	
		<section>
			<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
	        <option selected>Choose...</option>
	        <option value="1">One</option>
	        <option value="2">Two</option>
	        <option value="3">Three</option>
	      </select>
		</section>
		<h1></h1>
	</c:forEach>
    <input type="submit" class="col-4 offset-4 btn btn-outline-success" >
</form>
        
<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
