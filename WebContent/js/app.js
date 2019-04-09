$(document).ready(function () {

    var pactividades = $('#pactividades').DataTable( {
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
/*        buttons: [
            {
                name: 'new',
                text: 'Nuevo',
                action: function ( e, dt, node, config ) {
                   alert("Click Nuevo");
                }
            },
            {
                name: 'edit',
                text: 'Editar',
                action: function ( e, dt, node, config ) {
                    alert("Click Editar");
                }
            },
            {
                name: 'delete',
                text: 'Eliminar',
                action: function ( e, dt, node, config ) {
                    alert("Click Eliminar");
                }
            }
        ]*/
    } );

/*    pactividades.buttons(0, 'edit:name').disable();
    pactividades.buttons(0, 'delete:name').disable();

    /!*pactividades.buttons(0, 'edit:name').addClass("btn-success");
    pactividades.buttons(0, 'delete:name').addClass("btn-danger");*!/

    pactividades.buttons(0, null).container().appendTo('#buttons_crud', pactividades.table().container());

    */
/*    var bedit = $( "#bedit" );
    var bdelete = $( "#bdelete" );

    bedit.prop( "disabled", true );
    bdelete.prop( "disabled", true );

    bedit.on("click", function () {
        var proyectos_actividades = {};

        proyectos_actividades["nombre_proyecto"] = rowData[0][1];
        proyectos_actividades["nombre_actividad"] = rowData[0][2];
        proyectos_actividades["username"] = rowData[0][3];
        proyectos_actividades["fecha_entrega"] = rowData[0][5];
        proyectos_actividades["prioridad"] = rowData[0][7];

        var xmlString = rowData[0][8];
        doc = new DOMParser().parseFromString(xmlString, "text/xml");

        if (doc.firstChild.innerHTML === "Activa") {
            proyectos_actividades["estado"] = "1";
        } else if (doc.firstChild.innerHTML === "No Activa") {
            proyectos_actividades["estado"] = "0";
        }

        $.ajax({
            url : "ProyectosActividades?action=index",  //your servlet or jsp name/path
            type: "POST",
            data : proyectos_actividades,
            success: function(data, textStatus, jqXHR)
            {
                //data - response from server
                console.log("response..:" + data);
            },
            error: function (data, jqXHR, textStatus, errorThrown)
            {
                console.log("error..." + rowData);
            }
        });

    });

    bdelete.on("click", function () {
        console.log(rowData)
    });

    pactividades
        .on( 'select', function ( e, dt, type, indexes ) {
            rowData = pactividades.rows( indexes ).data().toArray();
            $( "#bedit" ).prop( "disabled", false );
            $( "#bdelete" ).prop( "disabled", false );
            //console.log(JSON.stringify( rowData ));
        } )
        .on( 'deselect', function ( e, dt, type, indexes ) {
            rowData = null;
            $( "#bedit" ).prop( "disabled", true );
            $( "#bdelete" ).prop( "disabled", true );
        } );*/
});