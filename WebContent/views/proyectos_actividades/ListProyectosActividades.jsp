<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="url" scope="application" value="/ProyectosActividades"/>
<c:set var="uriAdd" scope="application" value="ProyectosActividades?action=add"/>

<%--header--%>
<jsp:include page="../components/header.jsp"/>

<%-- navbar --%>
<jsp:include page="../components/navbar.jsp"/>

<%-- Modal add and update --%>
<jsp:include page="AddUpdateProyectosActividades.jsp"/>

<%-- Modal delete --%>
<jsp:include page="DeleteProyectosActividades.jsp"/>

<%-- Modal info --%>
<jsp:include page="InfoProyectoAcrividades.jsp"/>

<div class="content">
	<div class="container-fluid col-10 offset-1">
	    <div class="row">
	        <div class="col-12">
	            <nav aria-label="breadcrumb">
	                <ol class="breadcrumb">
	                    <li class="breadcrumb-item"><a href="Proyectos?action=index">Administración de Proyectos</a></li>
	                    <li id="searchProject" class="breadcrumb-item active" aria-current="page"><c:out value="${project_name}"/></li>
	                </ol>
	                
	                <div class="flex-reverse">
				        <div id="btn_crud" class="btn-group">
				            <button id="btn_add" type="button" class="btn btn-outline-primary" data-toggle="modal" data-tooltip="tooltip" data-target="#addUpdateProyectosActividades" title="Nueva actividad">
				                <i class="fas fa-plus"></i>
				            </button>
				
				            <button id="btn_update" type="button" class="btn-crud-actions btn btn-outline-primary" data-toggle="modal" data-tooltip="tooltip" data-target="#addUpdateProyectosActividades" title="Actualizar" disabled>
				                <i class="fas fa-pen"></i>
				            </button>
				
				            <button id="btn_delete" type="submit" class="btn-crud-actions btn btn-outline-danger" data-toggle="modal" data-tooltip="tooltip" data-target="#deleteProyectosActividades" title="Eliminar" disabled>
				                <i class="fas fa-trash"></i>
				            </button>
				        </div>
				
				        <div class="btn-info-container">
				            <button id="btn_info" type="button" class="btn-crud-actions btn btn-outline-primary" data-toggle="modal" data-target="#infoProyectosActividades" disabled>
				                <i class="fas fa-eye"></i> Mas Información
				            </button>
				        </div>
				    </div>
	            </nav>
	        </div>
	    </div>
	    
	    <table id="pro" class="table table-striped table-hover" style="width:100%">
	        <thead>
	        <tr>
	            <th>Correlativo</th>
	            <th>Actividad</th>
	            <th>Entrega</th>
	            <th>Usuario</th>
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	        </tr>
	        </thead>
	        <tfoot>
	        <tr>
	            <th>Correlativo</th>
	            <th>Actividad</th>
	            <th>Entrega</th>
	            <th>Usuario</th>
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	            <th style="display:none;">
	        </tr>
	        </tfoot>
	    </table>
	</div>
</div>

<%-- footer--%>
<jsp:include page="../components/footer.jsp"/>
