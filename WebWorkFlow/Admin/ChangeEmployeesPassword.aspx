<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.ChangeEmployeesPassword" Title="شرکت دنیای پردازش :: معرفی وتنظیم رمز عبور "
    CodeBehind="ChangeEmployeesPassword.aspx.cs" %>

<%@ Register Src="~/Admin/UC/ChangeEmployeesPassword.ascx" TagName="UC_ChangeEmployeesPassword"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: معرفی و تنظیم رمز عبور </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="top">
                <uc1:UC_ChangeEmployeesPassword ID="ChangeEmployeesPassword1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
