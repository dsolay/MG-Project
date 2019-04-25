<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/Proyectos" var="registerUrl"/>

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
						<li class="breadcrumb-item"><a class="breadcrumbParentProject" href="Proyectos?action=index"></a></li>
						<li id="breadcrumbDeleteProject" class="breadcrumb-item active" aria-current="page"></li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="container col-12 col-md-9 offset-md-1 pt-4">
			<%--<h2 class="text-center">Eliminar Tipo de Usuarios</h2>--%>
			<form method="POST" action="${registerUrl}">
				<c:forEach items="${datos}" var="proyectos">
					<input type="hidden" name="redirect" value="false">
					<input type="hidden" name="option" value="delete">

					<input type="hidden" name="id" value="${proyectos.id}">

					<h5 id="QuestionDeleteProject" class="text-center"></h5>

				</c:forEach>

				<section>
					<label class="required full-width pt-3"><strong id="warningDeleteProject" class="full-width text-center" style="display: block"></strong></label>
				</section>

				<div class="row pt-3">
					<a href="Proyectos?action=index" class="col-12 col-md-3 offset-md-3 mr-3 btn btn-secondary btnCancelProject" role="button" aria-pressed="true"></a>
					<button id="btnDeleteProject" type="submit" class="col-12 col-md-3 mr-3 btn btn-danger"></button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- jQuery CDN -->
<script src="js/vendor/jquery.js"></script>

<!-- Popper.JS -->
<script src="js/vendor/popper.js"></script>

<!-- Bootstrap JS -->
<script src="js/vendor/bootstrap.js"></script>

<!-- Language Spanish -->
<script src="js/app/lang/project/spanish.js"></script>

<!-- DOM elements -->
<script src="js/app/DOM/project/DeleteProject.js"></script>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>

