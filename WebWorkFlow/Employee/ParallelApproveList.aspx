<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.ParallelApproveList" CodeBehind="ParallelApproveList.aspx.cs"
    Title="شرکت دنیای پردازش :: تاییدیه کارشناس" %>

<%@ Register Src="~/Employee/UC/ParallelApproveList.ascx" TagName="ParallelApproveList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش ::  تاییدیه کارشناس</title>
    <link href="<%=ResolveUrl("~/Style/confirm.css")%>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top" style="overflow: auto">
                <uc1:ParallelApproveList ID="ParallelApproveList1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

