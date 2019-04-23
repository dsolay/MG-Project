$.fn.select2.defaults.set( "theme", "bootstrap4" );

selectPriority.select2({
    dropdownParent: $('#addUpdateProyectosActividades'),
});

selectUserProject.select2({
    placeholder: {
        id: '-1',
        text: 'Eliga un usuario'
    },
    allowClear: true
});

/*selectProject.select2({
    dropdownParent: $('#addUpdateProyectosActividades'),
    placeholder: {
        id: '-1', // the value of the option
        text: 'Eliga un proyecto'
    },
    ajax: {
        url: 'Proyectos?action=ajax',
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
                        text: value.nombre_proyecto
                    })
                });
            }
            return {
                results: arr
            };
        }
    }
});*/

selectUser.select2({
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