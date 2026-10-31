<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Admin.UC.EmployeePrintViewer"
    CodeBehind="EmployeePrintViewer.ascx.cs" %>

<table style="background-color: LightSteelBlue; width: 100%">
    <caption>
        انتساب پرسنل به مسئول چاپ احکام 
    </caption>
    <tr>
        <td align="right" colspan="3">
            <table>
                <tr>
                    <td>نام مسئول چاپ احکام :&nbsp;&nbsp;
                        <asp:DropDownList ID="EditSupervisor" runat="server" AutoPostBack="True" CssClass="Ddl"
                            OnSelectedIndexChanged="EditSupervisor_SelectedIndexChanged" Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <hr />
        </td>
    </tr>
    <tr>
        <td align="center">
            <table>
                <tr>
                    <td>شماره پرسنلی<br />
                        <asp:TextBox ID="EditEmpNo" runat="server"></asp:TextBox>
                    </td>
                    <td>نام خانوادگی<br />
                        <asp:TextBox ID="EditEmFamily" runat="server"></asp:TextBox>
                    </td>
                    <td>نام<br />
                        <asp:TextBox ID="EditEmName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="BtnSearchUnEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                            OnClick="BtnSearchUnEmp_Click" ToolTip="جستجو" Width="20px" />
                    </td>
                </tr>
            </table>
        </td>
        <td>&nbsp;
        </td>
        <td align="center">
            <table>
                <tr>
                    <td>شماره پرسنلی<br />
                        <asp:TextBox ID="EditEmpNo1" runat="server"></asp:TextBox>
                    </td>
                    <td>نام خانوادگی<br />
                        <asp:TextBox ID="EditEmFamily1" runat="server"></asp:TextBox>
                    </td>
                    <td dir="rtl">نام<br />
                        <asp:TextBox ID="EditEmName1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="BtnSearchEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                            OnClick="BtnSearchEmp_Click" ToolTip="جستجو" Width="20px" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <PT:GridViewEx ID="GrdEmployees" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" BorderColor="LightGray" Caption="لیست پرسنل انتخاب نشده "
                EnableSortingAndPagingCallbacks="True" FilterExpression="" OnDataSourceRequested="GrdEmployees_DataSourceRequested"
                Style="width: 100%" CssClass="RedDatagrid">
                <PagerSettings Mode="NumericFirstLast" FirstPageText="اول" LastPageText="آخر" NextPageText="بعدی"
                    PreviousPageText="قبلی" />
                <FooterStyle CssClass="RedDatagridFooter" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="false" onclick="javascript:SelectAllCheckboxes(this);"
                                ToolTip="Select/Deselect All"></asp:CheckBox>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="false" onclick="javascript:HighlightRow(this);"></asp:CheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EMP_NO" HeaderText="شماره پرسنلی" SortExpression="EMP_NO" />
                    <asp:BoundField DataField="NAME" HeaderText="نام" SortExpression="NAME" />
                    <asp:BoundField DataField="FAMILY" HeaderText="نام خانوادگی" SortExpression="FAMILY" />
                    <asp:BoundField DataField="SEC_NO" HeaderText="کد بخش" SortExpression="SEC_NO" Visible="False" />
                    <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE" />
                </Columns>
                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                <HeaderStyle CssClass="RedDatagridHeader" />
                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                <RowStyle CssClass="RedDatagridItem" />
            </PT:GridViewEx>
        </td>
        <td valign="middle">
            <asp:ImageButton ID="btnAdd" runat="server" Height="50px" ImageAlign="AbsBottom" OnClientClick="return  confirm('آیا با اعمال تغییرات موافقید؟')"
                ImageUrl="~/images/RightBtnTop.jpg" OnClick="btnAdd_Click" ToolTip="افزودن" Width="50px" />
            <br />
            <br />
            <br />
            <asp:ImageButton ID="BtnDel" runat="server" Height="50px" ImageAlign="AbsBottom" OnClientClick="return  confirm('آیا با اعمال تغییرات موافقید؟')"
                ImageUrl="~/images/LeftBtnTop.jpg" OnClick="btnDel_Click" ToolTip="حذف کردن"
                Width="50px" />
            <br />
        </td>
        <td valign="top">
            <PT:GridViewEx ID="GrdSelectedEmployees" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" BorderColor="LightGray" Caption="لیست پرسنل انتخاب شده "
                EnableSortingAndPagingCallbacks="True" OnDataSourceRequested="GrdSelectedEmployees_DataSourceRequested"
                Style="width: 100%" CssClass="RedDatagrid" FilterExpression="">
                <PagerSettings Mode="NumericFirstLast" FirstPageText="اول" LastPageText="آخر" NextPageText="بعدی"
                    PreviousPageText="قبلی" />
                <FooterStyle CssClass="RedDatagridFooter" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkAll0" runat="server" AutoPostBack="false" onclick="javascript:SelectAllCheckboxes(this);"
                                ToolTip="Select/Deselect All"></asp:CheckBox>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect0" runat="server" AutoPostBack="false" onclick="javascript:HighlightRow(this);"></asp:CheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SupervisorEmp_No" HeaderText="SupervisorEmp_No" Visible="False" />
                    <asp:BoundField DataField="OperationsID" HeaderText="OperationsID" Visible="False" />
                    <asp:BoundField DataField="Emp_No" HeaderText="شماره پرسنلی" SortExpression="Emp_No" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="نام" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="EmployeeFamily" HeaderText="نام خانوادگی" SortExpression="EmployeeFamily" />
                    <asp:BoundField DataField="Sec_No" HeaderText="Sec_No" SortExpression="Sec_No" Visible="False" />
                    <asp:BoundField DataField="SECTIONS" HeaderText="بخش" SortExpression="SECTIONS" />
                </Columns>
                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                <HeaderStyle CssClass="RedDatagridHeader" />
                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                <RowStyle CssClass="RedDatagridItem" />
            </PT:GridViewEx>
        </td>
    </tr>
</table>
