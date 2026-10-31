<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.EmployeeSupervisor" Title="شرکت دنیای پردازش :: معرفی پرسنل کارمند دفتری"
    CodeBehind="EmployeeSupervisor.aspx.cs" %>

<%@ Register Src="~/Admin/UC/EmployeeSupervisor.ascx" TagName="UC_EmployeeSupervisor"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: معرفی پرسنل کارمند دفتری</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top">
                <uc1:UC_EmployeeSupervisor ID="EmployeeSupervisor1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
