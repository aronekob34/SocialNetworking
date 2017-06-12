$(document).on('ready page:load', function() {
    $('#buttonSearch').click(function (event) {
        event.preventDefault()
        $('#advancedSearch').slideToggle("slow");
    });
});