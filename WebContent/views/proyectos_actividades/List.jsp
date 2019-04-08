<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/8/19
  Time: 7:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<div class="container">
    <div class="table-responsive-md dtable">
        <table class="table table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Proyecto</th>
                    <th scope="col">Actividad</th>
                    <th scope="col">Username</th>
                    <th scope="col">Creación</th>
                    <th scope="col">Entrega</th>
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

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
