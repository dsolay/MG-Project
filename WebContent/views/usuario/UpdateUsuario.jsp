<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="daoImp.TipoUsuarioDaoImp" %>
<%@ page import="model.TipoUsuario" %>

<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/Usuario" var="registerUrl"/>
<c:set var="data" scope="application" value="${datos}"/>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<div class="content">
    <div class="container-fluid col-10 offset-1">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Usuario?action=index">AAdministración de Usuarios</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edición</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="container ol-12 col-12 col-md-9 offset-md-1 pt-4">
            <form method="POST" action="${registerUrl}" class="needs-validation" novalidate>
                <input id="action" type="hidden" name="option" value="update">


                <c:forEach items="${data}" var="usuario">
                    <input type="hidden" name="id" value="${usuario.id}">

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label><strong class="asterisk-required">*</strong> Nombres </label>
                            <input type="text" name="nombres" class="form-control" value="${usuario.nombres}" required>
                            <div class="invalid-feedback">
                                Debe ingresar un nombre para el usuario.
                            </div>
                        </div>

                        <div class="form-group col-md-6">
                            <label><strong class="asterisk-required">*</strong> Apellidos</label>
                            <input type="text" name="apellidos" class="form-control" value="${usuario.apellidos}" required>
                            <div class="invalid-feedback">
                                Debe ingresar un nombre para el usuario.
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label><strong class="asterisk-required">*</strong> Email</label>
                            <input type="text" name="email" class="form-control" id="inputEmail" value="${usuario.email}"
                                   required/>
                            <div class="invalid-feedback">
                                Debe ingresar un email.
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <label><strong class="asterisk-required">*</strong> Username</label>
                            <input type="text" name="username" class="form-control" id="inputUsername"
                                   value="${usuario.username}" required/>
                            <div class="invalid-feedback">
                                Debe ingresar un nombre de usuario.
                            </div>
                        </div>

                        <div class="form-group col-md-4">
                            <label><strong class="asterisk-required">*</strong> Password</label>
                            <input type="password" minlength="8" name="password" class="form-control" value="${usuario.password}" required>
                            <div class="invalid-feedback">
                                Debe ingresar una contraseña.
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label><strong class="asterisk-required">*</strong> Tipo Usuario</label>
                            <%
                                try {
                                    List<Map<String, String>> type_users = TipoUsuarioDaoImp.getInstance().findAll();
                                    request.setAttribute("type_users", type_users);
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <select name="id_tipo_usuario" id="selectTypeUserUpdate" class="custom-select" style="width: 100%"
                                    required>
                                <c:forEach items="${type_users}" var="type_user">
                                    <c:choose>
                                        <c:when test="${type_user.id == usuario.id_tipo_usuario}">
                                            <option selected value="${type_user['id']}"><c:out
                                                    value="${type_user['tipo']}"/></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${type_user['id']}"><c:out
                                                    value="${type_user['tipo']}"/></option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar un usuario para el proyecto.
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <section>
                    <label class="required"><strong>* Campo requerido</strong></label>
                </section>

                <div class="row pt-3">
                    <a href="Usuario?action=index" class="col-12 col-md-3 offset-md-5 mr-3 btn btn-danger" role="button"
                       aria-pressed="true">Cancelar</a>
                    <button type="submit" class="col-12 col-md-3 mr-3 btn btn-success">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--header--%>
<jsp:include page="../components/footer.jsp"/>