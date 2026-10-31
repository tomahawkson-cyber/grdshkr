<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Admin.UC.InsertWarden"
    CodeBehind="InsertWarden.ascx.cs" %>
<body class="bd">
    <table style="background-color: LightSteelBlue; width: 100%">
        <caption>
            معرفی بازرس</caption>
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td style="text-align: center">
                            شماره پرسنلی<br />
                            <asp:TextBox ID="EditEmNo" runat="server"></asp:TextBox>
                        </td>
                        <td style="text-align: center">
                            نام خانوادگی<br />
                            <asp:TextBox ID="EditEmFamily" runat="server"></asp:TextBox>
                        </td>
                        <td style="text-align: center">
                            نام<br />
                            <asp:TextBox ID="EditEmName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="BtnSearchEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                OnClick="BtnSearchEmp_Click" Width="20px" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;
            </td>
            <td align="center">
                <table>
                    <tr>
                        <td style="text-align: center">
                            شماره پرسنلی<br />
                            <asp:TextBox ID="EditWardenNo" runat="server"></asp:TextBox>
                        </td>
                        <td style="text-align: center">
                            نام خانوادگی<br />
                            <asp:TextBox ID="EditWardenFamily" runat="server"></asp:TextBox>
                        </td>
                        <td style="text-align: center">
                            نام<br />
                            <asp:TextBox ID="EditWardenName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="BtnSearchSupervisor" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                OnClick="BtnSearchSupervisor_Click" Width="20px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <PT:GridViewEx ID="GrdEmployee" runat="server" Style="width: 100%" Caption="لیست پرسنل"
                    AutoGenerateColumns="False" OnDataSourceRequested="GrdEmployee_DataSourceRequested"
                    AllowPaging="True" AllowSorting="True" PageSize="15" CssClass="RedDatagrid">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                        NextPageText="بعدی" PreviousPageText="قبلی" PageButtonCount="15" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
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
                        </asp:TemplateField>
                        <asp:BoundField DataField="EMP_NO" HeaderText="شماره پرسنلی" SortExpression="EMP_NO" />
                        <asp:BoundField DataField="NAME" HeaderText="نام" SortExpression="NAME" />
                        <asp:BoundField DataField="FAMILY" HeaderText="نام خانوادگی" SortExpression="FAMILY" />
                        <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE" />
                    </Columns>
                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <SelectedRowStyle CssClass="RedDatagridSelected" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                </PT:GridViewEx>
            </td>
            <td style="text-align: center">
                <asp:ImageButton ID="btnAdd" runat="server" Height="50px" ImageAlign="AbsBottom"
                    ImageUrl="~/images/RightBtnTop.jpg" ToolTip="افزودن" Width="50px" OnClick="btnAdd_Click" />
                <br />
                <br />
                <br />
                <br />
                <asp:ImageButton ID="btnDel" runat="server" Height="50px" ImageAlign="AbsBottom"
                    ImageUrl="~/images/LeftBtnTop.jpg" ToolTip="حذف کردن" Width="50px" OnClick="btnDel_Click" />
            </td>
            <td valign="top">
                <PT:GridViewEx ID="GrdWarden" runat="server" Style="width: 100%" Caption="لیست بازرسان"
                    AutoGenerateColumns="False" OnDataSourceRequested="GrdSupervisor_DataSourceRequested"
                    AllowPaging="True" AllowSorting="True" PageSize="15" CssClass="RedDatagrid">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                        NextPageText="بعدی" PageButtonCount="15" PreviousPageText="قبلی" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
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
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="شماره پرسنلی" SortExpression="Emp_No">
                            <EditItemTemplate>
                                <asp:Label ID="lblEMP_NO" runat="server" Text='<%# Bind("EMP_NO") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEMP_NO2" runat="server" Text='<%# Bind("EMP_NO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام" SortExpression="NAME">
                            <EditItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblName2" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام خانوادگی" SortExpression="FAMILY">
                            <EditItemTemplate>
                                <asp:Label ID="lblFAMILY" runat="server" Text='<%# Bind("FAMILY") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFAMILY2" runat="server" Text='<%# Bind("FAMILY") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="بخش" SortExpression="TITLE">
                            <EditItemTemplate>
                                <asp:Label ID="lblSECTIONS" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSECTIONS2" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <SelectedRowStyle CssClass="RedDatagridSelected" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                </PT:GridViewEx>
            </td>
        </tr>
    </table>
</body>
