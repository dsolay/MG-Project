$(function () {
    //Elementos de la vista proyecto
    var fieldRequired = $('.fieldRequired');

    var breadcrumbParentProject         = $('.breadcrumbParentProject');
    var breadcrumbUpdateProject         = $('#breadcrumbUpdateProject');
    var labelProject                    = $('#labelProject');
    var labelDescription                = $('#labelDescription');
    var labelUser                       = $('#labelUser');
    var invalidFeddbackProject          = $('.invalidFeddbackProject');
    var invalidFeddbackDescription      = $('.invalidFeddbackDescription');
    var invalidFeddbackUser             = $('.invalidFeddbackUser');
    var btnCancelProject                = $('.btnCancelProject');
    var btnUpdateProject                = $('#btnUpdateProject');
    var selectUserUpdateProject         = $('#selectUserUpdateProject');


//Seteamos contenido
    fieldRequired.text(msgfieldRequired);

    breadcrumbParentProject.text(proyecto.breadcrumbParentProject);
    btnCancelProject.text(proyecto.btnCancel);
    invalidFeddbackProject.text(proyecto.msgInvalidFeddbackProject);
    invalidFeddbackDescription.text(proyecto.msgInvalidFeddbackDescription);
    invalidFeddbackUser.text(proyecto.msgInvalidFeddbackUser);

    breadcrumbUpdateProject.text(updateProyecto.breadcrumbUpdateProject);
    labelProject.text(proyecto.labelProject);
    labelDescription.text(proyecto.labelDescription);
    labelUser.text(proyecto.labelUser);
    btnUpdateProject.text(updateProyecto.btnUpdate);

    selectUserUpdateProject.select2({
        placeholder: {
            id: '-1',
            text: 'Eliga un usuario'
        },
        allowClear: true
    });
});