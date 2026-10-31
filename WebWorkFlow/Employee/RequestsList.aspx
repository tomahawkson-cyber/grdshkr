<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.RequestsList" Title="شرکت دنیای پردازش :: کارتابل"
    CodeBehind="RequestsList.aspx.cs" %>

<%@ Register Src="~/Employee/UC/RequestsList.ascx" TagName="UC_RequestsList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: کارتابل</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:UC_RequestsList ID="RequestsList1" runat="server" />
</asp:Content>
