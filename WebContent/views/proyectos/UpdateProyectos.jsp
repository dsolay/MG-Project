<%@ page import="daoImp.UsuarioDaoImp" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/Proyectos" var="registerUrl" />
<c:set var="data" scope="application" value="${datos}"/>

<%--header--%>
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
						<li id="breadcrumbUpdateProject" class="breadcrumb-item active" aria-current="page"></li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="container col-12 col-md-9 offset-md-1">
			<form method="POST" action="${registerUrl}" class="needs-validation pt-3" novalidate>
				<input type="hidden" name="option" value="update">
				<input type="hidden" name="redirect" value="false">

				<c:forEach items="${data}" var="proyectos">
					<input type="hidden" name="id" value="${proyectos.id}">
					<div class="form-row">
						<div class="form-group col-md-12">
							<div>
								<strong class="asterisk-required">* </strong>
								<label id="labelProject"></label>
							</div>
							<input type="text" name="nombre_proyecto" class="form-control" value="${proyectos.nombre_proyecto}" required>
							<div class="invalid-feedback invalidFeddbackProject">
							</div>
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-12">
							<div>
								<strong class="asterisk-required">* </strong>
								<label id="labelDescription"></label>
							</div>
							<input type="text" name="descripcion" class="form-control" value="${proyectos.descripcion}"required>
							<div class="invalid-feedback invalidFeddbackDescription">
							</div>
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<div>
								<strong class="asterisk-required">* </strong>
								<label id="labelUser"></label>
							</div>
							<%
								try {
									List<Map<String, String>> users = UsuarioDaoImp.getInstance().findAllUsuario();
									request.setAttribute("users", users);
								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
							<select name="id_usuario" id="selectUserUpdateProject" class="custom-select" style="width: 100%" required>
								<c:forEach items="${users}" var="user">
									<c:choose>
										<c:when test="${user.id == proyectos.id_usuario}">
											<option selected value="${user.id}"><c:out value="${user.nombres}, ${user.apellidos}"/></option>
										</c:when>
										<c:otherwise>
											<option value="${user.id}"><c:out value="${user.nombres}, ${user.apellidos}"/></option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<div class="invalid-feedback invalidFeddbackUser">
							</div>
						</div>
					</div>
				</c:forEach>

				<section>
					<label class="required"><strong class="fieldRequired"></strong></label>
				</section>

				<div class="row pt-3 justify-content-end">
					<a href="Proyectos?action=index" class="col-12 col-md-3 offset-md-5 mr-3 btn btn-danger btnCancelProject" role="button" aria-pressed="true"></a>
					<button id="btnUpdateProject" class="col-12 col-md-3 mr-3 btn btn-success"></button>
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

<!-- Select2 -->
<script src="js/vendor/select2.js"></script>

<!-- Language Spanish -->
<script src="js/app/lang/project/spanish.js"></script>

<!-- config select2 -->
<script src="js/app/lib/select2PA.js"></script>

<!-- DOM elements -->
<script src="js/app/DOM/project/UpdateProject.js"></script>

<!-- app -->
<script src="js/app.js"></script>

<%-- Footer --%>
<jsp:include page="../components/footer.jsp"/>
