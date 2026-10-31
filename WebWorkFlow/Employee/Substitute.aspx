<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.Substitute" Title="شرکت دنیای پردازش :: معرفی جانشین"
    CodeBehind="Substitute.aspx.cs" %>

<%@ Register Src="~/Employee/UC/Substitute.ascx" TagName="UC_Substitute" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: معرفی جانشین</title>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%;">
        <tr>
            <td align="center" valign="middle">
                <uc1:UC_Substitute ID="UC_Substitute1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
