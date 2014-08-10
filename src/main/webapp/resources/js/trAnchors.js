
$(document).ready(function(){
    $('tr:not(.notLinking)').bind('click', function(){
        if (window.location = $('a:first', this).attr('href').toString() != "undefined")
            window.location = $('a:first', this).attr('href');
    });
});