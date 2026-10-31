
function ReverseColl(sender) {
    for (var i = 1; i < sender.parentNode.children.length; i++) {
        if (sender.parentNode.children[i].innerHTML == "ورود")
            sender.parentNode.children[i].innerHTML = "خروج";
        else sender.parentNode.children[i].innerHTML = "ورود";
    }
}
var lastFocus;
function SetlastFocus(sender) {
    if (lastFocus != null)
        lastFocus.style.backgroundColor = 'White';

    lastFocus = sender;

    if (lastFocus != null)
        lastFocus.style.backgroundColor = 'Yellow';
}
var StartTime = null, EndTime = null;
function SetTime(sender) {
    if (lastFocus != null) {
        if (lastFocus.name.indexOf("Start") != -1) {
            if (EndTime != null && EndTime.cellIndex > -1 && sender.cellIndex >= EndTime.cellIndex) {
                alert("ساعت شروع نمی تواند از ساعت پایان بزرگتر باشد");
                return;
            }
            StartTime = sender;

            for (var i = 1; i < sender.parentNode.children.length; i++) {
                sender.parentNode.children[i].style.backgroundColor = 'Blue';
            }
            sender.style.backgroundColor = 'Green';


        } else if (lastFocus.name.indexOf("End") != -1) {
            if (StartTime != null && sender.cellIndex <= StartTime.cellIndex) {
                alert("ساعت پایان نمی تواند از ساعت شروع کوچکتر باشد");
                return;
            }
            EndTime = sender;
        }

        lastFocus.value = sender.innerHTML;

    }

}

function Center() {
    var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
    var height = document.documentElement.clientHeight + document.documentElement.scrollTop;

    var top = ((height + document.documentElement.scrollTop) / 2) - ($('#centerdiv').height() / 2) + "px";

    var left = (width / 2) - ($('#centerdiv').width() / 2) + "px";
    $('#centerdiv').css({ position: "absolute", top: top, left: left });
}

$(document).ready(function () {
    Init();
});
$(document).ready(function () {
    $(".RedDatagridItem").filter(function () {
        return $('td', this).length && !$('table', this).length;
    }).css({ background: "#ffffff" }).hover(
        function () { $(this).css({ background: "#C1DAD7" }); },
        function () { $(this).css({ background: "#ffffff" }); }
        );

    // $(document).tooltip();

    $(".RedDatagridAlternate").filter(function () {
        return ($('td', this).length && !$('table', this).length);
    }).css({ background: "#edf5ff" }).hover(
        function () { $(this).css({ background: "#C1DAD7" }); },
        function () { $(this).css({ background: "#edf5ff" }); }
        );
});
