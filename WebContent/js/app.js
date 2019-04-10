$(document).ready(function () {

    var dtable = $('#dtable').DataTable( {
        "autoWidth": false,
        responsive: true,
        "language": {
            "lengthMenu": "Mostrar _MENU_ ",
            "zeroRecords": "Datos no encontrados - upss",
            "info": "Mostar paginas _PAGE_ de _PAGES_",
            "infoEmpty": "Datos no encontrados",
            "infoFiltered": "(Filtrados por _MAX_ total registros)",
            "search":         "Buscar:",
            "paginate": {
                    "first":      "Primero",
                    "last":       "Anterior",
                    "next":       "Siguiente",
                    "previous":   "Anterior"
            }
        }
    } );
});