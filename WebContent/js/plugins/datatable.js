$.extend( true, $.fn.dataTable.defaults, {
    searching: true,
    ordering: true,
    autoWidth: false,
    responsive: true,
    paging: true,
    filter: true,
    language: {
        "lengthMenu": "Mostrar _MENU_ ",
        "zeroRecords": "Datos no encontrados - upss",
        "info": "Mostar paginas _PAGE_ de _PAGES_",
        "infoEmpty": "Datos no encontrados",
        "infoFiltered": "(Filtrados por _MAX_ total registros)",
        "search": "Buscar:",
        "paginate": {
            "first": "Primero",
            "last": "Anterior",
            "next": "Siguiente",
            "previous": "Anterior"
        }
    }
} );

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
               "project": liSearch.text().toLowerCase()
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

dTableProjects = dTableProjects.DataTable();
dTableTypeUsers = dTableTypeUsers.DataTable();
dTableUser = dTableUser.DataTable();

