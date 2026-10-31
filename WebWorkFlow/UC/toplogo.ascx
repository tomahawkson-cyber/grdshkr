<%@ Control Language="c#" Inherits="PW.WorkFlows.Web.UC.TopLogo" CodeBehind="TopLogo.ascx.cs" %>
<table class="MainForm_admin" id="Table1" dir="rtl" cellspacing="0" cellpadding="0"
    width="100%" border="0">
    <tr class="cap" height="17">
        <td>
            <asp:Label ID="lblUserInfo" runat="server">نام کاربری</asp:Label>:
        </td>
        <td>
            <asp:Label ID="lblDateTime" runat="server"></asp:Label>
        </td>
        <td align="left">
            <asp:LinkButton ID="BtnSubStitute" runat="server" CssClass="LinkButton" OnClick="BtnSubStitute_Click"
                BackColor="Control">معرفی جانشین</asp:LinkButton>
        </td>
        <td align="center">
            <asp:LinkButton ID="BtnChangePass" runat="server" CssClass="LinkButton" OnClick="BtnChangePass_Click"
                BackColor="Control">تغییر رمزعبور</asp:LinkButton>
        </td>
        <td align="center" width="117">
            <asp:LinkButton ID="btnExit" runat="server" CssClass="LinkButton" OnClick="btnExit_Click"
                BackColor="Control">خروج - تغییر کاربری</asp:LinkButton>
        </td>
    </tr>
</table>
