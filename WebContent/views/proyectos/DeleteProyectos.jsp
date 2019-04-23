<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/Proyectos" var="registerUrl"/>

<%-- Header --%>
<jsp:include page="../components/header.jsp"/>

<div class="container col-12 col-md-4 offset-md-4 pt-4">
    <%--<h2 class="text-center">Eliminar Tipo de Usuarios</h2>--%>
    <form method="POST" action="${registerUrl}">
        <c:forEach items="${datos}" var="proyectos">
            <input type="hidden" name="redirect" value="false">
            <input type="hidden" name="option" value="delete">

            <input type="hidden" name="id" value="${proyectos.id}">

            <h5>¿Esta seguro de eliminar este registro?</h5>

        </c:forEach>

        <div class="row pt-3">
            <a href="Proyectos?action=index" class="col-12 col-md-3 offset-md-5 btn btn-secondary" role="button" aria-pressed="true">Cancelar</a>
            <button type="submit" class="col-12 col-md-3 offset-md-1 btn btn-danger">Eliminar</button>
        </div>
    </form>
</div>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>

