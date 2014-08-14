
$(document).ready(function(){
    $('table').on('click', 'tr:not(.notLinking)', function(){
        if (window.location = $('a:first', this).attr('href').toString() != "undefined")
            window.location = $('a:first', this).attr('href');
    });
});
