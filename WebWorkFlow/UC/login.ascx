<%@ Control Language="c#" Inherits="PW.WorkFlows.Web.UC.Login" CodeBehind="login.ascx.cs" %>
<style type="text/css">
    .auto-style1 {
        text-align: left;
    }

    .auto-style3 {
        text-align: center;
    }
</style>
<asp:Panel ID="Pan_Login" runat="server">
    <table class="NormalText" id="table7" dir="rtl" cellspacing="0" width="350px" bgcolor="#f2f2f2"
        border="0">
        <caption>:: ورود کاربران ::</caption>
        <tr>
            <td colspan="2">
                <table id="Table1" cellspacing="5" cellpadding="5" width="100%" border="0">
                    <tr>
                        <td class="auto-style1">نام کاربر :</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="RTxt_UserName" runat="server" Width="90px" MaxLength="50"
                                CssClass="nTextBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">رمز عبور:</td>
                        <td class="auto-style3">

                            <asp:TextBox ID="RTxt_Pass" runat="server" Width="90px" MaxLength="50"
                                CssClass="nTextBox" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
        <tr runat="server" id="trcaptcha">
            <td align="center" colspan="2">
                <br />
                تصویر امنیتی<br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/CAI.aspx" />
            </td>
        </tr>
        <tr runat="server" id="trcaptchaValue">
            <td align="center" style="width: 200px">عبارت امنيتي فوق را باز نويسي کنيد :</td>
            <td align="right">
                <asp:TextBox ID="txtimgcode" runat="server" Width="90px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="BtnLogin" runat="server" BackColor="Control" CausesValidation="False" CssClass="LinkButton" OnClick="Btn_Login_Click" Text="ورود" Width="49px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>

    </table>
</asp:Panel>
