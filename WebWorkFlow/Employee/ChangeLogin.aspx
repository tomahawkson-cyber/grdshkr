<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.ChangeLogin" Title="شرکت دنیای پردازش :: تغییر رمز عبور"
    CodeBehind="ChangeLogin.aspx.cs" %>

<%@ Register Src="~/UC/ChangePass.ascx" TagName="ChangePass" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: تغییر رمز عبور</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td align="center" valign="middle">
                <uc1:ChangePass ID="ChangePass1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
