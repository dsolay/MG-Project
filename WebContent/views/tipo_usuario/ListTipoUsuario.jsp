
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="url" value="/TipoUsuario"/>
<c:set var="uriAdd" scope="application" value="TipoUsuario?action=add"/>

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
	                    <li class="breadcrumb-item active"><a href="Proyectos?action=index">Tipo de Usuario</a></li>
	                </ol>
	            </nav>
	        </div>
	    </div>
	    <div id="buttons_crud">
	        <a href="${uriAdd}" class="btn btn-outline-primary" role="button" aria-pressed="true">
	            <i class="fas fa-plus"></i>
	        </a>
	    </div>
	
	    <table id="dtableTypeUsers" class="table table-striped table-hover" style="width:100%">
	        <thead>
	            <tr>
	                <th>ID</th>
	                <th>Tipo</th>
	                <th>Descripcion</th>
	                <th>Acciones</th>
	            </tr>
	        </thead>
	        
	         <tbody>
	            <c:forEach items="${list}" var="item">
	                <tr>
	                    <td><c:out value="${item.id}"/></td>
	                    <td><c:out value="${item.tipo}"/></td>
	                    <td><c:out value="${item.descripcion}"/></td>
	                    
	
	                    <td>
	                        <div class="btn-group">
	                            
	
	                            <form action="${url}" method="POST">
	                                <input type="hidden" name="redirect" value="true">
	                                <input type="hidden" name="option" value="update">
	
	                                <input type="hidden" name="id" value="${item.id}">
	                                <input type="hidden" name="tipo" value="${item.tipo}">
	                                <input type="hidden" name="descripcion" value="${item.descripcion}">
	                                <button type="submit" class="btn btn-outline-primary">
	                                    <i class="fas fa-pen"></i>
	                                </button>
	                            </form>
	
	                            <form action="${url}" method="POST">
	                                <input type="hidden" name="redirect" value="true">
	                                <input type="hidden" name="option" value="delete">
	
	                                <input type="hidden" name="id" value="${item.id}">
	
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
	                <th>Tipo</th>
	                <th>Descripcion</th>
	                <th>Acciones</th>
	            </tr>
	        </tfoot>
	    </table>
	</div>
</div>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>
    