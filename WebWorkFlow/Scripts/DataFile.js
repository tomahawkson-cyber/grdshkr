

//<![CDATA[


function ShowContextMenu() {

    $('.context').jeegoocontext('menu',
        {
            widthOverflowOffset: 10,
            heightOverflowOffset: 10,
            submenuLeftOffset: -4,
            submenuTopOffset: -5,
            onSelect: function (e, context) {
                var rowIndex = context.parentNode.rowIndex;
                var cellIndex = context.cellIndex;

                if (document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value != '') {
                    var dataChangeSplit = document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value.split('|');

                    for (var i = 0; i < dataChangeSplit.length; i++) {
                        var data = dataChangeSplit[i].split('#');
                        var rowIndexTemp = data[4];
                        var cellIndexTemp = data[5];
                        if (rowIndex == rowIndexTemp && cellIndex == cellIndexTemp) {
                            jAlert('درخواستی برای ساعت انتخابی ثبت شده است\nشما مجاز به ثبت مجوز جدید نمی باشید', 'بررسی ثبت درخواست');
                            return;
                        }
                    }
                }
                $(context).css('color', 'green');
                $(context).prop('title', $(this).text());
                var shamsiDate = context.parentNode.children[0].attributes["shamsidate"].value;
                document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value +=
                    $(this).attr('cardNo') + "#" +
                    $(this).attr('cardType') + "#" +
                    (context.textContent || context.innerText) + "#" +
                    shamsiDate + "#" +
                    rowIndex + "#" +
                    cellIndex + "#00:00#false#" + $(this).text() + "|";

                AddRow(
                        shamsiDate,
                        $(this).text(),
                        (context.textContent || context.innerText),
                        rowIndex,
                        cellIndex,
                        $(this).attr('cardNo'),
                        $(this).attr('cardType'), 'false', '00:00'
                        );
            }
        });

    FillMenuCards();
}

function reloadData() {
    if (document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value != null && document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value !== "") {
        var datas = document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value.split('|');
        for (var i = 0; i < datas.length; i++) {
            var data = datas[i];
            if (data == null && data == "") 
                return;
            AddRow(data[3], data[8], data[2], data[4], data[5], data[0], data[1], data[7], data[6]);
        }
    }
}
function ResetChangeDataValues() {
    document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value = "";
    $("#tbl1 tr").each(function (index) {
        if (index > 0) {
            var tds = $(this).find("td");
            document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value +=
                $(this).attr('cardno') + "#" +          //cardno=0
                $(this).attr('cardType') + "#" +        //cardType=1
                tds[2].innerText + "#" +                //StartTime=2
                tds[0].innerText + "#" +                //PersianDate=3
                $(this).attr('gridRowIndex') + "#" +    //gridRowIndex=4
                $(this).attr('gridCellIndex') + "#" +   //gridCellIndex=5
                tds[3].children[0].value + "#" +        //duration=6
                tds[4].children[0].checked + "#" +      //isFirstTimeShift=7
                tds[1].innerText + '|';                 //title=8
        }
    });
}

function DeleteRow(rowId, gridRow, gridCell) {
    jConfirm('آیا با حذف موافقید؟', 'گردش کار',
        function (elem) {
            if (elem) {
                $("#tbl1 tr#row" + (rowId + '-' + gridRow).trim()).remove();
                if ($("#tbl1 tr").length === 1)
                    $("#tbl1 tr:eq(0)").remove();


                var gridDataRow = $(".RedDatagrid tr:eq(" + gridRow + ") td:eq(" + gridCell + ")");
                gridDataRow.css('color', 'black');
                gridDataRow.prop('title', '');

                ResetChangeDataValues();
            }
        }
    );
}


function AddRow(persianDate, cardTitle, startTime, gridRow, gridCell, cardNo, cardType, isCalcAutoDuration, durationTime) {
    var index = $("#tbl1 tr").length;
    if (index === 0) {
        $("#tbl1").append($(
           '<tr class="cap">' +
           '<td style="width: 100px;text-align: center">تاریخ</td>' +
           '<td style="width: 200px;text-align: center">شرح</td>' +
           '<td style="width: 70px;text-align: center">ساعت</td>' +
           '<td style="width: 70px;text-align: center">مدت</td>' +
           '<td style="width: 60px;text-align: center">اول وقت</td>' +
           '<td style="width: 70px;text-align: center">حذف</td>' +
           '<td style="width: 220px;text-align: center">هشدارها</td>' +
           '</tr>'
       ));
    }
    var errorMSG = "";
    if (isCalcAutoDuration=="true")
        errorMSG = "اگر تردد مورد نظر خروج از سازمان باشد،در سیستم حضور غیاب بعنوان مجوز خروج در نظر گرفته می شود";

    var rowId = (index + '-' + gridRow).trim();
    $("#tbl1").append($(
        '<tr id="row' + rowId + '" cardNo="' + cardNo + '" cardType="' + cardType + '"  gridRowIndex="' + gridRow + '" gridCellIndex="' + gridCell + '" style="background-color: whitesmoke" >' +
            '<td style="width: 100px;text-align: center">' + persianDate + '</td>' +
            '<td style="width: 200px;text-align: center">' + cardTitle + '</td>' +
            '<td style="width: 70px;text-align: center">' + startTime + '</td>' +
            '<td style="width: 70px;text-align: center"><input type="text"     id="time' + rowId + '" value="' + durationTime + '" style="width: 60px;text-align: center"/></td>' +
            '<td style="width: 60px;text-align: center"><input type="checkbox" id="chb' + rowId + '"  value="' + isCalcAutoDuration + '" style="width: 60px;text-align: center" onclick="CalcAutoDuration(this,' + index + ',' + gridRow + ')"/></td>' +
            '<td style="width: 70px;text-align: center"><input type="button" onclick="DeleteRow(' + index + ',' + gridRow + ',' + gridCell + ')" value="حذف" class="btn" style="width: 60px;text-align: center"/>' +
            '<td style="width: 220px;text-align: center;color:red;">' + errorMSG + '</td>' +
        '</td>' +
        '</tr>'));
    $("#time" + rowId).mask("99:99", { placeholder: "00:00" });

    $("#time" + rowId).keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
        }
    });
    $("#chb" + rowId).keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
        }
    });
}

function CalcAutoDuration(sender, index, gridRow) {
    var rowId = (index + '-' + gridRow).trim();
    var tds = $("#tbl1 tr#row" + rowId).find("td");

    if (sender.checked) {
        //$("#time" + rowId).prop('disabled', true);
        tds[6].innerText = "اگر تردد مورد نظر خروج از سازمان باشد،در سیستم حضور غیاب بعنوان مجوز خروج در نظر گرفته می شود";
    } else {
        //$("#time" + rowId).prop('disabled', false);
        tds[6].innerText= "";
    }
}
//]]>
function FillMenuCards() {
    $.ajax({
        type: "POST",
        url: "ShowDateFile.aspx/GetAccessCards",
        contentType: "application/json; charset=utf-8",
        data: "{'curEmpNo': '" + document.getElementById("ctl00_ContentPlaceHolder1_HdnEmpNO").value + "'}",
        dataType: "json",
        success: function (result) {
            if (result.d != null && result.d != "") {
                var data = result.d.split('#');
                $('#menu').empty();
                $('#menu').html('');
                for (var i = 0; i < data.length; i++) {

                    var cardRow = data[i].split(',');
                    var cardTitle = cardRow[0];

                    $('#menu')['append']('<li cardNo="' + cardRow[2] +
                        '" cardType="' + cardRow[1] +
                        '" id="menu_' + cardRow[2] +
                        '"> ' + cardTitle + '</li>');
                }
            }
        },
        error: function (err) {
            jAlert(err);
        }
    });
}

function ClearData() {    
    document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value = "";
}
function IsConfirmUser() {
    ResetChangeDataValues();
    if (document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value == null || document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value === "") {
        jAlert("شما درخواستی ثبت نکرده اید!");
        return false;
    }
    var vd = document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value.split('|');
    if (vd.length < 1) {
        jAlert("شما درخواستی ثبت نکرده اید!");
        return false;
    }
    var Req, msg, rowIndex, cellIndex;
    if (vd.length > 1)
        msg = "آیا با ثبت درخواست های زیر موافقید؟";
    else msg = "آیا با ثبت درخواست زیر موافقید؟";

    var grd = document.getElementById('ctl00_ContentPlaceHolder1_GrdShowDataFile');
    for (var i = 0; i < vd.length; i++) {
        Req = vd[i].split('#');
        if (Req != "") {
            rowIndex = Req[4];
            cellIndex = Req[5];
            msg += "\n" + (i + 1) + "- تاریخ " + Req[3] + " در ساعت " + Req[2] + " درخواست " + grd.rows[rowIndex].cells[cellIndex].title;
        }
    }

    if (confirm(msg)) {
        //document.getElementById("ctl00_ContentPlaceHolder1_HdnValues").value = changeDataValues;
        //changeDataValues = "";
        return true;
    } else {
        return false;
    }
}

function setColorName(sender) {
    var divhelp = document.getElementById(sender.id.replace("chb", "div"));
    var divhelpcolor = document.getElementById(sender.id.replace("chb", "div") + "Color");
    divhelpcolor.style.backgroundColor = sender.options[sender.selectedIndex].style.backgroundColor;
    divhelp.innerText = sender.options[sender.selectedIndex].style.backgroundColor;
}

/*****************************************dropdown search***************************************************/
var ddlText, ddlValue, ddl, lblMesg;
function CacheItems() {
    ddlText = new Array();
    ddlValue = new Array();

    if (ddl == null)
        return;
    for (var i = 0; i < ddl.options.length; i++) {
        ddlText[ddlText.length] = ddl.options[i].text;
        ddlValue[ddlValue.length] = ddl.options[i].value;
    }
}


function FilterItems(value) {
    value = value.replace('ی', 'ي');
    if (ddl == null)
        CacheItems();

    ddl.options.length = 0;
    for (var i = 0; i < ddlText.length; i++) {
        if (ddlText[i].toLowerCase().indexOf(value) != -1) {
            AddItem(ddlText[i], ddlValue[i]);
        }
    }
    //lblMesg.innerHTML = ddl.options.length + " items found.";
    if (ddl.options.length == 0) {
        AddItem("No items found.", "");
    }
}

function AddItem(text, value) {
    var opt = document.createElement("option");
    opt.text = text;
    opt.value = value;
    ddl.options.add(opt);
}
/********************************************************************************************/

