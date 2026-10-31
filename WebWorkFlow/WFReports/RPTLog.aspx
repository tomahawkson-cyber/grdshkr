<%@ Page Language="C#" MasterPageFile="~/ReportMasterPagePW.master" AutoEventWireup="true"
    CodeBehind="RPTLog.aspx.cs" Inherits="PW.WorkFlows.Web.WFReports.RPTLog" %>

<%@ Register Assembly="Stimulsoft.Report.Web" Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" cellspacing="5">
        <tr>
            <td valign="top" colspan="2">
                <h2>انتخاب تاریخ
                </h2>

            </td>
            <td align="center" valign="top" width="120">
                <h2>نمایش گزارش</h2>
            </td>
        </tr>
        <tr>
            <td valign="top">

                <uc1:DatePicker ID="EditFromDate" runat="server" Caption="ازتاریخ :" />
            </td>
            <td valign="top">

                <uc1:DatePicker ID="EditToDate" runat="server" Caption="تا تاریخ :" />
            </td>
            <td align="center" valign="top" width="120">
                <asp:ImageButton ID="BtnShowReport" runat="server" ImageUrl="~/images/report_picture.png"
                    OnClick="BtnShowReport_Click" ToolTip="نمایش گزارش" />
            </td>
        </tr>
    </table>
    <div style="direction: ltr">
        <cc1:StiWebViewer ID="StiWebViewer1" runat="server"
            BackgroundColor="#e8e8e8" ScrollbarsMode="true" toolbardisplaymode="Separated"
            Width="100%" Height="600px" />

    </div>
</asp:Content>
