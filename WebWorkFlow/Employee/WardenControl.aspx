<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.WardenControl" CodeBehind="WardenControl.aspx.cs"
    Title="شرکت دنیای پردازش :: بازرس" %>

<%@ Register Src="~/Employee/UC/WardenControl.ascx" TagName="UC_Control" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: بازرس</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top" style="overflow: auto">
                <uc1:UC_Control ID="UC_Control1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
