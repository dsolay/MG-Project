$(function () {
    //Elementos de la vista proyecto
    var fieldRequired                = $('.fieldRequired');
    var breadcrumbParentProject      = $('.breadcrumbParentProject');
    var breadcrumbAddProject         = $('#breadcrumbAddProject');
    var labelProject              = $('#labelProject');
    var labelDescription          = $('#labelDescription');
    var labelUser                 = $('#labelUser');
    var invalidFeddbackProject       = $('.invalidFeddbackProject');
    var invalidFeddbackDescription   = $('.invalidFeddbackDescription');
    var invalidFeddbackUser          = $('.invalidFeddbackUser');
    var btnCancelProject             = $('.btnCancelProject');
    var btnAddProject                = $('#btnAddProject');
    var selectUserAddProject         = $('#selectUserAddProject');


//Seteamos contenido
    fieldRequired.text(msgfieldRequired);

    breadcrumbParentProject.text(proyecto.breadcrumbParentProject);
    btnCancelProject.text(proyecto.btnCancel);
    invalidFeddbackProject.text(proyecto.msgInvalidFeddbackProject);
    invalidFeddbackDescription.text(proyecto.msgInvalidFeddbackDescription);
    invalidFeddbackUser.text(proyecto.msgInvalidFeddbackUser);

    breadcrumbAddProject.text(addProyecto.breadcrumbAddProject);
    labelProject.text(proyecto.labelProject);
    labelDescription.text(proyecto.labelDescription);
    labelUser.text(proyecto.labelUser);
    btnAddProject.text(addProyecto.btnAdd);

    selectUserAddProject.select2({
        placeholder: {
            id: '-1',
            text: 'Eliga un usuario'
        },
        allowClear: true
    });
});