<%@ Page Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Err" CodeBehind="Err.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {width: 100%;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="border: thin groove #000080; width: 100%; font-family: Tahoma; font-size: 12px;">
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="Lbl_Title" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="14pt"
                        Height="30"></asp:Label>
                </td>
            </tr>
            <tr>
                <td valign="top" colspan="2" style="border: thin solid #000000">
                    <table cellpadding="5" cellspacing="5">
                        <tr>
                            <td valign="top">
                                <img src="mnuImage/Img_Error2.png" />
                            </td>
                            <td>
                                <br />
                                <asp:Label ID="Lbl_ErrorViewer" runat="server" Text="" Height="50px"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="border: thin groove #800000; background-color: #FFCC99; width: 50%">
                    <table class="style1">
                        <tr>
                            <td width="100">نگارش سیستم :
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Lbl_SystemVersion" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="100">تاریخ :
                            </td>
                            <td>
                                <asp:Label ID="Lbl_ErrorDate" runat="server" Text="---"></asp:Label>
                            </td>
                            <td width="60">ساعت :
                            </td>
                            <td>
                                <asp:Label ID="Lbl_ErrorTime" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="100">تایپ خطا :
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Lbl_ErrorTypeName" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="100">منبع خطا :
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Lbl_ErrorSource" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="100">نوع عامل خطا :
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Lbl_ErrorType" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="100">نام عامل خطا :
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Lbl_ErrorName" runat="server" Text="---"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="text-align: center; font-size: 15px; color: blue; border: thin groove #800000; background-color: #FFCC99; width: 50%" dir="ltr">
                    <asp:Label ID="Lbl_ErrorMessageEng" runat="server" Height="100px" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td dir="ltr" style="border: thin groove #808000; background-color: #C0C0C0" colspan="2"
                    align="center">
                    <div style="width: 100%; font-family: tahoma; font-size: 12px; font-weight: bold;"
                        dir="rtl">
                        <br />
                        حافظه پشته
                    </div>
                    <br />
                    <asp:TextBox ID="Txt_ErrorDetail" runat="server" TextMode="MultiLine" Width="99%"
                        Height="500px" Font-Size="8" Font-Names="tahoma"></asp:TextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
