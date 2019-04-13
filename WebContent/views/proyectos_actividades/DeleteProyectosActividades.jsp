<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/12/19
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<c:url value="${url}" var="registerUrl" />

<div class="container">
    <h1 class="text-center"> Eliminar Actividad </h1>

    <form method="POST" action="${registerUrl}" class="col-6 offset-3">
        <input type="hidden" name="redirect" value="false">
        <input type="hidden" name="option" value="delete">

        <input type="hidden" name="id" value="${param.id}" readonly>

        <h6>¿Desea eliminar esta Actividad? :  ${param.actividad}</h6>

        <a href="ProyectosActividades?action=index" class="col-3 offset-5 btn btn-secondary" role="button" aria-pressed="true">Cancelar</a>
        <button type="submit" class="col-3 btn btn-danger">Eliminar</button>
    </form>
</div>

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
