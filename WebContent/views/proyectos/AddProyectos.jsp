<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="daoImp.UsuarioDaoImp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:url value="/Proyectos" var="registerUrl" />

<%-- Header --%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<div class="container container-crud col-12 col-md-4 offset-md-4 pt-4">
    <h2 class="text-center">Nuevo Proyecto</h2>

    <form method="POST" action="${registerUrl}" class="needs-validation pt-3" novalidate>
        <input type="hidden" name="option" value="add">
        <input type="hidden" name="redirect" value="false">

        <div class="form-row">
            <div class="form-group col-md-12">
                <label><strong class="asterisk-required">*</strong> Proyecto</label>
                <input type="text" name="nombre_proyecto" class="form-control" required>
                <div class="invalid-feedback">
                    Debe ingresar un nombre para el proyecto.
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-12">
                <label><strong class="asterisk-required">*</strong> Descripcion</label>
                <input type="text" name="descripcion" class="form-control" required>
                <div class="invalid-feedback">
                    Debe ingresar una descripcion para el proyecto.
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label><strong class="asterisk-required">*</strong> usuario</label>
                <%
                    try {
                        List<Map<String, String>> users = UsuarioDaoImp.getInstance().findAllUsuario();
                        request.setAttribute("users", users);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <select name="id_usuario" id="selectUserProject" class="custom-select" style="width: 100%" required>
                    <c:forEach items="${users}" var="user">
                        <option value="${user.id}"><c:out value="${user.nombres}, ${user.apellidos}"/></option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">
                    Debe seleccionar un usuario para el proyecto.
                </div>
            </div>
        </div>

        <section>
            <label class="required"><strong>* Campo requerido</strong></label>
        </section>

        <div class="row pt-3">
            <a href="Proyectos?action=index" class="col-12 col-md-3 offset-md-5 btn btn-secondary" role="button" aria-pressed="true">Cancelar</a>
            <button type="submit" class="col-12 col-md-3 offset-md-1 btn btn-primary">Agregar</button>
        </div>
    </form>
</div>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>
