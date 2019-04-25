$(function () {
    var btnInfo     = $('#btn_info'),
        btnAdd      = $('#btn_add'),
        btnUpdate   = $('#btn_update'),
        btnDelete   = $('#btn_delete');

// Form
    var formPA = $('#formPA');

// Datatable
    var dTablePA = $('#pro');

// Breadcum
    var liSearch = $('#searchProject');

// Modal Info
    var modalTitle          = $('#addUpdateProyectosActividadesLabel'),
        idProject           = $('#id_proyecto'),
        nameProject         = $('#nombre_proyecto'),
        userProject         = $('#usuario_proyecto'),
        desProject          = $('#descripcion_proyecto'),
        idProjectActivity   = $('#id_proyecto_actividad'),
        nameActivity        = $('#nombre_actividad'),
        userActivity        = $('#usuario_actividad'),
        priority            = $('#prioridad'),
        state               = $('#estado'),
        deliver             = $('#entrega'),
        remaining           = $('#restante');

// Modal
    var modalPAAddUpdate = $('#addUpdateProyectosActividades'),
        modalPAInfo      = $('#infoProyectosActividades'),
        modalPADelete    = $('#deleteProyectosActividades');

// Modal Add, Update and Delete
    var action                      = $('#action'),
        btnAction                   = $('#btn_action'),
        idPA                        = $('#idPA'),
        inputActivity               = $('#inputActividad'),
        selectUserPA                = $('#selectUserPA'),
        dateDeliver                 = $('#dateEntrega'),
        selectPriority              = $('#selectPrioridad'),
        checkState                  = $('#checkEstado'),
        inputDeleteIDPA             = $('#inputIDDeletePA'),
        idDeletePA                  = $('#idDeletePA'),
        inputDeleteActivityPA       = $('#actividadDeletePA');

    btnAdd.on("click", function () {
        action.val('add');
        btnAction.text('Agregar');
        modalTitle.text('Agregar Actividad');
    });

    btnInfo.on("click", function () {
        buttonClick = true;

        idProject.text(rowData["id_proyecto"]);
        nameProject.text(rowData["proyecto"]);
        userProject.text(rowData["usuario_proyecto"]);
        desProject.text(rowData["descripcion_proyecto"]);

        idProjectActivity.text(rowData["id"]);
        nameActivity.text(rowData["actividad"]);
        userActivity.text(rowData["usuario_actividad"]);
        priority.text(rowData["prioridad"]);

        if (parseInt(rowData["estado"]) === 1) {
            state.removeClass('badge-danger');
            state.addClass('badge-success');
            state.text("Activa");
        } else {
            state.removeClass('badge-success');
            state.addClass('badge-danger');
            state.text("No Activa");
        }

        deliver.text(rowData["entrega"]);

        var timeRemaining = parseInt(rowData["restante"]);

        remaining.removeClass('badge-danger');
        remaining.removeClass('badge-primary');
        remaining.removeClass('badge-warning');
        remaining.removeClass('badge-info');

        if ( timeRemaining === 0) {
            remaining.addClass('badge-primary');
            remaining.text("Finalizada");
        } else if( timeRemaining === 1) {
            remaining.addClass('badge-danger');
            remaining.text(timeRemaining + " día");
        } else if ( timeRemaining > 3) {
            remaining.addClass('badge-info');
            remaining.text(timeRemaining + " días");
        } else if (timeRemaining > 1) {
            remaining.addClass('badge-warning');
            remaining.text(timeRemaining + " días");
        }
    });

    btnUpdate.on("click", function () {
        buttonClick = true;

        action.val('update');
        btnAction.text('Actualizar');

        modalTitle.text('Actualizar Actividad');

        idPA.val(rowData['id']);
        inputActivity.val(rowData['actividad']);
        inputActivity.text(rowData['actividad']);
        selectUserPA.append(new Option(rowData['usuario_actividad'], rowData['id_usuario'], true, true)).trigger('change');
        dateDeliver.val(rowData['entrega']);
        selectPriority.val(rowData['prioridad']).trigger('change');

        if (rowData['estado'] === "1") {
            checkState.prop("checked", true);
        } else {
            checkState.prop("checked", false);
        }
    });

    btnDelete.on("click", function () {
        buttonClick = true;

        inputDeleteIDPA.val(rowData['id']);
        idDeletePA.text(rowData['id']);

        inputDeleteActivityPA.text(rowData['actividad']);
    });

    modalPAAddUpdate.on('hidden.bs.modal', function (e) {
        formPA.removeClass('was-validated');
        formPA.trigger("reset").change();

        inputActivity.val("");
        selectUserPA.val('').trigger('change');
        dateDeliver.val("");
        selectPriority.val("1").trigger('change');
        checkState.prop("checked", true);

        buttonClick = false;

        setProperty('.btn-crud-actions', 'disabled', true);
    });

    modalPADelete.on('hidden.bs.modal', function () {
        setProperty('.btn-crud-actions', 'disabled', true);

        buttonClick = false;
    });

    modalPAInfo.on('hidden.bs.modal', function () {
        setProperty('.btn-crud-actions', 'disabled', true);

        buttonClick = false;
    });

    $('div.modal-footer > button.btn.btn-secondary').on("click", function () {
        setProperty('.btn-crud-actions', 'disabled', true);

        buttonClick = false;
    });

    dTablePA = dTablePA.DataTable({
        select: {
            style: 'single',
            blurable: true
        },
        serverSide: true,
        processing: true,
        deferLoading: 0,
        ajax: {
            url: "ProyectosActividades?action=ajax",
            data: function ( d ) {
                return $.extend( {}, d, {
                    "project": liSearch.val()
                });
            },
            type: "GET"
        },
        columns: [
            {data: 'id'},
            {data: 'actividad'},
            {data: 'entrega'},
            {data: 'usuario_actividad'},
            {data: 'proyecto'},
            {data: 'usuario_proyecto'},
            {data: 'prioridad'},
            {data: 'estado'},
            {data: 'id_usuario'},
            {data: 'id_proyecto'},
            {data: 'descripcion_proyecto'}
        ],
        columnDefs: [
            {
                "targets": [4],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [5],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [6],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [7],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [8],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [9],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [10],
                "visible": false,
                "searchable": false
            }
        ]
    });

    dTablePA.search( '' ).draw();

    dTablePA
        .on( 'select', function ( e, dt, type, indexes ) {
            setProperty('.btn-crud-actions', 'disabled', false);

            rowData = ArraytoJson(dTablePA.rows( indexes ).data().toArray())[0];
        })
        .on( 'deselect', function ( e, dt, type, indexes ) {
            if (!buttonClick) {
                setProperty('.btn-crud-actions', 'disabled', true);
            }
            rowData = null;
        } );

    selectPriority.select2({
        dropdownParent: $('#addUpdateProyectosActividades'),
    });

    selectUserPA.select2({
        dropdownParent: $('#addUpdateProyectosActividades'),
        placeholder: {
            id: '-1', // the value of the option
            text: 'Eliga un usuario'
        },
        ajax: {
            url: 'Usuario?action=ajax',
            dataType: 'json',
            type: "GET",
            delay: 250,
            data: function (params) {
                return {
                    search: params.term,
                    type: 'public'
                };
            },
            processResults: function (data) {
                var arr = [];
                if (data.data !== null) {
                    $.each(data.data, function (index, value) {
                        arr.push({
                            id: value.id,
                            text: value.nombres + ', ' + value.apellidos
                        })
                    });
                }
                return {
                    results: arr
                };
            }
        }
    });
});