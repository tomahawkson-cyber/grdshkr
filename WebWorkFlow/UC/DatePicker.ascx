<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.UC.DatePicker"
    CodeBehind="DatePicker.ascx.cs" %>
<span style="display: inline; direction: rtl">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:Label ID="lblCaption" runat="server" Text=" "></asp:Label></td>
            <td style="vertical-align: top; direction: ltr">
                <asp:TextBox ID="AnotherDate2" name="AnotherDate2" runat="server"
                    onchange="onblurDateBox(this)" Width="55px"></asp:TextBox>

            </td>
            <td style="cursor: pointer">
                <asp:Image name="img1" runat="server" onclick="displayDatePicker('AnotherDate2', this);"
                    ID="img1" ImageUrl="~/images/button_small.gif" /></td>
        </tr>
    </table>
</span>
