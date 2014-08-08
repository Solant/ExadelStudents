
$(document).ready(function(){
    $('tr:not(.notLinking)').bind('click', function(){ window.location = $('a:first', this).attr('href');
    });
});