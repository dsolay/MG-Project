<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/TipoUsuario" var="registerUrl"/>

<%-- Header --%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<div class="full-height col-12">
	<div class="content full-height col-10 offset-1">
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Usuario?action=index">Administración de Usuarios</a></li>
						<li class="breadcrumb-item"><a href="TipoUsuario?action=index">Tipo Usuario</a></li>
						<li class="breadcrumb-item active" aria-current="page">Elimiar</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="container col-12 col-md-9 offset-md-1 pt-4">
			<form method="POST" action="${registerUrl}">
				<c:forEach items="${datos}" var="tipodeusuario">
					<input type="hidden" name="redirect" value="false">
					<input type="hidden" name="option" value="delete">

					<input type="hidden" name="id" value="${tipodeusuario.id}">

					<h5 class="text-center">¿Esta seguro de eliminar este registro?</h5>

				</c:forEach>

				<section>
					<label class="required full-width pt-3"><strong id="warningDeleteProject" class="full-width text-center" style="display: block">
						* Advertencia: Esta acción eliminarán todas los usuarios de este tipo, y los proyectos y actividades asociados.
					</strong></label>
				</section>

				<div class="row pt-3">
					<a href="TipoUsuario?action=index" class="col-12 col-md-3 offset-md-3 mr-3 btn btn-secondary" role="button" aria-pressed="true">Cancelar</a>
					<button type="submit" class="col-12 col-md-3 mr-3 btn btn-danger">Eliminar</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>