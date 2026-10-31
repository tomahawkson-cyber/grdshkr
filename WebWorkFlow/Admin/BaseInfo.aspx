<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="BaseInfo.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.BaseInfo"
    Title="شرکت دنیای پردازش :: معرفی بازه دسترسی " %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>شرکت دنیای پردازش :: معرفی بازه دسترسی </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" bgcolor="LightSteelBlue">
        <tr>
            <td align="center">
                <table id="tblInsertData" style="background-color: #f7f7f7; border: thin solid #000080; width: 500px">
                    <tr class="cap">
                        <td colspan="3">ثبت وسیله ایاب و ذهاب
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">عنوان وسیله&nbsp; ایاب و ذهاب :&nbsp;&nbsp;
                        </td>
                        <td style="text-align: right" colspan="2">
                            <asp:TextBox ID="EditBaseValue" runat="server" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EditBaseValue"
                                ErrorMessage="نام وسیله را مشخص کنید">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">کد وسیله تردد :&nbsp;&nbsp;
                        </td>
                        <td style="text-align: right" colspan="2">
                            <asp:TextBox ID="EditBaseCode" runat="server" Height="22px" Style="margin-right: 2px"
                                ValidationGroup="t1" Width="30px">0</asp:TextBox>
                            <ACT:MaskedEditExtender ID="EditBaseCode_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="EditBaseCode">
                            </ACT:MaskedEditExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="BtnDelete" runat="server" Text="   حذف   " CssClass="btn" OnClick="BtnDelete_Click"
                                CausesValidation="False" OnClientClick="return confirm_delete();" />
                        </td>
                        <td>
                            <asp:Button ID="BtnSave" runat="server" CssClass="btn" Text=" ثبت اطلاعات " OnClick="BtnSave_Click" />

                        </td>
                        <td>

                            <asp:Button ID="BtnCancel" runat="server" Text="   انصراف   " CssClass="btn" OnClick="BtnCancel_Click"
                                CausesValidation="False" />
                        </td>
                    </tr>
                </table>
                <PT:GridViewEx ID="GrdBaseInfo" runat="server" Style="width: 500px" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" BorderColor="LightGray" OnDataSourceRequested="GrdBaseInfo_DataSourceRequested"
                    DataKeyNames="BaseId,BaseCode,BaseValue"
                    CssClass="RedDatagrid" BorderStyle="Solid" BorderWidth="1px" EnableModelValidation="True"
                    OnSelectedIndexChanged="GrdBaseInfo_SelectedIndexChanged">
                    <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <Columns>
                        <asp:CommandField SelectText="انتخاب" ShowSelectButton="True" ButtonType="Button">
                            <ItemStyle Width="20px" ForeColor="White" BackColor="#000066" />
                        </asp:CommandField>
                        <asp:BoundField DataField="BaseCode" HeaderText="کد وسیله" SortExpression="BaseCode" />
                        <asp:BoundField DataField="BaseValue" HeaderText="نام وسیله تردد" SortExpression="BaseValue" />
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
