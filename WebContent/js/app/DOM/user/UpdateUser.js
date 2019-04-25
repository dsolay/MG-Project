$(function () {
    var selectTypeUserUpdate = $('#selectTypeUserUpdate');

    selectTypeUserUpdate.select2({
        placeholder: {
            id: '-1',
            text: 'Eliga un usuario'
        },
        allowClear: true
    });
});