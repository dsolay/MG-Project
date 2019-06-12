$(function() {
    $('[data-tooltip="tooltip"]').tooltip();

    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });

    $('#logout').click(function () {
        var context = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
        document.location.href = window.location.protocol + "//" + window.location.host + context;
    });
});
