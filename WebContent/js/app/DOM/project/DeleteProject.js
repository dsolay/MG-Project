$(function () {
    //Elementos de la vista proyecto
    var breadcrumbParentProject         = $('.breadcrumbParentProject');
    var breadcrumbDeleteProject         = $('#breadcrumbDeleteProject');
    var warningDeleteProject            = $('#warningDeleteProject');
    var questionDeleteProject           = $('#QuestionDeleteProject');
    var btnCancelProject                = $('.btnCancelProject');
    var btnDeleteProject                = $('#btnDeleteProject');

//Seteamos contenido

    breadcrumbParentProject.text(proyecto.breadcrumbParentProject);
    btnCancelProject.text(proyecto.btnCancel);

    breadcrumbDeleteProject.text(deleteProyecto.breadcrumbDeleteProject);
    questionDeleteProject.text(deleteProyecto.msgQuestioDelete);
    warningDeleteProject.text(deleteProyecto.msgWarnigDelete);
    btnDeleteProject.text(deleteProyecto.btnDelete);
});