$.extend( true, $.fn.dataTable.defaults, {
    searching: true,
    ordering: true,
    autoWidth: false,
    responsive: true,
    paging: true,
    filter: true,
    lengthMenu: [[5, 10, 20, -1], [5, 10, 20, "All"]],
    pageLength: 5,
    language: {
        "lengthMenu": "Mostrar _MENU_ ",
        "zeroRecords": "Datos no encontrados - upss",
        "info": "Mostar páginas _PAGE_ de _PAGES_",
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



