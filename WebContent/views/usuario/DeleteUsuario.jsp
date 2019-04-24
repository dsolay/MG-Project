<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/Usuario" var="registerUrl"/>

<%-- Header --%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<div class="content">
	<div class="container-fluid col-10 offset-1">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Usuario?action=index">Administración de Usuarios</a></li>
						<li class="breadcrumb-item active" aria-current="page">Eliminar Usuario</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="container col-12 col-md-9 offset-md-1 pt-4">
			<form method="POST" action="${registerUrl}">
				<c:forEach items="${datos}" var="usuario">
					<input type="hidden" name="redirect" value="false">
					<input type="hidden" name="option" value="delete">

					<input type="hidden" name="id" value="${usuario.id}">

					<h5>¿Esta seguro de eliminar este registro?</h5>

				</c:forEach>

				<div class="row pt-3">
					<a href="Usuario?action=index" class="col-12 col-md-3 offset-md-5 mr-3 btn btn-secondary" role="button" aria-pressed="true">Cancelar</a>
					<button type="submit" class="col-12 col-md-3 mr-3 btn btn-danger">Eliminar</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>     