/**
 * Created by Administrator on 06.08.2014.
 */
$(document).ready(function(){
    var keyPressed = false;
    var timeoutInProgress = false;

    var delay = (function(){
    var timer = 0;
    return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
    };
    })();

    $('#search').keyup(function(){
    delay(function(){
    liveSearch();
    }, 1000 );
    });
    });
function liveSearch(){
    var remove={display: "none"}
    var show={display: "block"}

    var searchResult=$('#searchResult');
    var searchRequest=$('#search').val();
    if(searchRequest.length==0){
    searchResult.empty();
    searchResult.css(remove);
    return;
    }

    var url="http://www.json-generator.com/api/json/get/cqQcvGyfTm?indent=2";

    /* var url="controller?initials="+searchRequest;*/
    $.get( url , function( data ) {
    searchResult.empty();
    searchResult.css(show);

    var obj= data;

    $.each(data["humans"], function(index, human){
    var anchor=$('<a/>');
    anchor.attr("href",human.id);
    anchor.text(human.lastName+" "+human.firstName);
    anchor.addClass('list-group-item');
    searchResult.append(anchor);
    })

    timePassed = false;

    });
    }

function removeOptions(selectbox)
{
    var i;
    for(i=selectbox.options.length-1;i>=0;i--)
    {
        selectbox.remove(i);
    }
}

$(document).ready(function(){
    $('#techList').change(
        function(){
            var url="controller?tech="+document.getElementById("techList").value;
            $.get( url , function( data ) {
                var select=document.getElementById("feedbackers");
                removeOptions(select);

                var obj= data;

                $.each(data["feedbackers"], function(index, feedbacker){
                    var option = document.createElement("option");
                    option.text=feedbacker.lastName;
                    option.value=feedbacker.login;
                    select.add(option);
                })
            });
        }
    )
});