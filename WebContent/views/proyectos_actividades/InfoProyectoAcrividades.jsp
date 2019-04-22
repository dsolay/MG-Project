<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/17/19
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- Modal info -->
<div class="modal fade" id="infoProyectosActividades" tabindex="-1" role="dialog" aria-labelledby="infoProyectosActividadesLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="infoProyectosActividadesLabel">Información Detallada</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid form_modal">
                    <div class="accordion" id="accordionInfoPA">
                        <div class="card">
                            <div class="card-header" id="headingOne">
                                <h2 class="row mb-0">
                                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseProject" aria-expanded="true" aria-controls="collapseProject">
                                        Proyecto
                                    </button>
                                </h2>
                            </div>

                            <div id="collapseProject" class="collapse" aria-labelledby="headingOne" data-parent="#accordionInfoPA">
                                <div class="card-body">
                                   <div class="row">
                                       <div class="col-12 body_info">
                                           <label>
                                               ID
                                               <p><span id="id_proyecto" class="badge badge-secondary"></span></p>
                                           </label>
                                           <label>
                                               Nombre
                                               <p><span id="nombre_proyecto" class="badge badge-secondary"></span></p>
                                           </label>
                                           <label>
                                               Encargado
                                               <p><span id="usuario_proyecto" class="badge badge-secondary"></span></p>
                                           </label>
                                           <label>
                                               Descripción
                                               <p><span id="descripcion_proyecto" class="badge badge-secondary large_text"></span></p>
                                           </label>
                                       </div>
                                   </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingTwo">
                                <h2 class="row mb-0">
                                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseActivity" aria-expanded="false" aria-controls="collapseActivity">
                                        Actividad
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseActivity" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionInfoPA">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12 body_info">
                                            <label>
                                                ID
                                                <p><span id="id_proyecto_actividad" class="badge badge-secondary"></span></p>
                                            </label>
                                                Actividad
                                                <p><span id="nombre_actividad" class="badge badge-secondary large_text"></span></p>
                                            </label>
                                            <label>
                                                Asignado a
                                                <p><span id="usuario_actividad" class="badge badge-secondary"></span></p>
                                            </label>
                                            <label>
                                                Prioridad
                                                <p><span id="prioridad" class="badge badge-secondary"></span></p>
                                            </label>
                                            <label>
                                                Estado
                                                <p><span id="estado" class="badge"></span></p>
                                            </label>
                                            <label>
                                                Fecha de entrega
                                                <p><span id="entrega" class="badge badge-secondary"></span></p>
                                            </label>
                                            <label>
                                                Tiempo restante
                                                <p><span id="restante" class="badge"></span></p>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
