<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.SetPermission" Title="شرکت دنیای پردازش :: عملکردهای قابل دسترسی"
    CodeBehind="SetPermission.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: عملکردهای قابل دسترسی</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%">
        <caption>
            عملکردهای قابل دسترسی
        </caption>
        <tr>
            <td align="center" valign="top">
                <table width="100%">
                    <tr>
                        <td valign="top" width="50%">
                            <PT:GridViewEx ID="GrdAction" runat="server" AutoGenerateColumns="False" Height="100%"
                                Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                CellPadding="4" DataKeyNames="ActionId" ForeColor="Black" GridLines="Vertical" CssClass="RedDatagrid"
                                OnDataSourceRequested="GrdAction_DataSourceRequested" OnRowCancelingEdit="GrdAction_RowCancelingEdit"
                                OnRowEditing="GrdAction_RowEditing" OnRowUpdating="GrdAction_RowUpdating" EnableModelValidation="True">
                                <FooterStyle CssClass="RedDatagridFooter" />
                                <RowStyle CssClass="RedDatagridItem" />
                                <Columns>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" CancelText="انصراف" DeleteText="حذف"
                                        EditText="ویرایش" InsertText="جدید" NewText="جدید" UpdateText="ثبت">
                                        <ItemStyle HorizontalAlign="Center" Width="120px" Wrap="false" />
                                    </asp:CommandField>
                                    <asp:TemplateField HeaderText="کد عملکرد" SortExpression="ActionId">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblActionId" runat="server" Text='<%# Bind("ActionId") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblActionIdR" runat="server" Text='<%# Bind("ActionId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="شرح عملکرد" SortExpression="Fdesc">
                                        <EditItemTemplate>
                                            <asp:Label ID="TextBox2" runat="server" Text='<%# Bind("Fdesc") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fdesc") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="دسترسی" SortExpression="IsPermission">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChbIsPermissionR" Checked='<%# Bind("IsPermission") %>' runat="server"
                                                Enabled="False" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox Checked='<%# Bind("IsPermission") %>' ID="ChbIsPermission" runat="server" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="محدوده مجاز ثبت درخواست" SortExpression="RequestValidDays">
                                        <ItemTemplate>
                                            تا
                                            <asp:Label ID="lblRequestValidDays" runat="server" Text='<%# Bind("RequestValidDays") %>'></asp:Label>
                                            روز بعد
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            تا
                                            <asp:TextBox ID="EditRequestValidDays" runat="server" Height="22px" Style="margin-right: 2px"
                                                Width="20px" Text='<%# Bind("RequestValidDays") %>'></asp:TextBox>
                                            روز بعد
                                            <ACT:MaskedEditExtender ID="EditRequestValidDays_MaskedEditExtender" runat="server"
                                                ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                                CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="EditRequestValidDays">
                                            </ACT:MaskedEditExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="محدودیت تعداد درخواست" SortExpression="LimitCount">
                                        <ItemTemplate>
                                            تعداد
                                            <asp:Label ID="lblLimitCount" runat="server" Text='<%# Bind("LimitCount") %>'></asp:Label>
                                            درخواست
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            تعداد
                                            <asp:TextBox ID="EditLimitCount" runat="server" Height="22px" Style="margin-right: 2px"
                                                Width="20px" Text='<%# Bind("LimitCount") %>'></asp:TextBox>
                                            درخواست
                                            <ACT:MaskedEditExtender ID="EditLimitCount_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                                CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="EditLimitCount">
                                            </ACT:MaskedEditExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="قابلیت چاپ برای پرسنل" SortExpression="PrintAccess">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChbPrintAccess" Checked='<%# Bind("PrintAccess") %>' runat="server"
                                                Enabled="False" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox runat="server" ID="EditPrintAccess" Checked='<%# Bind("PrintAccess") %>' />
                                        </EditItemTemplate>
                                        <ItemStyle Width="150px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="توضیحات اجباری" SortExpression="NeedDesc">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChbNeedDesc" Checked='<%# Bind("NeedDesc") %>' runat="server"
                                                          Enabled="False" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox runat="server" ID="EditNeedDesc" Checked='<%# Bind("NeedDesc") %>' />
                                        </EditItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                                <HeaderStyle CssClass="RedDatagridHeader" />
                                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                            </PT:GridViewEx>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
