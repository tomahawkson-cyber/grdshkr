<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.InsertManagers" Title="شرکت دنیای پردازش :: معرفی مدیران"
    CodeBehind="InsertManagers.aspx.cs" %>

<%@ Register Src="~/Admin/UC/InsertManagers.ascx" TagName="UC_InsertManagers" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: معرفی مدیران</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top">
                <uc1:UC_InsertManagers ID="InsertManagers1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
