<%@ Page Title="شرکت دنیای پردازش :: تعریف کارتابل خاص" Language="C#" MasterPageFile="~/MasterPagePW.master"
    AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Admin.SetEmpEmgr" CodeBehind="SetEmpEmgr.aspx.cs" %>

<%@ Register Src="~/UC/Pager.ascx" TagName="Pager" TagPrefix="custom" %>
<%@ Register Src="~/UC/SearchEmp.ascx" TagName="UC_SearchEmp" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: تعریف کارتابل خاص</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="PnlprogrammaticPopup" runat="server">
        <div id="progressBackgroundFilter">
        </div>
        <div id="Modalreq">
            <table style="background-color: White; width: 100%">
                <tr>
                    <td style="width: 20%">
                        <asp:ImageButton runat="server" ID="BtnExit" ImageUrl="~/images/BtnCancel.png" ToolTip="خروج"
                            OnClick="BtnExit_Click" />
                    </td>
                    <td align="center" style="width: 80%">سیستم گردش کار
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <uc1:UC_SearchEmp ID="UC_SearchEmp1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <table style="background-color: LightSteelBlue; width: 100%">
        <caption>
            تعریف کارتابل خاص
        </caption>
        <tr>
            <td align="center" valign="top">
                <table id="tbl1" width="100%">
                    <tr>
                        <td align="right" colspan="2">
                            <table id="tbl2" width="100%">
                                <tr>
                                    <td nowrap="nowrap">لیست پرسنل:
                                        <asp:DropDownList ID="EditManagers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="EditManagers_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:Button runat="server" ID="showModalPopup" Text="..." ToolTip="جستجو و انتخاب پرسنل"
                                            OnClick="showModalPopupServerOperatorButton_Click" BorderStyle="Solid" BorderWidth="1px"
                                            BackColor="White" Height="20" />
                                    </td>
                                    <td style="width: 100px" nowrap="nowrap">مرخصی :
                                        <asp:TextBox ID="Edit_Leave" runat="server" Width="50px"></asp:TextBox>
                                        <ACT:MaskedEditExtender ID="Edit_Leave_MaskedEditExtender" runat="server" CultureCurrencySymbolPlaceholder=""
                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                            CultureTimePlaceholder="" Enabled="True" MaskType="Number" TargetControlID="Edit_Leave"
                                            InputDirection="RightToLeft" Mask="999">
                                        </ACT:MaskedEditExtender>
                                    </td>
                                    <td style="width: 100px" nowrap="nowrap">ماموریت :
                                        <asp:TextBox ID="Edit_Duty" runat="server" Width="50px"></asp:TextBox>
                                        <ACT:MaskedEditExtender ID="Edit_Duty_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                            CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                            Enabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number" TargetControlID="Edit_Duty">
                                        </ACT:MaskedEditExtender>
                                    </td>
                                    <td style="width: 125px" nowrap="nowrap">م بدون حقوق :
                                        <asp:TextBox ID="Edit_LeaveOut" runat="server" Width="50px"></asp:TextBox>
                                        <ACT:MaskedEditExtender ID="Edit_LeaveOut_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                            CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                            Enabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number" TargetControlID="Edit_LeaveOut">
                                        </ACT:MaskedEditExtender>
                                    </td>
                                </tr>
                            </table>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <table width="100%">
                                <tr>
                                    <td style="text-align: right; width: 250px">افراد کارتابل خاص<br />
                                        <asp:DropDownList ID="EditEmpEmgr" runat="server" Width="200px" OnSelectedIndexChanged="EditEmpEmgr_SelectedIndexChanged"
                                            AutoPostBack="True">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: center">شماره پرسنلی<br />
                                    </td>
                                    <td style="text-align: center">نام خانوادگی<br />
                                    </td>
                                    <td style="text-align: center">نام<br />
                                    </td>
                                    <td style="text-align: center" rowspan="2">
                                        <asp:ImageButton ID="BtnSearchEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                            OnClick="BtnSearchEmp_Click" Width="20px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 250px">بخش<br />
                                        <asp:DropDownList ID="EditSection" runat="server" CssClass="Ddl" AutoPostBack="True"
                                            OnSelectedIndexChanged="EditOperation_SelectedIndexChanged" Width="96%">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:TextBox ID="EditEmNo" runat="server" Width="100px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:TextBox ID="EditEmFamily" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:TextBox ID="EditEmName" runat="server" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" colspan="2">
                            <PT:GridViewEx ID="GrdSeletableEmployees" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" Caption="لیست پرسنل قابل انتخاب" OnDataSourceRequested="GrdSeletableEmployees_DataSourceRequested"
                                Style="width: 100%" CssClass="RedDatagrid" OnRowDataBound="GrdSeletableEmployees_RowDataBound"
                                OnRowCancelingEdit="GrdSeletableEmployees_RowCancelingEdit" OnRowEditing="GrdSeletableEmployees_RowEditing"
                                OnRowUpdating="GrdSeletableEmployees_RowUpdating">
                                <PagerSettings FirstPageText="اول" LastPageText="آخر" NextPageText="بعدی" PreviousPageText="قبلی"
                                    Visible="false" Mode="NumericFirstLast" />
                                <FooterStyle CssClass="RedDatagridFooter" />
                                <RowStyle CssClass="RedDatagridItem" />
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="false" onclick="javascript:SelectAllCheckboxes(this);"
                                                ToolTip="Select/Deselect All"></asp:CheckBox>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="false" onclick="javascript:HighlightRow(this);"></asp:CheckBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="20px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="شماره پرسنلی" SortExpression="EMP_NO">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("EMP_NO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="LblEmpNo" runat="server" Text='<%# Bind("EMP_NO") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="نام" SortExpression="NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="TextBox2" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="نام خانوادگی" SortExpression="FAMILY">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("FAMILY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="TextBox3" runat="server" Text='<%# Bind("FAMILY") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="کد بخش" SortExpression="SEC_NO" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("SEC_NO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="TextBox4" runat="server" Text='<%# Bind("SEC_NO") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="بخش" SortExpression="TITLE">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="TextBox5" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="کد مدیر" SortExpression="EmpMngr">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("EmpMngr") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblEmpMngr" runat="server" Text='<%# Bind("EmpMngr") %>'></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="مرخصی" SortExpression="LEAVE">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("LEAVE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLEAVE" runat="server" Text='<%# Bind("LEAVE") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ماموریت" SortExpression="DUTY">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("DUTY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDUTY" runat="server" Text='<%# Bind("DUTY") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="بدون حقوق" SortExpression="LeaveOut">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("LeaveOut") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLeaveOut" runat="server" Text='<%# Bind("LeaveOut") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" InsertText="درج"
                                        NewText="جدید" SelectText="انتخاب" ShowEditButton="True" UpdateText="ثبت" />
                                </Columns>
                                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                                <SelectedRowStyle CssClass="RedDatagridSelected" />
                                <HeaderStyle CssClass="RedDatagridHeader" />
                                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                            </PT:GridViewEx>
                            <custom:Pager ID="custPager" runat="server" EnableTheming="true" />
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <asp:ImageButton ID="BtnSave" runat="server" ImageUrl="~/images/Select.png" OnClick="BtnSave_Click"
                                ToolTip="ثبت" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="BtnSaveAll" runat="server" ImageUrl="~/images/SelectAll.png"
                                OnClick="BtnSaveAll_Click" ToolTip="ثبت همه" />
                        </td>
                        <td align="center" valign="top">
                            <asp:ImageButton ID="BtnDelete" runat="server" Height="50px" ImageUrl="~/mnuImage/delete_user.png"
                                OnClick="BtnDelete_Click" ToolTip="حذف" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="BtnDeleteAll" runat="server" Height="51px" ImageUrl="~/mnuImage/delete_Alluser.png"
                                OnClick="BtnDeleteAll_Click" ToolTip="حذف همه" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
