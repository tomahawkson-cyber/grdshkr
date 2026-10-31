<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.TimeLeave" Title="شرکت دنیای پردازش :: درخواست مرخصی ساعتی"
    EnableEventValidation="false" CodeBehind="TimeLeave.aspx.cs" %>

<%@ Register Src="~/Employee/UC/TimeLeave.ascx" TagName="UC_TimeLeave" TagPrefix="uc1" %>
<%@ Register Src="~/Employee/UC/Requests.ascx" TagName="Requests" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: درخواست مرخصی ساعتی</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="PnlprogrammaticPopup" runat="server">
        <div id="progressBackgroundFilter">
        </div>
        <div id="Modalreq">
            <div style="cursor: pointer; background-color: #DDDDDD; border: solid 1px Gray; color: Black; text-align: center">
                سیستم گردش کار
            </div>
            <table width="100%">
                <tr>
                    <td height="20" align="center" style="background-color: #ffecec">
                        <asp:Label ID="LblDesc" runat="server" Text="salam" ToolTip="سلام"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td dir="rtl" align="center">
                        <uc1:UC_TimeLeave ID="TimeLeave1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td height="10"></td>
                </tr>
            </table>
        </div>
    </div>
    <table style="width: 100%; height: 100%">
        <tr>
            <td valign="top">
                <asp:Label ID="lblTolerance" runat="server" Text="" ForeColor="Blue"></asp:Label>
                <uc1:Requests ID="Requests1" runat="server" ActionType="TimeLeave" />
            </td>
        </tr>
    </table>
</asp:Content>
