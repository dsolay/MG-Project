
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="url" value="/Proyectos"/>
<c:set var="uriAdd" scope="application" value="Proyectos?action=add"/>

<%-- Header --%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<div class="content">
    <div class="container-fluid col-10 offset-1">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active"><a href="Proyectos?action=index">Administración de Proyectos</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <div id="buttons_crud" class="row justify-content-end mb-3">
            <div class="col-3">
                <a href="${uriAdd}" class="btn btn-outline-primary" role="button" aria-pressed="true" style="width: 100%">
                    <i class="fas fa-plus"></i> Nuevo proyecto
                </a>
            </div>
        </div>

        <table id="dtableProjects" class="table table-striped table-hover" style="width:100%">
            <thead>
            <tr>
                <th>Correlativo</th>
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

                                <button type="submit" class="btn btn-outline-primary" data-tooltip="tooltip" title="Ver actividades">
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

                                <button type="submit" class="btn btn-outline-primary" data-tooltip="tooltip" title="Editar">
                                    <i class="fas fa-pen"></i>
                                </button>
                            </form>

                            <form action="${url}" method="POST">
                                <input type="hidden" name="redirect" value="true">
                                <input type="hidden" name="option" value="delete">

                                <input type="hidden" name="id" value="${item['id']}">
                                <input type="hidden" name="nombre_proyecto" value="${item['nombre_proyecto']}">

                                <button type="submit" class="btn btn-outline-danger" data-tooltip="tooltip" title="Editar">
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
                <th>Correlativo</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Usuario</th>
                <th>Acciones</th>
            </tr>
            </tfoot>
        </table>
    </div>
</div>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>