<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/12/19
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="${url}" var="registerUrl" />

<!-- Modal delete -->
<div class="modal fade" id="deleteProyectosActividades" tabindex="-1" role="dialog" aria-labelledby="deleteProyectosActividadesLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteProyectosActividadesLabel">Eliminar Actividad</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid form_modal">
                    <form id="deletePA" method="POST" action="${registerUrl}">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="project_name" value="${project_name}">

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>ID</label>
                                <p><span id="idDeletePA" class="badge badge-secondary"></span></p>
                               <input type="hidden" name="id" class="form-control" id="inputIDDeletePA">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label>Actividad</label>
                                <p><span id="actividadDeletePA" class="badge badge-secondary large_text"></span></p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-danger" form="deletePA">Eliminar</button>
            </div>
        </div>
    </div>
</div>
