<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/12/19
  Time: 6:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<c:url value="${url}" var="registerUrl"/>


<div class="container">
    <h1 class="text-center"> Agregar Actividad </h1>

    <form method="POST" action="${registerUrl}" class="col-6 offset-3">
        <input type="hidden" name="redirect" value="false">
        <input type="hidden" name="option" value="add">

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="selectProject">Proyecto</label>
                <select name="proyecto" class="custom-select mr-sm-2" id="selectProject">
                    <option value="" selected disabled hidden>Elegir proyecto</option>

                    <c:forEach items="${requestScope.projects}" var="project">
                        <option value="${project['nombre_proyecto']}"><c:out value="${project['nombre_proyecto']}"/></option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="inputActividad">Actividad</label>
                <input type="text" name="actividad" class="form-control" id="inputActividad" placeholder="Nombre de actividad">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="selecUsername">Username</label>
                <select name="username" class="custom-select mr-sm-2" id="selecUsername">
                    <option value="" selected disabled hidden>Elegir usuario</option>

                    <c:forEach items="${requestScope.users}" var="user">
                        <option value="${user['username']}"><c:out value="${user['username']}"/></option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group col-md-4">
                <label for="dateEntrega">Fecha de Entrega:</label>
                <input type="date" name="entrega" class="form-control" id="dateEntrega"/>
            </div>

            <div class="form-group col-md-4">
                <label for="selectPrioridad">Prioridad</label>
                <select name="prioridad" class="custom-select mr-sm-2" id="selectPrioridad">
                    <option value="" selected disabled hidden>Elegir prioridad</option>
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
                <input type="checkbox" name="estado" class="custom-control-input" id="checkEstadoAdd" checked>
                <label class="custom-control-label" for="checkEstadoAdd">Activa</label>
            </div>
        </div>

        <a href="ProyectosActividades?action=index" class="col-3 offset-5 btn btn-secondary" role="button" aria-pressed="true">Cancelar</a>
        <button type="submit" class="col-3 btn btn-primary">Guardar</button>
    </form>
</div>

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>