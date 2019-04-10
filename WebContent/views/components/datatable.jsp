<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/9/19
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

                <th scope="col">Accion</th>
                <th scope="col">Accion</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${map}" var="row">
                <tr>
                    <c:forEach items="${thead}" var="column">
                        <td><c:out value="${row[column]}"/></td>
                    </c:forEach>

                    <td>
                        <form action="<c:url value="${url}"/>" method="POST">
                            <input type="hidden" name="redirect" value="true">
                            <input type="hidden" name="option" value="update">

                            <c:forEach items="${thead}" var="column">
                                <input type="hidden" name="${column}" value="${row[column]}">
                            </c:forEach>

                            <button type="submit" class="btn btn-outline-success">Editar</button>
                        </form>
                    </td>
                    <td>
                        <form action="<c:url value="${url}"/>" method="POST">
                            <input type="hidden" name="redirect" value="true">
                            <input type="hidden" name="option" value="delete">

                            <input type="hidden" name="id" value="${row['id']}">

                            <button type="submit" class="btn btn-outline-danger">Eliminar</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
