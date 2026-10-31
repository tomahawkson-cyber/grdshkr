<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.EmployeePrintViewer" Title="شرکت دنیای پردازش :: انتساب پرسنل به مسئول چاپ احکام"
    CodeBehind="EmployeePrintViewer.aspx.cs" %>

<%@ Register Src="~/Admin/UC/EmployeePrintViewer.ascx" TagName="UC_EmployeePrintViewer"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: انتساب پرسنل به مسئول چاپ احکام</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top">
                <uc1:UC_EmployeePrintViewer ID="EmployeePrintViewer1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
