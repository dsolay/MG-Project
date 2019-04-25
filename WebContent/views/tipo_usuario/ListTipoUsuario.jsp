
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="url" value="/TipoUsuario"/>
<c:set var="uriAdd" scope="application" value="TipoUsuario?action=add"/>

<%-- Header --%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<div class="full-height col-12">
	<div class="content full-height col-10 offset-1">
	    <div class="row">
	        <div class="col-12">
	            <nav aria-label="breadcrumb">
	                <ol class="breadcrumb">
						<li class="breadcrumb-item active"><a href="Usuario?action=index">Administración de Usuarios</a></li>
						<li class="breadcrumb-item active" aria-current="page">Tipo Usuario</li>
	                </ol>
	            </nav>
	        </div>
	    </div>

		<div id="buttons_crud" class="row justify-content-end mb-3">
			<div class="col-3">
				<a href="${uriAdd}" class="btn btn-outline-primary" role="button" aria-pressed="true" style="width: 100%">
					<i class="fas fa-plus"></i> Nuevo tipo de usuario
				</a>
			</div>
		</div>
	
	    <table id="dtableTypeUsers" class="table table-striped table-hover" style="width:100%">
	        <thead>
	            <tr>
	                <th>Correlativo</th>
	                <th>Tipo</th>
	                <th>Descripción</th>
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
	                                <button type="submit" class="btn btn-outline-primary" data-tooltip="tooltip" title="Editar">
	                                    <i class="fas fa-pen"></i>
	                                </button>
	                            </form>
	
	                            <form action="${url}" method="POST">
	                                <input type="hidden" name="redirect" value="true">
	                                <input type="hidden" name="option" value="delete">
	
	                                <input type="hidden" name="id" value="${item.id}">
	
	                                <button type="submit" class="btn btn-outline-danger" data-tooltip="tooltip" title="Eliminar">
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
	                <th>Descripción</th>
	                <th>Acciones</th>
	            </tr>
	        </tfoot>
	    </table>
	</div>
</div>

<!-- jQuery CDN -->
<script src="js/vendor/jquery.js"></script>

<!-- Popper.JS -->
<script src="js/vendor/popper.js"></script>

<!-- Bootstrap JS -->
<script src="js/vendor/bootstrap.js"></script>

<!-- Datatable js -->
<script src="js/vendor/datatables.js"></script>

<!-- config datatable -->
<script src="js/app/lib/datatable.js"></script>

<!-- DOM elements -->
<script src="js/app/DOM/type_user/ListTypeUser.js"></script>

<!-- app -->
<script src="js/app.js"></script>

<%-- Header --%>
<jsp:include page="../components/footer.jsp"/>
    