<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Print.aspx.cs" Inherits="PW.WorkFlows.Web.Print" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript">
        function PrintPanel() {
            var btnPrint = document.getElementById("<%= btnPrint.ClientID %>");
            btnPrint.style.display = "none";
            window.print();
            btnPrint.style.display = "inline";
        }
        setTimeout(function () {
            var panel = document.getElementById("<%= PrintContanerNameClient %>");
            if (panel == null)
                return;
            window.resizeTo((panel.clientWidth + 35), (panel.clientHeight + 130));
        }, 500);
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <div id="DivPrintTime" style="font-family: tahoma; font-size: 12px; width: 500px; border-color: Black; direction: rtl" runat="server">
            <table id="tblprintTime" border="1" cellpadding="1" cellspacing="1" dir="rtl" width="100%">
                <tr>
                    <td colspan="3" style="font-size: 15px; padding-bottom: 5px; text-align: center; border: none">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Image ID="imgLogoTime" runat="server" Height="50px" Width="100px" />
                                </td>
                                <td style="text-align: center">بسمه تعالی
                                <br />
                                    <asp:Label ID="lblTimeTitle" runat="server" Font-Bold="True">درخواست ماموريت</asp:Label></td>
                                <td style="font-size: 11px">تاریخ :
                                <asp:Label ID="lblTimeSubmitDate" runat="server">1392/12/13</asp:Label>
                                    <br />
                                    شماره :
                                <asp:Label ID="lblTimeRequestId" runat="server">1025</asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td style="text-align: right; width: 50%" colspan="2">&nbsp; نام دستگاه :
                <asp:Label ID="lblTimeCompnay" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="text-align: right">&nbsp; واحد :
                <asp:Label ID="lblTimeSection" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td>&nbsp; تاريخ شروع :
                    </td>
                    <td dir="ltr" align="right">
                        <asp:Label ID="lblTimeStartDate" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>&nbsp; مدت :
                <asp:Label ID="lblTimeDuration" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td colspan="2">&nbsp; شروع :
                <asp:Label ID="lblTimeStart" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td>&nbsp; پايان :
                <asp:Label ID="lblTimeEnd" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp; توضيحات :
                <asp:Label ID="lblTimeDescription" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="3">
                        <div style="float: right; width: 33%">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    &nbsp;درخواست کننده
                                </caption>
                                <tr>
                                    <td valign="top" nowrap="nowrap">
                                        <asp:Label ID="lblTimeEmpFullName" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:Image ID="imgTimeSignatureEmp" runat="server" Width="100%" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float: right; width: 33%" runat="server" id="divParalelTime">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    تایید موازی
                                </caption>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblTimeParalelIsApprove" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                        <div style="direction: ltr; text-align: right">
                                            <asp:Label ID="lblTimeParalelDate" runat="server" Font-Bold="True">?</asp:Label>
                                        </div>
                                        <asp:Label ID="lblTimeParalelFullName" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:Image ID="lblTimeParalelSignature" runat="server" Width="100%" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float: left; width: 33%">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    &nbsp;اظهار نظر مسئول
                                </caption>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblTimeApprovalTitle" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                        <div style="direction: ltr; text-align: right">
                                            <asp:Label ID="lblTimeApprovalDate" runat="server" Font-Bold="True">?</asp:Label>
                                        </div>
                                        <asp:Label ID="lblTimeManagerFullName" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:Image ID="imgTimeSignatureManager" runat="server" Width="100%" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="DivPrintDaily" style="font-family: tahoma; font-size: 12px; width: 500px; border-color: Black; direction: rtl" runat="server">
            <table id="tblprintDaily" border="1" cellpadding="1" cellspacing="1" width="100%"
                dir="rtl">
                <tr style="height: 35px">
                    <td colspan="4" style="font-size: 15px; padding-bottom: 5px; text-align: center;">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Image ID="imgLogoDaily" runat="server" Height="50px" Width="100px" />
                                </td>
                                <td style="text-align: center">بسمه تعالی
                                <br />
                                    <asp:Label ID="lblDailyTitle" runat="server" Font-Bold="True">درخواست ماموريت</asp:Label>
                                </td>
                                <td style="font-size: 11px">تاریخ :
                                <asp:Label ID="lblDailySubmitDate" runat="server">1392/12/13</asp:Label>
                                    <br />
                                    شماره :
                                <asp:Label ID="lblDailyRequestId" runat="server">1025</asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td colspan="4" style="text-align: right">&nbsp; نام دستگاه :
                <asp:Label ID="lblDailyCompnay" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td colspan="4">&nbsp;
                    <asp:Label ID="lblDailyFullNameTile" runat="server" Text="نام و نام خانوادگي :" />
                        <asp:Label ID="lblDailyFullName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td colspan="2">&nbsp; شماره پرسنلي :
                <asp:Label ID="lblDailyEmpNo" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td colspan="2">&nbsp; سمت :
                <asp:Label ID="lblDailyPosition" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td colspan="2">&nbsp; واحد :
                <asp:Label ID="lblDailySection" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td colspan="2">&nbsp; مدت *
                <asp:Label ID="lblDailyDuration" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="height: 35px">&nbsp; تاريخ شروع :
                    </td>
                    <td style="height: 35px" dir="ltr" align="right">
                        <asp:Label ID="lblDailyStartDate" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="height: 35px">&nbsp; تاريخ پايان :
                    </td>
                    <td style="height: 35px" dir="ltr" align="right">
                        <asp:Label ID="lblDailyEndDate" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="height: 35px" colspan="2">&nbsp; مدارک پيوست :
                <asp:Label ID="lblDailyAttachment" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="height: 35px" colspan="2">&nbsp; نوع :
                <asp:Label ID="lblDailyCardTitle" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr id="trDailyDuty1" runat="server">
                    <td style="height: 35px" colspan="2">&nbsp; مبدا :
                <asp:Label ID="lblSource" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="height: 35px" colspan="2">&nbsp; مقصد :
                <asp:Label ID="lblDistination" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr id="trDailyDuty2" runat="server">
                    <td style="height: 35px" colspan="2">وسیله رفت :
                <asp:Label ID="lblDeviceWent" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="height: 35px" colspan="2">&nbsp; وسیله برگشت :
                <asp:Label ID="lblDeviceBack" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr id="trDailyDuty3" runat="server">
                    <td style="height: 35px" colspan="2">&nbsp;وضعیت اقامت :
                <asp:Label ID="lblLocationStatus" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                    <td style="height: 35px" colspan="2">&nbsp;هزینه ایاب و ذهاب:
                <asp:Label ID="lblTransferCost" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 35px">توضيحات :
                <asp:Label ID="lblDailyDescription" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="4">
                        <div style="float: right; width: 33%">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    &nbsp;درخواست کننده
                                </caption>
                                <tr>
                                    <td style="text-align: center">
                                        <asp:Image ID="ImgDailyEmpSignature" runat="server" Width="100px" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float: right; width: 33%" runat="server" id="divParalelDaily">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    تایید موازی
                                </caption>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblDailyParalelIsApprove" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                        <div style="direction: ltr; text-align: right">
                                            <asp:Label ID="lblDailyParalelDate" runat="server" Font-Bold="True">?</asp:Label>
                                        </div>
                                        <asp:Label ID="lblDailyParalelFullName" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:Image ID="lblDailyParalelSignature" runat="server" Width="100%" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float: left; width: 33%">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    اظهار نظر مسئول
                                </caption>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblDailyApprovalTitle" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                        <div style="direction: ltr; text-align: right">
                                            <asp:Label ID="lblDailyApprovalDate" runat="server" Font-Bold="True">?</asp:Label>
                                        </div>
                                        <asp:Label ID="lblDailyManagerFullName" runat="server" Font-Bold="True">?</asp:Label><br />
                                        <br />
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:Image ID="ImgDailyManagerSignature" runat="server" Width="100px" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="DivPrintOther" style="font-family: tahoma; font-size: 12px; width: 500px; border-color: Black; direction: rtl" runat="server">
            <table id="tblprintOther" border="1" cellpadding="1" cellspacing="1" width="100%" dir="rtl">
                <tr>
                    <td style="font-size: 15px; padding-bottom: 5px; text-align: center; border: none">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Image ID="imgLogoOther" runat="server" Height="50px" Width="100px" />
                                </td>
                                <td style="text-align: center">بسمه تعالی
                                <br />
                                    <asp:Label ID="lblOtherTitle" runat="server" Font-Bold="True">درخواست ماموريت</asp:Label></td>
                                <td style="font-size: 11px">تاریخ :
                                <asp:Label ID="lblOtherSubmitDate" runat="server">1392/12/13</asp:Label>
                                    <br />
                                    شماره :
                                <asp:Label ID="lblOtherRequestId" runat="server">1025</asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td style="text-align: right;">&nbsp; نام دستگاه :
                <asp:Label ID="lblOtherCompnay" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td style="text-align: right;">&nbsp; واحد :
                <asp:Label ID="lblOtherSection" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 35px">
                    <td runat="server" id="tdContend"></td>
                </tr>
                <tr>
                    <td>&nbsp; توضيحات :
                <asp:Label ID="lblOtherDescription" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div style="float: right; width: 33%">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    &nbsp;درخواست کننده
                                </caption>
                                <tr>
                                    <td valign="top" nowrap="nowrap">
                                        <asp:Label ID="lblOtherEmpFullName" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:Image ID="imgOtherSignatureEmp" runat="server" Width="100%" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float: right; width: 33%" runat="server" id="divParalelOther">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    تایید موازی
                                </caption>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblOtherParalelIsApprove" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                        
                                        <div style="direction: ltr; text-align: right">
                                            <asp:Label ID="lblOtherParalelDate" runat="server" Font-Bold="True">?</asp:Label>
                                        </div>
                                        <asp:Label ID="lblOtherParalelFullName" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:Image ID="lblOtherParalelSignature" runat="server" Width="100%" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float: left; width: 33%">
                            <table width="100%">
                                <caption style="font-size: 15px; font-weight: bold; padding-bottom: 5px;">
                                    &nbsp;اظهار نظر مسئول
                                </caption>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblOtherApprovalTitle" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                        <div style="direction: ltr; text-align: right">
                                            <asp:Label ID="lblOtherApprovalDate" runat="server" Font-Bold="True">?</asp:Label>
                                        </div>
                                        <asp:Label ID="lblOtherManagerFullName" runat="server" Font-Bold="True">?</asp:Label>
                                        <br />
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:Image ID="imgOtherSignatureManager" runat="server" Width="100%" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <asp:ImageButton ID="btnPrint" runat="server" ImageUrl="~/images/print.png" OnClientClick="return PrintPanel();" />
    </form>
</body>
</html>
