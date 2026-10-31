<%@ Page Language="C#" MasterPageFile="~/ReportMasterPagePW.master" AutoEventWireup="true"
    CodeBehind="RPTRequest.aspx.cs" Inherits="PW.WorkFlows.Web.WFReports.RPTRequest" %>

<%@ Register Assembly="Stimulsoft.Report.Web" Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" cellspacing="5">
        <tr>
            <td valign="top" width="150" rowspan="2">
                <h2>انتخاب تاریخ
                </h2>

                <uc1:DatePicker ID="EditFromDate" runat="server" Caption="ازتاریخ :" />
                <br />

                <uc1:DatePicker ID="EditToDate" runat="server" Caption="تا تاریخ :" />
            </td>
            <td valign="top">
                <h2>انتخاب نوع مجوز
                </h2>
                نوع مجوز :
                <asp:DropDownList ID="Dl_Actions" runat="server">
                </asp:DropDownList>
            </td>
            <td align="center" valign="top" width="120" rowspan="2">
                <h2>نمایش گزارش</h2>
                <asp:ImageButton ID="BtnShowReport" runat="server" ImageUrl="~/images/report_picture.png"
                    OnClick="BtnShowReport_Click" ToolTip="نمایش گزارش" />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:CheckBox ID="chbIsSHowDescription" Text="توضیحات در گزارش نمایش داده شود" runat="server" />
                <asp:CheckBox ID="chbIsShowCardTitle" Text="نوع مجوز در گزارش نمایش داده شود" runat="server" />
            </td>
        </tr>
    </table>
    <div style="direction: ltr">
        <cc1:StiWebViewer ID="StiWebViewer1" runat="server"
            BackgroundColor="#e8e8e8" ScrollbarsMode="true" ToolbarDisplayMode="Separated"
            Width="100%" Height="600px" />

    </div>

</asp:Content>
