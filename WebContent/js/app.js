$.getMultiScripts = function(arr, path) {
    var _arr = $.map(arr, function(scr) {
        return $.getScript( (path||"") + scr );
    });

    _arr.push($.Deferred(function( deferred ){
        $( deferred.resolve );
    }));

    return $.when.apply($, _arr);
};

function enableButtonsActions() {
    btnInfo.prop('disabled', false);
    btnUpdate.prop('disabled', false);
    btnDelete.prop('disabled', false);
}

function disableButtonsActions() {
    btnInfo.prop('disabled', true);
    btnUpdate.prop('disabled', true);
    btnDelete.prop('disabled', true);
}

var script_arr = [
    'DOMElements.js',
    'login.js',
    'datatable.js',
    'select2PA.js'
];

$.getMultiScripts(script_arr, './js/plugins/').done(function() {

    var rowData;
    var buttonClick = false;

    btnAdd.on("click", function () {
        action.val('add');
        btnAction.text('Agregar');
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

        idPA.val(rowData['id']);
        /*projectId.val(rowData['id_proyecto']);
        projectName.val(rowData['proyecto']);*/
        inputActivity.val(rowData['actividad']);
        inputActivity.text(rowData['actividad']);
        selectUser.append(new Option(rowData['usuario_actividad'], rowData['id_usuario'], true, true)).trigger('change');
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
        selectUser.val('').trigger('change');
        dateDeliver.val("");
        selectPriority.val("1").trigger('change');
        checkState.prop("checked", true);

        disableButtonsActions();

        buttonClick = false;
    });

    modalPADelete.on('hidden.bs.modal', function () {
        disableButtonsActions();

        buttonClick = false;
    });

    modalPAInfo.on('hidden.bs.modal', function () {
        btnInfo.prop('disabled', true);
        btnUpdate.prop('disabled', true);
        btnDelete.prop('disabled', true);

        buttonClick = false;
    });

    $('div.modal-footer > button.btn.btn-secondary').on("click", function () {
        $('#btn_view').prop('disabled', true);
        $('#btn_update').prop('disabled', true);
        $('#btn_delete').prop('disabled', true);

        buttonClick = false;
    });

    dTablePA.search( '' ).draw();

    dTablePA
        .on( 'select', function ( e, dt, type, indexes ) {
            enableButtonsActions();

            rowData = JSON.stringify(dTablePA.rows( indexes ).data().toArray()[0]);
            rowData = JSON.parse(rowData);
        })
        .on( 'deselect', function ( e, dt, type, indexes ) {
            if (!buttonClick) {
                disableButtonsActions();
            }
            rowData = null;
        } );

    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
});
