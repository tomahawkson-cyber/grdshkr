<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.UC.ChangePass" Codebehind="ChangePass.ascx.cs" %>
<asp:Panel ID="Pan" Width="400px" runat="server">
    <table class="NormalText" id="table7" dir="rtl" cellspacing="0" width="400" bgcolor="#f2f2f2"
        border="0">
        <tr>
            <td class="cap" bgcolor="#b00000">
                &#160; :: تغییر رمز عبور پرسنل ::
            </td>
        </tr>
        <tr>
            <td>
                <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0" align="left">
                    <tr>
                        <td align="left" width="25%">
                            شماره کارت :&#160;
                        </td>
                        <td align="right">
                            <asp:Label ID="lblEmpNo" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" nowrap="nowrap">
                            نام&#160; و نام خانوادگی:&#160;
                        </td>
                        <td align="right">
                            <asp:Label ID="lblUserName" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            نام کاربری:&#160;
                        </td>
                        <td align="right">
                            <asp:TextBox ID="RTxt_UserName" runat="server" CssClass="nTextBox" dir="LeftToRight"
                                MaxLength="50" Width="90px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            رمز عبور:&#160;
                        </td>
                        <td align="right">
                            <asp:TextBox ID="RTxt_Pass" runat="server" CssClass="nTextBox" dir="LeftToRight"
                                MaxLength="50" TextMode="Password" Width="90px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            تکرار رمز عبور:&#160;
                        </td>
                        <td align="right">
                            <asp:TextBox ID="RTxt_Pass0" runat="server" CssClass="nTextBox" dir="LeftToRight"
                                MaxLength="50" TextMode="Password" Width="90px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton ID="Btn_Login" runat="server" Width="49px" CssClass="LinkButton"
                    CausesValidation="False" BackColor="Control" OnClick="Btn_Login_Click">ثبت</asp:LinkButton>
                &#160;&#160;&#160;
                <asp:LinkButton ID="BtnCancel" runat="server" BackColor="Control" CausesValidation="False"
                    CssClass="LinkButton" OnClick="BtnCancel_Click" Width="49px">انصراف</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Panel>
