function IsSelectedItem(sender) {
    var grdList = document.getElementById('ctl00_ContentPlaceHolder1_RequestsList1_GrdList');
    if (grdList == null) {
        alert('درخواست انتخاب شده ای وجود ندارد!');
        return false;
    }
    var isSelected = false;
    for (var i = 1; i < grdList.rows.length; i++) {
        if (grdList.rows[i].cells[0].childNodes[0].checked || grdList.rows[i].cells[0].childNodes[1].checked) {
            isSelected = true;
            break;
        }
    }
    if (isSelected) {
        return confirm('آیا با انجام عملیات ' + sender + ' موافقید؟');
    }
    else {
        alert('لطفا یک درخواست را جهت انجام عملیات ' + sender + ' انتخاب نمایید!!');
        return false;
    }
}
