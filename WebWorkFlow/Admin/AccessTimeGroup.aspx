<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="AccessTimeGroup.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.AccessTimeGroup"
    Title="شرکت دنیای پردازش :: معرفی بازه دسترسی " %>

<%@ Register Src="~/Admin/UC/UserAccessTime.ascx" TagName="UserAccessTime" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>شرکت دنیای پردازش :: معرفی بازه دسترسی </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tr>
            <td align="center">
                <table style="border-style: solid; border-width: thin; border-color: #000080; width: 500px;
                    background-color: #CCCCCC">
                    <tr>
                        <td valign="top">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/add.png" ToolTip="جدید"
                                OnClick="BtnAddGroup_Click" />
                            افزودن بازه جدید
                            <asp:ImageButton ID="BtnAddGroup" runat="server" ImageUrl="~/images/add.png" ToolTip="جدید"
                                OnClick="BtnAddGroup_Click" />
                        </td>
                    </tr>
                </table>
                <table id="tblInsertData" visible="false" runat="server" bgcolor="LightSteelBlue"
                    width="500px" style="border: thin solid #000080;">
                    <tr class="cap">
                        <td colspan="2">
                            ثبت بازه دسترسی
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            عنوان بازه دسترسی :
                        </td>
                        <td style="text-align: right">
                            <asp:TextBox ID="EditGroupName" runat="server" Width="80%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EditGroupName"
                                ErrorMessage="نام گروه را مشخص کنید">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" width="15%">
                            نوع بازه دسترسی :
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="EditGroupStatus" runat="server" Width="40%" OnSelectedIndexChanged="EditGroupStatus_SelectedIndexChanged"
                                AutoPostBack="True">
                                <asp:ListItem Value="0">بدون محدوديت زماني</asp:ListItem>
                                <asp:ListItem Value="1">در محدوده شيفت</asp:ListItem>
                                <asp:ListItem Value="2">براساس جدول هفتگی</asp:ListItem>
                                <asp:ListItem Value="3">بازه ثابت(همه روزه)</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table id="TblShiftTolerance" runat="server" visible="false" align="center">
                                <tr>
                                    <td style="text-align: left" id="tdDecTolerance" runat="server">
                                        مدت مجاز قبل از شیفت :
                                    </td>
                                    <td style="text-align: right">
                                        <asp:TextBox ID="EditDecTolerance" runat="server" Height="22px" Style="margin-right: 2px"
                                            ValidationGroup="t1" Width="40px">00:00</asp:TextBox>
                                        <ACT:MaskedEditExtender ID="EditDecTolerance_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                            CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditDecTolerance">
                                        </ACT:MaskedEditExtender>
                                        <ACT:MaskedEditValidator ID="MaskedEditDecTolerance" runat="server" ControlExtender="EditDecTolerance_MaskedEditExtender"
                                            ControlToValidate="EditDecTolerance" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                                            InvalidValueMessage="مقدار ناردست" ToolTip="زمان را وارد نمایید" ValidationGroup="t1"></ACT:MaskedEditValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" id="tdIncTolerance" runat="server">
                                        مدت مجاز بعد از شیفت :
                                    </td>
                                    <td style="text-align: right">
                                        <asp:TextBox ID="EditIncTolerance" runat="server" Height="22px" Style="margin-right: 2px"
                                            ValidationGroup="t1" Width="40px">00:00</asp:TextBox>
                                        <ACT:MaskedEditExtender ID="EditIncTolerance_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                            CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditIncTolerance">
                                        </ACT:MaskedEditExtender>
                                        <ACT:MaskedEditValidator ID="MaskedEditIncTolerance" runat="server" ControlExtender="EditIncTolerance_MaskedEditExtender"
                                            ControlToValidate="EditIncTolerance" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                                            InvalidValueMessage="مقدار ناردست" ToolTip="زمان را وارد نمایید" ValidationGroup="t1"
                                            SetFocusOnError="True"></ACT:MaskedEditValidator>
                                    </td>
                                </tr>
                            </table>
                            <div id="DivUserAccessTime" runat="server" visible="false">
                                <uc1:UserAccessTime ID="UserAccessTime1" runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="BtnSave" runat="server" CssClass="btn" Text="    ثبت   " OnClick="BtnSave_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnDelete" runat="server" Text="   حذف   " CssClass="btn" OnClick="BtnDelete_Click"
                                CausesValidation="False" OnClientClick="return confirm_delete();" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnCancel" runat="server" Text="   انصراف   " CssClass="btn" OnClick="BtnCancel_Click"
                                CausesValidation="False" />
                        </td>
                    </tr>
                </table>
                <PT:GridViewEx ID="GrdAccessTimeGroup" runat="server" Style="width: 500px" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" BorderColor="LightGray" OnDataSourceRequested="GrdAccessTimeGroup_DataSourceRequested"
                    DataKeyNames="AccessTimeGroupID,GroupName,GroupStatus,IncTolerance,DecTolerance"
                    CssClass="RedDatagrid" BorderStyle="Solid" BorderWidth="1px" EnableModelValidation="True"
                    OnSelectedIndexChanged="GrdAccessTimeGroup_SelectedIndexChanged">
                    <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <Columns>
                        <asp:CommandField SelectText="ویرایش" ShowSelectButton="True">
                            <ItemStyle Width="20px" ForeColor="White" BackColor="#000066" />
                        </asp:CommandField>
                        <asp:BoundField DataField="AccessTimeGroupID" HeaderText="کد بازه" SortExpression="AccessTimeGroupID"
                            Visible="False" />
                        <asp:BoundField DataField="GroupName" HeaderText="عنوان بازه" SortExpression="GroupName" />
                        <asp:BoundField DataField="GroupStatus" HeaderText="کد نوع بازه" SortExpression="GroupStatus"
                            Visible="False">
                            <ItemStyle Width="15px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IncTolerance" HeaderText="بعد از شیفت" SortExpression="IncTolerance"
                            Visible="False" />
                        <asp:BoundField DataField="DecTolerance" HeaderText="قبل از شیفت" SortExpression="DecTolerance"
                            Visible="False" />
                        <asp:BoundField DataField="GroupStatusName" HeaderText="نوع بازه" SortExpression="GroupStatusName">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                    <SelectedRowStyle BackColor="#660033" ForeColor="White" />
                </PT:GridViewEx>
            </td>
        </tr>
    </table>
</asp:Content>
