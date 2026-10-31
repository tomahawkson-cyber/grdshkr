<%@ Page Title="" Language="C#" MasterPageFile="~/ReportMasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="RPTTurnoverManager.aspx.cs" Inherits="PW.WorkFlows.Web.WFReports.RPTTurnoverManager" %>

<%@ Register Assembly="Stimulsoft.Report.Web" Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function SetDisplay(containerName) {
            var container = document.getElementById(containerName);
            if (container.style.display == "inline")
                container.style.display = "none"
            else
                container.style.display = "inline"
        }
    </script>
    <style type="text/css">
        .style1 {
            width: 350px;
        }
    </style>
    <table style="width: 100%; height: 200px">
        <tr>
            <td valign="top">
                <table id="tblsearch" dir="rtl" style="height: 50px" align="right">
                    <caption>آمار عملکرد مدیران::.</caption>
                    <tr>
                        <td align="left" class="style1">ازتاریخ&nbsp; :&nbsp;
                        </td>
                        <td align="right" class="style1">
                            <uc1:DatePicker ID="EditFromDate" runat="server" />
                        </td>
                        <td align="left" class="style1">نوع مجوز :&nbsp;
                        </td>
                        <td align="right" class="style1">
                            <asp:DropDownList ID="EditOperations" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style1">تا تاریخ&nbsp;:&nbsp;
                        </td>
                        <td align="right" class="style1">
                            <uc1:DatePicker ID="EditToDate" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="IsShowRev" Text="نمایش آمار نظرات مدیران" runat="server" />
                        </td>
                        <td align="right" class="style1">&nbsp;
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <input id="Button1" type="button" value="انتخاب مدیر::." class="btn" onclick="SetDisplay('divManagers');" />
                <div id="divManagers" style="display: none">
                    <table width="100%">
                        <caption>
                            ::جستجو::</caption>
                        <tr>
                            <td>شماره پرسنلی :&nbsp;&nbsp;
                                <asp:TextBox ID="EditEmpManager" runat="server"></asp:TextBox>
                            </td>
                            <td>نام مدیر :&nbsp;
                                <asp:TextBox ID="EditFullName" runat="server"></asp:TextBox>
                            </td>
                            <td>بخش نام :&nbsp;&nbsp;
                                <asp:TextBox ID="EditTitle" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="BtnSearchEmp" runat="server" ImageUrl="~/images/icon_find.GIF"
                                    OnClick="BtnSearchEmp_Click" BorderWidth="0px" ToolTip="جستجو" />
                            </td>
                        </tr>
                    </table>
                    <PT:GridViewEx ID="GrdManager" runat="server" Width="100%" Style="width: 100%" BackColor="White"
                        BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" GridLines="Horizontal"
                        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" PageSize="15" CssClass="RedDatagrid"
                        OnDataSourceRequested="GrdManager_DataSourceRequested">
                        <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی"
                            Mode="NumericFirstLast" />
                        <FooterStyle CssClass="RedDatagridFooter" />
                        <Columns>
                            <asp:TemplateField HeaderText="انتخاب">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="false" onclick="javascript:HighlightRow(this);" />
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" onclick="javascript:SelectAllCheckboxes(this);" runat="server"
                                        AutoPostBack="false" ToolTip="Select/Deselect All"></asp:CheckBox>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" onclick="javascript:HighlightRow(this);" runat="server"
                                        AutoPostBack="false"></asp:CheckBox>
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="EmpManager" HeaderText="ش کارت" SortExpression="EmpManager">
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FullName" HeaderText="نام مدیر" SortExpression="FullName">
                                <ItemStyle Width="40%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE">
                                <ItemStyle Width="35%" />
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                        <HeaderStyle CssClass="RedDatagridHeader" />
                        <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                        <RowStyle CssClass="RedDatagridItem" />
                    </PT:GridViewEx>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td colspan="2" align="center">
                            <h1>
                                <asp:ImageButton ID="BtnShowReport" runat="server" ImageUrl="~/images/report_picture.png"
                                    OnClick="BtnShowReport_Click" ToolTip="نمایش گزارش" />
                                <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                            </h1>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div style="direction: ltr">
        <cc1:StiWebViewer ID="StiWebViewer1" runat="server"
            BackgroundColor="#e8e8e8" ScrollbarsMode="true" ToolbarDisplayMode="Separated"
            Width="100%" Height="600px" />

    </div>
</asp:Content>
