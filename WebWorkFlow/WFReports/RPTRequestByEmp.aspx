<%@ Page Language="C#" MasterPageFile="~/ReportMasterPagePW.master" AutoEventWireup="true"
    CodeBehind="RPTRequestByEmp.aspx.cs" Inherits="PW.WorkFlows.Web.WFReports.RPTRequestByEmp" %>

<%@ Register Assembly="Stimulsoft.Report.Web" Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .slide {
            margin: 0;
            padding: 0;
            text-align: center;
            border-top: solid 4px #422410;
            background: url(../images/btn-slide.gif) no-repeat center top;
        }

        .btn-slide {
            background: url(../images/white-arrow.gif) no-repeat right -50px;
            text-align: center;
            width: 144px;
            height: 31px;
            padding: 10px 10px 0 0;
            margin: 0 auto;
            display: block;
            font: bold 120%/100% Arial, Helvetica, sans-serif;
            color: #fff;
            text-decoration: none;
            cursor: hand;
        }

        .style1 {
            width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="panel" style="display: inline">
        <table id="t1" width="100%">
            <tr>
                <td>
                    <h2>انتخاب پرسنل::.</h2>
                    <table width="100%">
                        <caption>
                            ::جستجو::</caption>
                        <tr>
                            <td>شماره کارت :&nbsp;&nbsp;
                                <asp:TextBox ID="EditEmpManager" runat="server"></asp:TextBox>
                            </td>
                            <td>نام :&nbsp;
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
                    <PT:GridViewEx ID="GrdEmployee" runat="server" Style="width: 100%" BackColor="White"
                        BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" GridLines="Horizontal"
                        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" PageSize="15" CssClass="RedDatagrid">
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
                            <asp:BoundField DataField="EMP_NO" HeaderText="ش کارت" SortExpression="EMP_NO">
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FullName" HeaderText="نام پرسنل" SortExpression="FullName">
                                <ItemStyle Width="50%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE">
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                        <HeaderStyle CssClass="RedDatagridHeader" />
                        <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                        <RowStyle CssClass="RedDatagridItem" />
                    </PT:GridViewEx>
                </td>
            </tr>
        </table>
    </div>
    <p class="slide">
        <a id="btnslide" onclick="SetDisplay();" class="btn-slide">نمایش/پنهان</a>
    </p>
    <table width="100%">
        <tr>
            <td>
                <uc1:DatePicker ID="EditFromDate" runat="server" Caption="ازتاریخ :" />
            </td>
            <td>
                <uc1:DatePicker ID="EditToDate" runat="server" Caption="تا تاریخ :" />
            </td>
            <td align="center" rowspan="2">
                <asp:ImageButton ID="BtnShowReport" runat="server" ImageUrl="~/images/report_picture.png"
                    OnClick="BtnShowReport_Click" ToolTip="نمایش گزارش" />
            </td>
        </tr>
    </table>
   
    <div style="direction: ltr">
        <cc1:StiWebViewer ID="StiWebViewer1" runat="server"
            BackgroundColor="#e8e8e8" ScrollbarsMode="true" ToolbarDisplayMode="Separated"
            Width="100%" Height="600px" />

    </div>
    <script language="javascript" type="text/javascript">
        SetDisplay();
        function SetDisplay() {
            if (panel.style.display == "inline") {
                panel.style.display = "none"
                btnslide.innerText = "نمایش انتخاب پرسنل";
            }
            else {
                panel.style.display = "inline"
                btnslide.innerText = "بستن"
            }
        }

    </script>
</asp:Content>
