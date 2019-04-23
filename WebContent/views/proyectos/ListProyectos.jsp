<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="url" value="/Proyectos"/>
<c:set var="uriAdd" scope="application" value="Proyectos?action=add"/>

<%-- Header --%>
<jsp:include page="../components/header.jsp"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-12 col-md-6">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="Proyectos?action=index">Proyecto</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <div id="buttons_crud">
        <a href="${uriAdd}" class="btn btn-outline-primary" role="button" aria-pressed="true">
            <i class="fas fa-plus"></i>
        </a>
    </div>

    <table id="dtableProjects" class="table table-striped table-hover" style="width:100%">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Usuario</th>
                <th>Acciones</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach items="${listProyectos}" var="item">
                <tr>
                    <td><c:out value="${item['id']}"/></td>
                    <td><c:out value="${item['nombre_proyecto']}"/></td>
                    <td><c:out value="${item['descripcion']}"/></td>
                    <td><c:out value="${item['usuario_proyecto']}"/></td>

                    <td>
                        <div class="btn-group">
                            <form class="form-search" action="<c:url value="/ProyectosActividades"/>" method="POST">
                                <input type="hidden" name="action" value="index">

                                <input type="hidden" name="project_name" value="${item['nombre_proyecto']}">
                                <input type="hidden" name="project_id" value="${item['id']}">

                                <button type="submit" class="btn btn-outline-primary">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </form>

                            <form action="${url}" method="POST">
                                <input type="hidden" name="redirect" value="true">
                                <input type="hidden" name="option" value="update">

                                <input type="hidden" name="id" value="${item['id']}">
                                <input type="hidden" name="nombre_proyecto" value="${item['nombre_proyecto']}">
                                <input type="hidden" name="descripcion" value="${item['descripcion']}">
                                <input type="hidden" name="id_usuario" value="${item['id_usuario']}">

                                <button type="submit" class="btn btn-outline-primary">
                                    <i class="fas fa-pen"></i>
                                </button>
                            </form>

                            <form action="${url}" method="POST">
                                <input type="hidden" name="redirect" value="true">
                                <input type="hidden" name="option" value="delete">

                                <input type="hidden" name="id" value="${item['id']}">
                                <input type="hidden" name="nombre_proyecto" value="${item['nombre_proyecto']}">

                                <button type="submit" class="btn btn-outline-danger">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>

        <tfoot>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Usuario</th>
                <th>Acciones</th>
            </tr>
        </tfoot>
    </table>
</div>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>
