<%@ Control Language="c#" Inherits="PW.WorkFlows.Web.UC.BottomLogo" CodeBehind="BottomLogo.ascx.cs" %>
<table dir="rtl" width="100%">
    <tr>
        <td align="center" class="CopyRight"></td>
        <td></td>
    </tr>
    <tr>
        <td class="CopyRight" align="center"></td>
        <td class="CopyRight" align="center"></td>
    </tr>
</table>
<table id="Table1" dir="rtl" cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
        <td colspan="3">
            <hr width="100%" color="#800000" size="1" />
            &nbsp;
        </td>
    </tr>
    <tr>
        <td width="100"></td>
        <td class="CopyRight" align="center">
            <p>
                تمامی حقوق برای شرکت دنیای پردازش محفوظ می باشد.
            </p>
            <p runat="server" id="ver">
                ویرایش&nbsp; 3.4.1
            </p>
            <p runat="server" id="appSerial">
                سریال 1
            </p>
            <p runat="server" id="errorMsg"></p>
        </td>
        <td width="100"></td>
    </tr>
    <tr>
        <td></td>
        <td align="center">
            <asp:Label CssClass="CopyRight" ID="Label1" runat="server" Text="Label"></asp:Label>
        </td>
        <td></td>
    </tr>
</table>
