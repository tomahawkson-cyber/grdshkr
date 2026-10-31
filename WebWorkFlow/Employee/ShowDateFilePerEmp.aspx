<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.ShowDateFilePerEmp" Title="شرکت دنیای پردازش :: نمایش ترددهای روز خاص"
    EnableEventValidation="false" CodeBehind="ShowDateFilePerEmp.aspx.cs" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: نمایش ترددهای روز خاص</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="background-color: LightSteelBlue; width: 100%" id="tMain" style="min-height: 500px"
        cellpadding="0" cellspacing="0">
        <caption>
            <asp:Label ID="LblReqCaption" runat="server" Text="نمایش ترددها"></asp:Label>
        </caption>
        <tr style="height: 30px; background-color: Gray; font-weight: bold">
            <td style="width: 30%" align="center" nowrap="nowrap" valign="middle">بخش :
                <asp:DropDownList ID="EditSections" runat="server" CssClass="Ddl" Width="200px" />
            </td>
            <td style="width: 55%; text-align: center;" align="right" nowrap="nowrap" valign="middle">
                <uc1:DatePicker ID="Edit_Date" runat="server" Caption="تاریخ :" />
            </td>
            <td style="width: 9%; text-align: center;" nowrap="nowrap" align="right">
                <asp:Button ID="BtnShow" runat="server" CssClass="btn" Text="نمایش تردد" OnClick="BtnShow_Click" />
            </td>
            <td style="width: 6%; text-align: center;" nowrap="nowrap" align="right">
                <input id="HdnValues" runat="server" type="hidden" />
                <asp:Button ID="btnExportToExcel" runat="server" CssClass="btn" Text="Export To Excel"
                    OnClick="btnExportToExcel_Click" PostBackUrl="#" />
            </td>
        </tr>
        <tr>
            <td align="center" id="tdGrd" colspan="3" valign="top">
                <PT:GridViewEx ID="GrdShowDataFile" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BorderColor="LightGray" OnDataSourceRequested="GrdShowDataFile_DataSourceRequested"
                    OnRowDataBound="GrdShowDataFile_RowDataBound" CssClass="RedDatagrid" BorderStyle="Solid"
                    BorderWidth="1px" EnableModelValidation="True" PageSize="30">
                    <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی"
                        Mode="NumericFirstLast" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                </PT:GridViewEx>
            </td>
        </tr>
    </table>
</asp:Content>
