<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/9/19
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid">
    <div id="buttons_crud" class="collapse">
        <a href="${uriAdd}" class="btn btn-outline-primary" role="button" aria-pressed="true">
            <i class="fas fa-plus"></i>
        </a>
    </div>

    <table id="dtable" class="table table-striped table-hover" style="width:100%">
        <thead>
            <tr>
                <c:forEach items="${thead}" var="head">
                    <th scope="col"><c:out value="${head}"/></th>
                </c:forEach>

                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${map}" var="row">
                <tr>
                    <c:forEach items="${thead}" var="column">
                        <c:set var="key" scope="page" value="${fn:toLowerCase(column)}"/>
                        <c:choose>
                            <c:when test="${key eq 'estado'}">
                                <c:choose>
                                    <c:when test="${row[key] == 1}">
                                        <td><span class="badge badge-success">Activa</span></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><span class="badge badge-danger">No Activa</span></td>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:when test="${key eq 'restante'}">
                                <c:choose>
                                    <c:when test="${row[key] == 0}">
                                        <td><span class="badge badge-primary">Finalizada</span></td>
                                    </c:when>
                                    <c:when test="${row[key] == 1}">
                                        <td><span class="badge badge-danger"><c:out value="${row[key]} día"/></span></td>
                                    </c:when>
                                    <c:when test="${row[key] > 2}">
                                        <td><span class="badge badge-secondary"><c:out value="${row[key]} días"/></span></td>
                                    </c:when>
                                    <c:when test="${row[key] > 1}">
                                        <td><span class="badge badge-warning"><c:out value="${row[key]} días"/></span></td>
                                    </c:when>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <td><c:out value="${row[key]}"/></td>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <td>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <form action="<c:url value="${url}"/>" method="POST">
                                <input type="hidden" name="redirect" value="true">
                                <input type="hidden" name="option" value="update">

                                <c:forEach items="${row}" var="column">
                                    <input type="hidden" name="${column.key}" value="${column.value}">
                                </c:forEach>

                                <button type="submit" class="btn btn-outline-success">
                                    <i class="fas fa-pen"></i>
                                </button>
                            </form>

                            <form action="<c:url value="${url}"/>" method="POST">
                                <input type="hidden" name="redirect" value="true">
                                <input type="hidden" name="option" value="delete">

                                <c:forEach items="${row}" var="column">
                                    <input type="hidden" name="${column.key}" value="${column.value}">
                                </c:forEach>

                                <button type="submit" class="btn btn-outline-danger">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
