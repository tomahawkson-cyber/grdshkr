<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.InsertWarden" Title="شرکت دنیای پردازش :: معرفی بازرسان"
    CodeBehind="InsertWarden.aspx.cs" %>

<%@ Register Src="~/Admin/UC/InsertWarden.ascx" TagName="UC_InsertWarden" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: معرفی بازرسان</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top">
                <uc1:UC_InsertWarden ID="InsertWarden1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
