<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="${url}" var="registerUrl"/>

<!-- Modal add -->
<div class="modal fade" id="addUpdateProyectosActividades" tabindex="-1" role="dialog" aria-labelledby="addUpdateProyectosActividadesLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center text-primary" id="addUpdateProyectosActividadesLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid form_modal">
                    <form id="formPA" method="POST" action="${registerUrl}" class="needs-validation" novalidate>
                        <input id="action" type="hidden" name="action">
                        <input id="idPA" type="hidden" name="id">

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputProjectName">Proyecto</label>
                                <input id="searchProject" type="hidden" name="project_id" value="${project_id}">
                                <input id="inputProjectName" type="text" name="project_name" class="form-control" value="${project_name}" readonly>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="inputActividad"><strong class="asterisk-required">*</strong> Actividad</label>
                                <input type="text" name="actividad" class="form-control" id="inputActividad" placeholder="Nombre de actividad" required>
                                <div class="invalid-feedback">
                                    Debe ingresar un nombre para la actividad.
                                </div>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="selectUserPA"><strong class="asterisk-required">*</strong> Usuario</label>
                                <select id="selectUserPA" name="usuario" class="custom-select mr-sm-2" style="width: 100%" required></select>
                                <div class="invalid-feedback">
                                    Eliga un usuario.
                                </div>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="dateEntrega"><strong class="asterisk-required">*</strong> Fecha de Entrega</label>
                                <input type="date" name="entrega" class="form-control" id="dateEntrega" required/>
                                <div class="invalid-feedback">
                                    Debe selecccionar fecha de entrega.
                                </div>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="selectPrioridad"><strong class="asterisk-required">*</strong> Prioridad</label>
                                <select id="selectPrioridad" name="prioridad" class="custom-select mr-sm-2">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="custom-control custom-checkbox my-1 mr-sm-2">
                                <input type="checkbox" name="estado" class="custom-control-input" id="checkEstado">
                                <label class="custom-control-label" for="checkEstado">Activa</label>
                            </div>
                        </div>

                        <section>
                            <label class="required"><strong>* Campo requerido</strong></label>
                        </section>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btn_close" type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                <button id="btn_action" type="submit" class="btn btn-success" form="formPA"></button>
            </div>
        </div>
    </div>
</div>