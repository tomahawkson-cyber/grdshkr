$(function () {
    var logger = $.connection.baseHub;
    logger.client.logMessage = function (msg) {
        console.log(msg);
    };

    logger.client.kartableCount = function () {
        //GetKartableCount_CallBack(result);
        GetKartableCount();

        var MnuRequestsList = document.getElementById('ctl00_Menu1_MenuEmployee_MenuManger_header');
        if (MnuRequestsList != null) {
            GetMessages();
        }
       
    };

    $.connection.hub.start().done();
});