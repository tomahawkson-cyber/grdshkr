<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.InsertSupervisor" Title="شرکت دنیای پردازش :: معرفی کارمندان دفتری"
    CodeBehind="InsertSupervisor.aspx.cs" %>

<%@ Register Src="~/Admin/UC/InsertSupervisor.ascx" TagName="UC_InsertSupervisor"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: معرفی کارمندان دفتری</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top">
                <uc1:UC_InsertSupervisor ID="InsertSupervisor1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
