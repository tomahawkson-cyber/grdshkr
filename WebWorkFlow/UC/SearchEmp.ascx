<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.UC.SearchEmp"
    CodeBehind="SearchEmp.ascx.cs" %>
<%@ Register Src="~/UC/Pager.ascx" TagName="Pager" TagPrefix="custom" %>

<table bgcolor="LightSteelBlue" dir="rtl" width="100%">
    <tr>
        <td align="center">
            <table width="100%">
                <tr>
                    <td align="center">
                        شماره پرسنلی :&nbsp;&nbsp;<br />
                        <asp:TextBox ID="EditEmpNo" runat="server"></asp:TextBox>
                    </td>
                    <td align="center">
                        نام :&nbsp;&nbsp;<br />
                        <asp:TextBox ID="EditEmpName" runat="server"></asp:TextBox>
                    </td>
                    <td align="center">
                        نام خانوادگی :&nbsp;<br />
                        <asp:TextBox ID="EditEmpFamily" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="BtnSearchEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                            OnClick="BtnSearchEmp_Click" Width="20px" ToolTip="جستجو در لیست" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center">
            <PT:GridViewEx ID="GrdEmployee" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                CssClass="RedDatagrid" CellPadding="3" GridLines="Horizontal" OnDataSourceRequested="GrdEmployee_DataSourceRequested"
                PageSize="20" Style="width: 100%" OnSelectedIndexChanged="GrdEmployee_SelectedIndexChanged">
                <PagerSettings FirstPageText="اولین" LastPageText="آخرین" Mode="NumericFirstLast"
                    NextPageText="بعدی" PreviousPageText="قبلی" />
                <FooterStyle CssClass="RedDatagridFooter" />
                <RowStyle CssClass="RedDatagridItem" />
                <Columns>
                    <asp:CommandField SelectText="انتخاب" ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="EMP_NO" HeaderText="شماره پرسنلی" SortExpression="EMP_NO" />
                    <asp:BoundField DataField="NAME" HeaderText="نام" SortExpression="NAME" />
                    <asp:BoundField DataField="FAMILY" HeaderText="نام خانوادگی" SortExpression="FAMILY" />
                    <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE" />
                </Columns>
                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <HeaderStyle CssClass="RedDatagridHeader" />
                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
            </PT:GridViewEx>
            <br />
            <custom:Pager ID="custPager" runat="server" />
        </td>
    </tr>
</table>
