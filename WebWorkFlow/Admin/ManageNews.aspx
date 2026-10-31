<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true" CodeBehind="ManageNews.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.ManageNews" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagPrefix="uc1" TagName="DatePicker" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tr>
            <td align="center">
                <table style="border-style: solid; border-width: thin; border-color: #000080; width: 85%; background-color: #CCCCCC">
                    <tr>
                        <td valign="top">افزودن اطلاعیه&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="BtnAdd" runat="server" ImageUrl="~/images/add.png" ToolTip="جدید"
                                OnClick="BtnAdd_Click" />
                        </td>
                    </tr>
                </table>
                <table id="tblInsertData" visible="false" runat="server" bgcolor="LightSteelBlue"
                    width="85%" style="border: thin solid #000080;">
                    <tr class="cap">
                        <td colspan="2">ثبت اطلاعیه
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">موضوع :</td>
                        <td style="text-align: right">
                            <asp:TextBox ID="EditLead" runat="server" Width="95%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EditLead"
                                ErrorMessage="موضوع را مشخص کنید">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" width="15%">متن اطلاعیه :</td>
                        <td style="text-align: right">
                            <asp:TextBox ID="EditNewsValue" runat="server" Width="95%" Height="150px" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EditNewsValue"
                                ErrorMessage="متن اطلاعیه را مشخص کنید">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <uc1:DatePicker runat="server" ID="EditStartDate" Caption="از :" />
                                    </td>
                                    <td>
                                        <uc1:DatePicker runat="server" ID="EditEndDate" Caption="تا :" />
                                    </td>
                                    <td>
                                        <asp:CheckBox runat="server" ID="EditIsActive" Text="فعال" /></td>
                                </tr>
                            </table>
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

                <PT:GridViewEx ID="GrdNews" runat="server" Style="width: 85%" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" BorderColor="LightGray" OnDataSourceRequested="GrdNews_DataSourceRequested"
                    DataKeyNames="NewsId,Lead,News,StartDate,EndDate,IsActive"
                    CssClass="RedDatagrid" BorderStyle="Solid" BorderWidth="1px" EnableModelValidation="True"
                    OnSelectedIndexChanged="GrdNews_SelectedIndexChanged">
                    <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <Columns>
                        <asp:BoundField DataField="NewsId" HeaderText="کد خبر" SortExpression="NewsId" ItemStyle-Width="50px" />
                        <asp:BoundField DataField="Lead" HeaderText="موضوع" SortExpression="Lead" ItemStyle-Width="100px" />
                        <asp:BoundField DataField="News" HeaderText="متن خبر" SortExpression="News" />
                        <asp:BoundField DataField="StartDateFa" HeaderText="تاریخ شروع" SortExpression="StartDateFa" ItemStyle-Width="80px" />
                        <asp:BoundField DataField="EndDateFa" HeaderText="تاریخ پایان" SortExpression="EndDateFa" ItemStyle-Width="70px" />
                        <asp:BoundField DataField="Active" HeaderText="فعال" SortExpression="Active" ItemStyle-Width="50px" />
                        <asp:CommandField EditText="ویرایش" SelectText="ویرایش" ShowSelectButton="True" ButtonType="Button" ItemStyle-Width="20px" />
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
