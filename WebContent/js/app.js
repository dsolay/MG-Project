$.getMultiScripts = function(arr, path) {
    var _arr = $.map(arr, function(scr) {
        return $.getScript( (path||"") + scr );
    });

    _arr.push($.Deferred(function( deferred ){
        $( deferred.resolve );
    }));

    return $.when.apply($, _arr);
};

var script_arr = [
    'functions.js',
    'DOMElements.js',
    'globalVariables.js',
    'my-login.js',
    'datatable.js',
    'select2PA.js'
];

$.getMultiScripts(script_arr, './js/plugins/').done(function() {
    $('[data-tooltip="tooltip"]').tooltip();

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
