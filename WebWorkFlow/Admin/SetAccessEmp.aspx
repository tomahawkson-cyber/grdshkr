<%@ Page Title="شرکت دنیای پردازش :: معرفی مجوزهای قابل درخواست" Language="C#" MasterPageFile="~/MasterPagePW.master"
    AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Admin.SetAccessEmp" CodeBehind="SetAccessEmp.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: معرفی مجوزهای قابل درخواست</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table bgcolor="LightSteelBlue" class="style1">
        <tr>
            <td align="center" valign="top">
                <table class="style1">
                    <caption>
                        معرفی مجوزهای قابل درخواست</caption>
                    <tr>
                        <td colspan="3" align="right">
                            عملکردها :
                            <asp:DropDownList ID="EditActions" runat="server" AutoPostBack="True" OnSelectedIndexChanged="EditActions_SelectedIndexChanged">
                            </asp:DropDownList>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table width="100%">
                                <tr>
                                    <td style="text-align: center">
                                        شماره پرسنلی<br />
                                        <asp:TextBox ID="EditEmNo" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        نام خانوادگی<br />
                                        <asp:TextBox ID="EditEmFamily" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        نام<br />
                                        <asp:TextBox ID="EditEmName" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        بخش<br />
                                        <asp:TextBox ID="EditSection" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:ImageButton ID="BtnSearchEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                            OnClick="BtnSearchEmp_Click" Width="20px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="style2">
                            &nbsp;
                        </td>
                        <td align="center">
                            <table width="100%">
                                <tr>
                                    <td style="text-align: center">
                                        شماره پرسنلی<br />
                                        <asp:TextBox ID="EditEmNo0" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        نام خانوادگی<br />
                                        <asp:TextBox ID="EditEmFamily0" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        نام<br />
                                        <asp:TextBox ID="EditEmName0" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        بخش<br />
                                        <asp:TextBox ID="EditSection0" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:ImageButton ID="BtnSearchEmp0" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                            OnClick="BtnSearchEmp0_Click" Width="20px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <PT:GridViewEx ID="GrdFreeEmployees" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BorderColor="LightGray" Caption="لیست پرسنل انتخاب نشده "
                                EnableSortingAndPagingCallbacks="True" OnDataSourceRequested="GrdFreeEmployees_DataSourceRequested"
                                Style="width: 100%" CssClass="RedDatagrid">
                                <PagerSettings FirstPageText="اول" LastPageText="آخر" NextPageText="بعدی" PreviousPageText="قبلی"
                                    Mode="NumericFirstLast" PageButtonCount="15" />
                                <FooterStyle CssClass="RedDatagridFooter" />
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="false" onclick="javascript:SelectAllCheckboxes(this);"
                                                ToolTip="Select/Deselect All"></asp:CheckBox>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="false" onclick="javascript:HighlightRow(this);">
                                            </asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="EMP_NO" HeaderText="ش پرسنلی" SortExpression="EMP_NO" />
                                    <asp:BoundField DataField="NAME" HeaderText="نام" SortExpression="NAME" />
                                    <asp:BoundField DataField="FAMILY" HeaderText="ن خانوادگی" SortExpression="FAMILY" />
                                    <asp:BoundField DataField="SEC_NO" HeaderText="کد بخش" SortExpression="SEC_NO" Visible="False" />
                                    <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE" />
                                </Columns>
                                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                                <HeaderStyle CssClass="RedDatagridHeader" />
                                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                                <RowStyle CssClass="RedDatagridItem" />
                            </PT:GridViewEx>
                        </td>
                        <td class="style2">
                            <asp:ImageButton ID="btnAdd" runat="server" Height="32px" ImageAlign="AbsBottom"
                                ImageUrl="~/mnuImage/MoveLeft.png" OnClick="btnAdd_Click" ToolTip="افزودن" Width="33px" />
                            <br />
                            <asp:ImageButton ID="btnAddAll" runat="server" Height="32px" ImageAlign="AbsBottom"
                                ImageUrl="~/mnuImage/MoveAllLeft.png" OnClick="btnAddAll_Click" ToolTip="افزودن همه"
                                Width="33px" />
                            <br />
                            <br />
                            <br />
                            <br />
                            <asp:ImageButton ID="BtnDel" runat="server" Height="30px" ImageAlign="AbsBottom"
                                ImageUrl="~/mnuImage/MoveRight.png" OnClick="btnDel_Click" ToolTip="حذف کردن"
                                Width="33px" />
                            <br />
                            <asp:ImageButton ID="BtnDelAll" runat="server" Height="30px" ImageAlign="AbsBottom"
                                ImageUrl="~/mnuImage/MoveAllRight.png" OnClick="BtnDelAll_Click" ToolTip="حذف کردن همه"
                                Width="33px" />
                        </td>
                        <td align="center" valign="top">
                            <PT:GridViewEx ID="GrdUnFreeEmployees" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BorderColor="LightGray" Caption="لیست پرسنل انتخاب شده "
                                EnableSortingAndPagingCallbacks="True" OnDataSourceRequested="GrdUnFreeEmployees_DataSourceRequested"
                                Style="width: 100%" CssClass="RedDatagrid">
                                <PagerSettings FirstPageText="اول" LastPageText="آخر" NextPageText="بعدی" PreviousPageText="قبلی"
                                    Mode="NumericFirstLast" PageButtonCount="15" />
                                <FooterStyle CssClass="RedDatagridFooter" />
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll0" runat="server" AutoPostBack="false" onclick="javascript:SelectAllCheckboxes(this);"
                                                ToolTip="Select/Deselect All"></asp:CheckBox>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect0" runat="server" AutoPostBack="false" onclick="javascript:HighlightRow(this);">
                                            </asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="EMP_NO" HeaderText="ش پرسنلی" SortExpression="EMP_NO" />
                                    <asp:BoundField DataField="NAME" HeaderText="نام" SortExpression="NAME" />
                                    <asp:BoundField DataField="FAMILY" HeaderText="ن خانوادگی" SortExpression="FAMILY" />
                                    <asp:BoundField DataField="SEC_NO" HeaderText="کد بخش" SortExpression="SEC_NO" Visible="False" />
                                    <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE" />
                                </Columns>
                                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                                <HeaderStyle CssClass="RedDatagridHeader" />
                                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                                <RowStyle CssClass="RedDatagridItem" />
                            </PT:GridViewEx>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
