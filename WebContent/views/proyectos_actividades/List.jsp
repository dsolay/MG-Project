<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/8/19
  Time: 7:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                <c:forEach items="${listActividades}" var="pa">
                    <tr>
                        <td scope="row"><c:out value="${pa.get(id)}"/></td>
                        <td><c:out value="${pa.get(nombre_proyecto)}"/></td>
                        <td><c:out value="${pa.get(nombre_actividad)}"/></td>
                        <td><c:out value="${pa.get(username)}"/></td>
                        <td><c:out value="${pa.get(fecha_creacion)}"/></td>
                        <td><c:out value="${pa.get(fecha_entrega)}"/></td>
                        <td><c:out value="${pa.get(prioridad)}"/></td>
                        <td><c:out value="${pa.get(estado)}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
