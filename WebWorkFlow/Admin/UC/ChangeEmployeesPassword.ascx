<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Admin.UC.ChangeEmployeesPassword"
    CodeBehind="ChangeEmployeesPassword.ascx.cs" %>
<%@ Register Src="~/UC/ChangePass.ascx" TagName="ChangePass" TagPrefix="uc1" %>
<body class="bd">
    <div id="Div_ChangePass" runat="server" align="center" style="position: absolute; display: inline; border: 1px solid; top: 30%; left: 35%">
        <div id="progressBackgroundFilter">
        </div>
        <div id="ModalMessage">
            <uc1:ChangePass ID="ChangePass1" runat="server" OnCancelUserControl="ChangePass1_CancelUserControl" />
        </div>
    </div>
    <table style="background-color: LightSteelBlue; width: 100%">
        <caption>
            معرفی وتنظیم رمز عبور
        </caption>
        <tr>
            <td style="text-align: center">شماره پرسنلی :<br />
                <asp:TextBox ID="EditEmpNo" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center">نام خانوادگی :<br />
                <asp:TextBox ID="EditEmpFamily" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center">نام :<br />
                <asp:TextBox ID="EditEmpName" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: center">بخش :<br />
                <asp:TextBox ID="EditSection" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="BtnSearchEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                    OnClick="BtnSearchEmp_Click" Width="20px" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <PT:GridViewEx ID="GrdEmployee" runat="server" Style="width: 100%" BackColor="White"
                    BorderColor="LightGray" Caption="لیست پرسنل" AutoGenerateColumns="False" FilterExpression=""
                    OnDataSourceRequested="GrdEmployee_DataSourceRequested" AllowPaging="True" AllowSorting="True"
                    CssClass="RedDatagrid" PageSize="20">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                        NextPageText="بعدی" PreviousPageText="قبلی" PageButtonCount="20" />
                    <FooterStyle CssClass="RedDatagridFooter" />

                    <Columns>
                        <asp:TemplateField HeaderText="انتخاب">
                            <HeaderTemplate>                                
                                <asp:CheckBox ID="chkAll" onclick="javascript:SelectAllCheckboxes(this);" runat="server"
                                    AutoPostBack="false" ToolTip="Select/Deselect All"></asp:CheckBox>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" onclick="javascript:HighlightRow(this);" runat="server"
                                    AutoPostBack="false"></asp:CheckBox>
                            </ItemTemplate>
                            <ItemStyle Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button CssClass="btn" ID="BtnOk" runat="server" Text="تغییر رمز" OnClick="BtnOk_Click"
                                    ToolTip='<%# "شماره کارت :" + Eval("EMP_NO")+" \n*کد کاربری :" +Eval("WFUserName")+" \n*نام :" +Eval("NAME")+" \n*نام خانوادگی :" +Eval("FAMILY") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EMP_NO" HeaderText="شماره کارت" SortExpression="EMP_NO" />
                        <asp:BoundField DataField="PERS_NO" HeaderText="شماره پرسنلی" SortExpression="PERS_NO" />
                        <asp:BoundField DataField="NAME" HeaderText="نام" SortExpression="NAME" />
                        <asp:BoundField DataField="FAMILY" HeaderText="نام خانوادگی" SortExpression="FAMILY" />
                        <asp:BoundField DataField="SECTIONS" HeaderText="بخش" SortExpression="SECTIONS" />
                    </Columns>
                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <SelectedRowStyle CssClass="RedDatagridSelected" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                    <RowStyle CssClass="RedDatagridItem" />
                </PT:GridViewEx>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center" rowspan="2">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Names="Tahoma"
                    ForeColor="#FF3300" Text="با موفقیت انجام شد" Visible="False"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Button ID="btnSetPassword" runat="server" Text="تنظیم رمز پیش فرض برای تمامی پرسنل بر اساس شماره کارت"
                    OnClick="btnSetPassword_Click" Width="350px" CssClass="btn" OnClientClick="return confirm('آیا با تغییر رمزها موافقید؟')" />
                <br />
            </td>
            <td style="text-align: center">
                <asp:CheckBox ID="chbSetOnlyNull" runat="server" Text="تنظیم رمز و نام کاربری برای پرسنلی که رمز و نام کاربری ندارند" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnSetPasswordByPersNo" runat="server" Text="تنظیم رمز پیش فرض برای تمامی پرسنل بر اساس شماره پرسنلی"
                    OnClick="btnSetPasswordByPersNo_Click" Width="350px" CssClass="btn"
                    OnClientClick="return confirm('آیا با تغییر رمزها موافقید؟\nتمامی رمزها تغییر می کند به شماره پرسنلی')" />
            </td>
            <td style="text-align: center">
                <asp:Button ID="btnRemoveAllUsername" runat="server" Text="حذف تمام نام کاربری ها جهت استفاده از نام کاربری سیستم حضور و غیاب"
                    OnClick="btnRemoveAllUsername_Click" Width="350px" CssClass="btn"
                    OnClientClick="return confirm('آیا با تغییر رمزها موافقید؟\nتمامی رمزها تغییر می کند به شماره پرسنلی')" />
            </td>
        </tr>
    </table>
</body>
