<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/TipoUsuario" var="registerUrl" />
<c:set var="data" scope="application" value="${datos}"/>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<div class="container col-12 col-md-4 offset-md-4 pt-4">
    <h2 class="text-center">Actualizar Tipo de Usuario</h2>

    <form method="POST" action="${registerUrl}" class="needs-validation pt-3" novalidate>
        <c:forEach items="${data}" var="tipo_usuario">
            <input type="hidden" name="option" value="update">
            <input type="hidden" name="redirect" value="false">

            <section class="form-group">
                <label><strong class="asterisk-required">*</strong> ID</label>
                <input type="text" name="id" class="form-control" value="${tipo_usuario.id}" readonly>
            </section>

            <section class="form-group">
                <label><strong class="asterisk-required">*</strong> Tipo</label>
                <input type="text" name="tipo" class="form-control" value="${tipo_usuario.tipo}" required>
                <div class="invalid-feedback">
                    Debe ingresar un tipo de usuario.
                </div>
            </section>

            <section class="form-group">
                <label><strong class="asterisk-required">*</strong> Descripcion </label>
                <input type="text" name="descripcion" class="form-control" value="${tipo_usuario.descripcion}" required>
                <div class="invalid-feedback">
                    Debe ingresar una descripción.
                </div>
            </section>
        </c:forEach>

        <section>
            <label class="required"><strong>* Campo requerido</strong></label>
        </section>

        <div class="row pt-3">
            <a href="TipoUsuario?action=index" class="col-12 col-md-3 offset-md-5 btn btn-secondary" role="button" aria-pressed="true">Cancelar</a>
            <button type="submit" class="col-12 col-md-3 offset-md-1 btn btn-primary">Actualizar</button>
        </div>
    </form>
</div>

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
            
