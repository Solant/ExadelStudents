$(document).ready(function () {
    var keyPressed = false;
    var timeoutInProgress = false;

    var delay = (function () {
        var timer = 0;
        return function (callback, ms) {
            clearTimeout(timer);
            timer = setTimeout(callback, ms);
        };
    })();

    $('#search').keyup(function () {
        $('#search').removeClass('errorBG');
        $('#search').addClass('normalBG');
        delay(function () {
            liveSearch();
        }, 300);
    });
});

function liveSearch() {

    var searchResult = $('#searchResult');
    var searchRequest = $('#search').val();
    if (searchRequest.length == 0) {
        searchResult.empty();
        searchResult.addClass('disappear');
        return;
    }


    /*var url="http://www.json-generator.com/api/json/get/cqQcvGyfTm?indent=2";*/

    var url = "/admin/liveSearch?initials=" + searchRequest;
    $.get(url, function (data) {
        searchResult.empty();
        searchResult.addClass('show');

        var results= false;

        $.each(data, function (index, human) {
            results=true;
            var anchor = $('<a/>');
            anchor.attr("href", "/admin/studentPage/"+human.login);
            anchor.text(human.secondName + " " + human.firstName);
            anchor.addClass('list-group-item');
            anchor.addClass('resultingAnchors');
            searchResult.append(anchor);
        })

        if(results==false){
            $('#search').addClass('errorBG');
        }

        timePassed = false;

    });
}

function removeOptions(selectbox) {
    var i;
    for (i = selectbox.options.length - 1; i >= 0; i--) {
        selectbox.remove(i);
    }
}

$(document).ready(function () {
    $('#techList').change(
        function () {
            var url = "feedbackersForTechnology?technology=" + document.getElementById("techList").value;
            $.get(url, function (data) {
                var select = document.getElementById("feedbackers");
                removeOptions(select);

                var obj = data;

                $.each(data, function (index, feedbacker) {
                    var option = document.createElement("option");
                    option.text = feedbacker.secondName;
                    option.value = feedbacker.login;
                    select.add(option);
                })
            });
        }
    )
});

$(document).ready(function () {
    if ($(document).find("title").text() == 'Login')
        return;
    getNumberOfNotifications();
    setInterval(getNumberOfNotifications, 5000);
})

function getNumberOfNotifications(){

    var numberOfNotifications = $('#numberOfNotifications');
    var src = "/notif/update";

    $.get(src, function (data) {
        if (data == 0){
            numberOfNotifications.addClass('disappear');
        }
        else{
            numberOfNotifications.addClass('show');
            numberOfNotifications.empty();
            numberOfNotifications.append(data.toString());
        }
    });
}

// Fill field form

function visual() {
    var values = $('#needOption');

    if (document.getElementsByName('type')[3].checked || document.getElementsByName('type')[4].checked) {
        values.css(show);
    }
    else {
        values.css(remove);
    }

    var valueTypeSelect = document.getElementById("valueType")
    if (document.getElementsByName('type')[2].checked||
        document.getElementsByName('type')[3].checked||
        document.getElementsByName('type')[4].checked) {
        valueTypeSelect.disabled = true;
        valueTypeSelect.options[0].selected = true;
    }
    else {
        valueTypeSelect.disabled = false;
    }

}

$(document).ready(function () {
    $('#oldField').change(
        function () {
            var url = "/admin/showField?field=" + document.getElementById("oldField").value;
            $.get(url, function (data) {
                var groupSelect = document.getElementById("existingGroups");
                groupSelect.value = data.groupName;

                var typeRadio = document.getElementById(data.type);
                typeRadio.checked = true;

                var possibleValuesArea = document.getElementById("value");
                possibleValuesArea.value = data.possibleValues;
                visual();


                var valueType = document.getElementById("valueType");
                valueType.value = "any";
                if(data.valueType!=null){
                    var valueType = document.getElementById("valueType");
                    valueType.value = data.valueType;
                }

            });
        }
    )
});


$(document).ready(function () {
    $('#oldGroup').change(
        function () {
            var url = "/admin/showGroup?group=" + document.getElementById("oldGroup").value;
            $.get(url, function (data) {
                var groupSelect = document.getElementById("newGroupStatus");
                groupSelect.value = data;
        });
        }
    )
});

$(document).ready(function () {
    $('input').on('input', function(){
        var edited = $(this);
        if (edited.attr('id') == 'search' || $('.group').size() == 0)
            return;
        var submit = edited.closest('form').find(':submit');
        //var attrId = edited.attr('id');
        attrId = edited.attr('id').replace('\.value', '.attribute');
        var attrName = document.getElementById(attrId).value;
        var url = "/getRegexpByAttrName?attr=" + attrName;
        $.get(url, function (data) {
            var regexp = new RegExp(data, 'g');
            if (!regexp.test(edited.val())) {
                edited.css('border-color', 'red');
                edited.css('outline-color', 'red');
                submit.attr('disabled', 'disabled');
                submit.css('opacity', '0.5');
            }
            else {
                edited.css('border-color', '');
                edited.css('outline-color', '');
                submit.removeAttr('disabled');
                submit.css('opacity', '1');
            }
        });
    });
});

$(document).ready(function(){
    $('select').each(function(index){
        var options = $(this).find('option');
        options.sort(function(a,b){
            return a.value.localeCompare(b.value);
        });
        $(this).html(options);
    });
});

$(document).ready(function(){
    if (localStorage.getItem('message').toString() != 'null') {
        alert(localStorage.getItem('message'));
        localStorage.setItem('message', 'null');
    }
    $('.blue').on('click', function() {
        if($(this).attr('value') != 'Login' && $(this).text() != 'Form table')
            localStorage.setItem('message', 'Saved');
    });
});