<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Accept.ascx.cs" Inherits="PW.WorkFlows.Web.Employee.UC.Accept" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>

<style type="text/css">
    .tbla1 {
        direction: rtl;
        font-family: tahoma;
        background-color: whitesmoke;
        padding: 5px;
    }

    .tbla2 {
        text-align: left;
    }
    .tbla3 {
        text-align: center;
    }
</style>

<div style="border: thin solid #000000">
    تغییر و تایید درخواست
    <table class="tbla1">
        <tr>
            <td class="tbla2">درخواست&nbsp;
            <asp:Label ID="lblTitle" runat="server"></asp:Label>&nbsp;
            از تاریخ&nbsp;</td>
            <td style="width: 100px">
                <uc1:DatePicker ID="EditSDate" runat="server" />
            </td>
            <td style="width: 50px; text-align: center">تا تاریخ </td>
            <td style="width: 100px">
                <uc1:DatePicker ID="EditEDate" runat="server" />
            </td>
            <td style="width: 50px; text-align: center">به مدت
            </td>
            <td>
                <asp:TextBox ID="EditDuration" runat="server" Width="40px" ReadOnly="True"></asp:TextBox>
                &nbsp;روز&nbsp;&nbsp;
            </td>
            <td style="width: 150px">
                <asp:Button ID="btnAccept" runat="server" Text="مورد تایید می باشد" OnClick="btnAccept_Click" Width="122px" />
            </td>
        </tr>
        <tr>
            <td class="tbla3" colspan="7">
                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
</div>

