<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Admin.UC.InsertUsers"
    CodeBehind="InsertUsers.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc2" %>
<body class="bd" dir="rtl">
    <table bgcolor="LightSteelBlue" style="width: 100%">
        <caption>
            معرفی کاربران</caption>
        <tr runat="server" id="Tr_Insert">
            <td align="center">
                <div style="border: 1; border-color: Black; border-style: solid; border-width: thin">
                    <table width="100%" style="background-color: #f7f7f7;">
                        <tr>
                            <td class="style1">
                                نام کاربری :
                            </td>
                            <td align="right" colspan="2">
                                <asp:TextBox ID="Edit_USERS_ID" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" rowspan="2">
                                <table style="width: 100%; background-color: #E4E4E4;">
                                    <tr id="trChangePass" runat="server">
                                        <td style="text-align: right" colspan="2">
                                            <asp:CheckBox ID="Chb_IsChangePass" runat="server" AutoPostBack="True" OnCheckedChanged="Chb_IsChangePass_CheckedChanged"
                                                Text="رمز عبور تغییر پیدا کند" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            رمز عبور :
                                        </td>
                                        <td style="text-align: right">
                                            <asp:TextBox ID="Edit_USERS_PASSWORD" runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            تکرار رمز عبور:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Edit_USERS_PASSWORD0" runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                &nbsp;&nbsp;تاریخ انقضا:&nbsp;
                            </td>
                            <td align="right" colspan="2">
                                <uc2:DatePicker ID="Edit_USERS_DEACTIV_DATE" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="BtnDelete" runat="server" Text="حذف" OnClick="BtnDelete_Click" CausesValidation="False"
                                    CssClass="Btn" OnClientClick="return confirm('آیا با حذف اطلاعات انتخابی موافقید؟')" />
                            </td>
                            <td colspan="2">
                                <asp:Button ID="BtnNew" runat="server" Text="جدید" OnClick="BtnNew_Click" CausesValidation="False"
                                    CssClass="Btn" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BtnOk" runat="server" Text="ثبت" OnClick="BtnOk_Click" CausesValidation="False"
                                    CssClass="Btn" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Edit_USERS_PASSWORD0"
                                    ControlToValidate="Edit_USERS_PASSWORD" ErrorMessage="تکرار رمز عبور صحیح نمی باشد">*</asp:CompareValidator>
                                <asp:Label ID="lblConfirm" runat="server" ForeColor="Red" Width="100%"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table width="100%">
                    <tr>
                        <td style="text-align: center">
                            نام کاربری
                            <asp:TextBox ID="EditUSERS_ID" runat="server"></asp:TextBox>
                            &nbsp; &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="BtnSearchUsers" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                OnClick="BtnSearchManager_Click" Width="20px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <PT:GridViewEx ID="GrdUsers" runat="server" Style="width: 100%" AutoGenerateColumns="False"
                    OnDataSourceRequested="GrdUsers_DataSourceRequested" AllowPaging="True" AllowSorting="True"
                    DataKeyNames="USERS_ID,USERS_DEACTIV_DATE,USERS_PASSWORD" OnSelectedIndexChanged="GrdUsers_SelectedIndexChanged"
                    Caption="لیست کاربران" CssClass="RedDatagrid" EnableModelValidation="True" OnRowDataBound="GrdUsers_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                        NextPageText="بعدی" PageButtonCount="20" PreviousPageText="قبلی" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <Columns>
                        <asp:CommandField SelectText="انتخاب" ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="USERS_ID" HeaderText="نام کاربری" SortExpression="USERS_ID" />
                        <asp:BoundField DataField="USERS_ACTIVITY_DATE" HeaderText="تاریخ ثبت" SortExpression="USERS_ACTIVITY_DATE" />
                        <asp:BoundField DataField="USERS_DEACTIV_DATE" HeaderText="تاریخ انقضا" SortExpression="USERS_DEACTIV_DATE" />
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
