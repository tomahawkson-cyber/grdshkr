<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="InsertUsers.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.InsertUsers" %>

<%@ Register Src="~/Admin/UC/InsertUsers.ascx" TagName="UC_InsertUsers" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top">
                <uc1:UC_InsertUsers ID="InsertUsers1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
