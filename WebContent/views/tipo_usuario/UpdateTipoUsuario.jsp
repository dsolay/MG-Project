<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

     <h1 class="text-center">Actualizar Tipo  de  usuario</h1>
     <c:url value="/TipoUsuario" var="registerUrl" />

    <c:set var="data" scope="application" value="${datos}"/>

     <form method="POST" action="<c:url value="/TipoUsuario"/>" class="col-6 offset-3">
          <c:forEach items="${data}" var="tipo_usuario">
            <input type="hidden" name="option" value="update">
            <input type="hidden" name="redirect" value="false">

                <section class="form-group">
                    <label>Id:</label>
                    <input type="text" name="id" class="form-control" value="${tipo_usuario.id}" readonly>
                </section>

                <section class="form-group">
                    <label>Tipo:</label>
                    <input type="text" name="tipo" class="form-control" value="${tipo_usuario.tipo}">
                </section>

                <section class="form-group">
                    <label>Descripcion: </label>
                    <input type="text" name="descripcion" class="form-control" value="${tipo_usuario.descripcion}">
                </section>

                <h1></h1>
          </c:forEach>
         <input type="submit" class="col-4 offset-4 btn btn-outline-success" >
     </form>

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
            
