<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.NotAccess" CodeBehind="NotAccess.aspx.cs" Title="شرکت دنیای پردازش :: عدم دسترسی" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: عدم دسترسی</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="vertical-align: top; text-align: center">
        <br />
        <img src="images/NotAccess.jpg" />
        <br />
        <br />
        <asp:Label ID="lblMSG" runat="server" Font-Bold="False" ForeColor="Red" Style="z-index: 100;
            left: 8px; position: relative; width: 100%; font-size: large" Text="شما به این صفحه دسترسی ندارید"></asp:Label>
    </div>
</asp:Content>
