//************ Start Timer
var TimerRunning = false, TimerID, MnuRequestsList, MenuParallelApproveList;

function Init() //call the Init function when u need to start the timer
{
    StopTimer();
    StartTimer();
}
function StartTimer() {
    TimerRunning = true;
    TimerID = self.setTimeout("StartTimer()", 6000);

    //if (MnuRequestsList == null)
    //    MnuRequestsList = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_header');
    //if (MnuRequestsList != null) {
    //    GetMessages();
        
    //}
    if (MenuParallelApproveList == null)
        MenuParallelApproveList = document.getElementById('ctl00_Menu1_MenuEmployee_MenuParallel_header');
    if (MenuParallelApproveList != null) {
        GetMessagesParallel();
        
    }

}
function StopTimer() {
    if (TimerRunning)
        clearTimeout(TimerID);
    TimerRunning = false;
}

function GetKartableCount() {

    $.ajax({
        type: "POST",
        url: window.currentLocationResolve + "/GetKartableCount",
        contentType: "application/json; charset=utf-8",
        data: "{'tracking_num': '" + document.getElementById('ctl00_Edit_AlertData').value + "'}",
        dataType: "json",
        success: function (date) {
            GetKartableCount_CallBack(date);
        },
        error: Failed
    });
}
function GetKartableCount_CallBack(result) {
    if (result.d != null && result.d != "") {

        if (result.d.IsHaveError)
            return;

        var menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_content_Menu_RequestsList');
        if (menu != null)
            menu.innerHTML = " بررسی نشده ( " + result.d.RequestCount + " )";

        menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_content_Menu_RequestsApprove');
        if (menu != null)
            menu.innerHTML = " تایید شده ( " + result.d.ApproveCount + " )";

        menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_content_Menu_RequestsReject');
        if (menu != null)
            menu.innerHTML = " رد شده ( " + result.d.RejectCount + " )";

        menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_content_Menu_RequestsExpire');
        if (menu != null)
            menu.innerHTML = " تاریخ گذشته ( " + result.d.ExpireCount + " )";

        menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_content_Menu_RequestsMoveUp');
        if (menu != null)
            menu.innerHTML = " ارجاع شده ( " + result.d.MoveUpCount + " )";

        menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_content_Menu_RequestsCancel');
        if (menu != null)
            menu.innerHTML = " درخواست های ابطال ( " + result.d.CancelCount + " )";

        menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_content_Menu_RequestsComments');
        if (menu != null)
            menu.innerHTML = " اظهار نظر شده ( " + result.d.ReviewCount + " )";
    }
}

function GetMessages() {
    if ($('#msg1').is(":hidden")) {
        $.ajax({
            type: "POST",
            url: window.currentLocationResolve + "/GetMessage",
            contentType: "application/json; charset=utf-8",
            data: "{'tracking_num': '" + document.getElementById('ctl00_Edit_AlertData').value + "'}",
            dataType: "json",
            success: function (date) {
                GetMessages_CallBack(date);
            },
            error: Failed
        });
    }
}
function GetMessages_CallBack(result) {
    if (result.d != null && result.d != "") {
        PlaySound();

        if ($('#msg1').is(":hidden")) {
            $("#modalbody").text("(" + result.d + ")");
            $('#msg1').notificationmsg({ animation: 'slide' });
            $('#msg1').notificationmsg('show');
        }
        GetKartableCount();
    }
}

function CheckKartablParallel() {
    $.ajax({
        type: "POST",
        url: window.currentLocationResolve + "/GetKartableParallelCount",
        contentType: "application/json; charset=utf-8",
        data: "{'tracking_num': '" + document.getElementById('ctl00_Edit_AlertData').value + "'}",
        dataType: "json",
        success: function (date) {
            CheckKartablParallel_CallBack(date);
        },
        error: Failed
    });
}
function CheckKartablParallel_CallBack(result) {
    if (result.d != null && result.d != "") {
        var menuTitle = '';
        var menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuParallel_content_Menu_ParallelApproveList');
        if (menu != null) {
            menuTitle = " بررسی نشده ( " + result.d.RequestCount + " )";
            if (menuTitle.trim() != menu.innerHTML.trim()) {
                menu.innerHTML = menuTitle;
                //if (window.location.pathname + window.location.search == "/ParallelApproveList.aspx?RSP=0")
                //    window.location.reload(true);
            }
        }

        menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuParallel_content_Menu_ParallelApprove');
        if (menu != null)
            menu.innerHTML = " تایید شده ( " + result.d.ApproveCount + " )";

        menu = document.getElementById('ctl00_Menu1_MenuEmployee_MenuParallel_content_Menu_ParallelReject');
        if (menu != null)
            menu.innerHTML = " رد شده ( " + result.d.RejectCount + " )";
    }
}

function GetMessagesParallel() {
    if ($('#msg1').is(":hidden")) {
        $.ajax({
            type: "POST",
            url: window.currentLocationResolve + "/GetMessageParallel",
            contentType: "application/json; charset=utf-8",
            data: "{'tracking_num': '" + document.getElementById('ctl00_Edit_AlertData').value + "'}",
            dataType: "json",
            success: function (date) {
                GetMessagesParallel_CallBack(date);
            },
            error: Failed
        });
    }
}
function GetMessagesParallel_CallBack(result) {
    if (result.d != null && result.d != "") {
        PlaySound();

        $("#modalbody").text("(" + result.d + ")");
        $('#msg1').notificationmsg({ animation: 'slide' });
        $('#msg1').notificationmsg('show');

        CheckKartablParallel();
    }
}

function Failed(result) {
    console.log(result.status + " " + result.statusText);
}

var soundObject = null;
function PlaySound() {
    if (soundObject != null) {
        document.body.removeChild(soundObject);
        soundObject.removed = true;
        soundObject = null;
    }
    soundObject = document.createElement("embed");
    soundObject.setAttribute("src", "../sounds/REMINDER.WAV");
    soundObject.setAttribute("hidden", true);
    soundObject.setAttribute("autostart", true);
    document.body.appendChild(soundObject);
}

function GetHelpLink() {
    $.ajax({
        type: "POST",
        url: window.currentLocationResolve + "/GetHelpLink",
        contentType: "application/json; charset=utf-8",
        data: "{'tracking_num': '" + window.location.href + "'}",
        dataType: "json",
        success: function (date) {
            GetHelpLink_CallBack(date);
        },
        error: function (data) {
            var nPage = window.location.pathname;
            nPage = nPage.substring(nPage.lastIndexOf('/') + 1);
            window.open("../WebHelp/index.htm#page=" + nPage.replace(".aspx", ".htm"));
            Failed(data);
        }
    });

}
function GetHelpLink_CallBack(result) {
    try {
        if ((result.d != null) && (result.d != null)) {
            window.open(result.d);
        }
    } catch (err) {
        alert(err);
    }
}


function closeMsg() {
    $('#msg1').hide();
}
/************************************************************************************/
function confirm_delete() {
    if (confirm("آیا با حذف موافقید؟") == true)
        return true;
    else
        return false;
}

function onblurDateBox(sender) {
    try {
        __doPostBack(sender.id, sender.value);
    } catch (err) { }
}

function SelectAllCheckboxes(spanChk) {
    xState = spanChk.checked;
    var Container = spanChk.parentNode.parentNode.parentNode.parentNode.parentNode.id
    elm = spanChk.form.elements;
    for (i = 0; i < elm.length; i++)
        if (elm[i].type == "checkbox" && elm[i].id != spanChk.id) {
            if (Container == elm[i].parentNode.parentNode.parentNode.parentNode.id) {
                if (elm[i].checked != xState)
                    elm[i].click();
            }
        }
}

function HighlightRow(chkB) {
    var oItem = chkB.children;
    if (oItem.item.lenght > 0) {
        xState = oItem.item(0).checked;
        if (xState) {
            chkB.parentElement.parentElement.style.backgroundColor = 'lightcoral';
            chkB.parentElement.parentElement.style.color = 'white';
        } else {
            chkB.parentElement.parentElement.style.backgroundColor = 'white';
            chkB.parentElement.parentElement.style.color = 'black';
        }
    }
}

function ShowSearch() {
    if (tblsearch.style.display == 'none')
        tblsearch.style.display = 'inline';
    else
        tblsearch.style.display = 'none';
}

function SetEndTime(timeType) {
    try {
        var oo = document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_EditStartTime').value.split(':');
        var startTimeMin = oo[0] * 60 + parseInt(oo[1], 10);
        if (startTimeMin <= 0)
            return;

        oo = document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_EditDuration').value.split(':');
        var durationTimeMin = oo[0] * 60 + parseInt(oo[1], 10);
        if (durationTimeMin <= 0)
            return;

        var endTimeMin = (startTimeMin + durationTimeMin);
        var day = Math.floor(endTimeMin / (24 * 60));
        if (day > 0) {
            endTimeMin -= day * 24 * 60;
            if (day > 1)
                document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_lblEndTime').innerHTML = day.toString() + " روز بعد";
            else
                document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_lblEndTime').innerHTML = "روز بعد";
        } else document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_lblEndTime').innerHTML = "";

        var pad = "00";
        var str = parseInt(endTimeMin / 60).toString();
        var h = pad.substring(0, pad.length - str.length) + str;

        str = parseInt(endTimeMin % 60).toString();
        var m = pad.substring(0, pad.length - str.length) + str;
        if (h == 'NaN' || m == 'NaN')
            document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_EditEndTime').value = "00:00";
        else
            document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_EditEndTime').value = h + ":" + m;

    } catch (err) { }
}

function SetDurationTime(timeType) {
    try {
        var oo = document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_EditStartTime').value.split(':');
        var startTimeMin = oo[0] * 60 + parseInt(oo[1], 10);
        if (startTimeMin <= 0)
            return;

        oo = document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_EditEndTime').value.split(':');
        var editEndTimeMin = oo[0] * 60 + parseInt(oo[1], 10);
        if ($('#ctl00_ContentPlaceHolder1_' + timeType + '1_lblEndTime').text().indexOf('روز بعد') >= 0)
            editEndTimeMin += 24 * 60;
        if (editEndTimeMin <= 0)
            return;

        var durationTimeMin = (editEndTimeMin - startTimeMin);
        var day = Math.floor(durationTimeMin / (24 * 60));
        if (day > 0) {
            durationTimeMin -= day * 24 * 60;
        }

        var pad = "00";
        var str = parseInt(durationTimeMin / 60).toString();
        var h = pad.substring(0, pad.length - str.length) + str;

        str = parseInt(durationTimeMin % 60).toString();
        var m = pad.substring(0, pad.length - str.length) + str;
        if (h == 'NaN' || m == 'NaN')
            document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_EditDuration').value = "00:00";
        else
            document.getElementById('ctl00_ContentPlaceHolder1_' + timeType + '1_EditDuration').value = h + ":" + m;

    } catch (err) { }
}
function showPrint(sender) {
    window.open('../Print.aspx?RID=' + sender, 'PrintMe', 'height=300px,width=600px, resizable=1, scrollbars=1, status=1, toolbar=0, location=1');
}