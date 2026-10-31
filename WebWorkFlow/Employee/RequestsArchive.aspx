<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.RequestsArchive" Title="شرکت دنیای پردازش :: تمامی درخواستها"
    CodeBehind="RequestsArchive.aspx.cs" %>

<%@ Register Src="~/Employee/UC/RequestsArchive.ascx" TagName="UC_RequestsArchive" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: تمامی درخواستها</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:UC_RequestsArchive ID="RequestsArchive1" runat="server"  />
</asp:Content>
