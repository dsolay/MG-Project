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
        <button id="bnew" type="button" class="btn btn-outline-primary">Nuevo</button>
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
                        <td><c:out value="${row[key]}"/></td>
                    </c:forEach>

                    <td>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <form action="<c:url value="${url}"/>" method="POST">
                                <input type="hidden" name="redirect" value="true">
                                <input type="hidden" name="option" value="update">

                                <c:forEach items="${row}" var="column">
                                    <input type="hidden" name="${column.key}" value="${column.value}">
                                </c:forEach>

                                <button type="submit" class="btn btn-outline-success">Editar</button>
                            </form>

                            <form action="<c:url value="${url}"/>" method="POST">
                                <input type="hidden" name="redirect" value="true">
                                <input type="hidden" name="option" value="delete">

                                <input type="hidden" name="id" value="${row['id']}">

                                <button type="submit" class="btn btn-outline-danger">Eliminar</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
