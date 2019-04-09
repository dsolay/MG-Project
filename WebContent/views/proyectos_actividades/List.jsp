<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/8/19
  Time: 7:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>--%>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<div class="container">
    <div class="dtable">
        <div id="buttons_crud" class="col-sm-12 col-sm-6">
            <div class="btn-group" role="group" aria-label="Basic example">
                <button id="bnew" type="button" class="btn btn-outline-primary">Nuevo</button>
                <button id="bedit" type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#pModal">Editar</button>
                <button id="bdelete" type="button" class="btn btn-outline-danger">Eliminar</button>
            </div>
        </div>
        <table id="pactividades" class="table table-striped" style="width:100%">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Proyecto</th>
                    <th scope="col">Actividad</th>
                    <th scope="col">Username</th>
                    <th scope="col">Creado</th>
                    <th scope="col">Entrega</th>
                    <th scope="col">Tiempo restante</th>
                    <th scope="col">Prioridad</th>
                    <th scope="col">Estado</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.listProyectosActividades}" var="pa">
                    <tr>
                        <td><c:out value="${pa['id']}"/></td>
                        <td><c:out value="${pa['nombre_proyecto']}"/></td>
                        <td><c:out value="${pa['nombre_actividad']}"/></td>
                        <td><c:out value="${pa['username']}"/></td>
                        <td><c:out value="${pa['fecha_creacion']}"/></td>
                        <td><c:out value="${pa['fecha_entrega']}"/></td>

                        <c:choose>
                            <c:when test="${pa['units'] == 'Finalizada'}">
                                <td><span class="badge badge-success"><c:out value="${pa['units']}"/></span></td>
                            </c:when>
                            <c:when test="${pa['units'] == 'días' || pa['units'] == 'día'}">
                                <c:choose>
                                    <c:when test="${pa['time'] > 3}">
                                        <td><span class="badge badge-primary"><c:out value="${pa['time']} ${pa['units']}"/></span></td>
                                    </c:when>
                                    <c:when test="${pa['time'] > 1}">
                                        <td><span class="badge badge-warning"><c:out value="${pa['time']} ${pa['units']}"/></span></td>
                                    </c:when>
                                    <c:when test="${pa['time'] == 1}">
                                        <td><span class="badge badge-danger"><c:out value="${pa['time']} ${pa['units']}"/></span></td>
                                    </c:when>
                                </c:choose>

                            </c:when>
                        </c:choose>

                        <td><c:out value="${pa['prioridad']}"/></td>

                        <c:choose>
                            <c:when test="${pa['estado'] == 1 }">
                                <td><span class="badge badge-success">Activa</span></td>
                            </c:when>
                            <c:otherwise>
                                <td><span class="badge badge-danger">No Activa</span></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%-- Modal --%>
<jsp:include page="Update.jsp"/>

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
