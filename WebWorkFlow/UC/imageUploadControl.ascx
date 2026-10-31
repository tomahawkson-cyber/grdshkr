<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="imageUploadControl.ascx.cs"
    Inherits="PW.WorkFlows.Web.UC.imageUploadControl" %>
<style type="text/css">
    select option {
        background: none repeat scroll 0 0 #E5E3E3;
        border: 1px dotted #CCCCCC;
        height: 15px;
        line-height: 15px;
        text-indent: 3px;
        text-transform: capitalize;
        z-index: -9999;
    }
</style>
<table style="width: 100%; direction: rtl">
    <tr dir="ltr" style="height: 100px" id="trShowPreview" runat="server">
        <td align="center" style="width: 120px; border: thin solid #000080; background-color: #E8FFFF; padding: 3px"
            valign="middle">
            <asp:HyperLink ID="imgUploaded" runat="server" Target="_blank">
                
            </asp:HyperLink>
        </td>
        <td style="width: 300px">
            <asp:ListBox ID="AttList" runat="server" AutoPostBack="True" Width="100%" Height="110px"></asp:ListBox>
        </td>
    </tr>
    <tr id="trUpload" runat="server">
        <td colspan="2" dir="ltr">
            <asp:FileUpload ID="EditAttachment" runat="server" Width="80%" />
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="ارسال"
                PostBackUrl="~/DailyRequest.aspx" />
        </td>
    </tr>
    <tr id="trWarning" runat="server">
        <td colspan="2" dir="ltr" align="center">
            <asp:Label ID="lblImageName" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" CssClass="error"></asp:Label>
        </td>
    </tr>
</table>
