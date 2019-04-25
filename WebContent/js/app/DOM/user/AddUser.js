$(function () {
    var selectTypeUserAdd   = $('#selectTypeUserAdd');

    selectTypeUserAdd.select2({
        placeholder: {
            id: '-1',
            text: 'Eliga un usuario'
        },
        allowClear: true
    });
});