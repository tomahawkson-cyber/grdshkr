<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="Conferment.aspx.cs" Inherits="PW.WorkFlows.Web.Employee.Conferment" Title="شرکت دنیای پردازش ::تفویض اختیار" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>شرکت دنیای پردازش ::تفویض اختیار</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table bgcolor="LightSteelBlue" style="height: 100%; width: 100%">
        <tr>
            <td align="center" style="width: 100%">
                <table style="background-color: whitesmoke; border: thin solid #000000; text-align: center; vertical-align: top; margin-left: auto; margin-right: auto"
                    cellpadding="5" cellspacing="5">
                    <caption class="cap">
                        تفویض اختیار</caption>
                    <tr id="trManager" runat="server">
                        <td class="TdLblSty">مدیر تفویض کننده :
                        </td>
                        <td class="TdEditorSty" colspan="3" dir="rtl" align="left">
                            <asp:DropDownList ID="Edit_Managers" runat="server" Width="250px" AutoPostBack="True"
                                OnSelectedIndexChanged="Edit_Managers_SelectedIndexChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdLblSty">مدیر تفویض شده :
                        </td>
                        <td class="TdEditorSty" colspan="3" dir="rtl">
                            <div>
                                <asp:DropDownList ID="Edit_Emp_No" runat="server" Width="250px" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdLblSty">عملکرد :
                        </td>
                        <td class="TdEditorSty" colspan="3" dir="rtl" align="left">
                            <asp:DropDownList ID="EditActions" runat="server" CssClass="Ddl" Width="250px" AutoPostBack="True"
                                OnSelectedIndexChanged="EditActions_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdLblSty">تاریخ شروع :
                        </td>
                        <td class="TdEditorSty" width="150px">
                            <uc1:DatePicker ID="Edit_FDate" runat="server" />
                        </td>
                        <td class="TdLblSty" width="100px">تاریخ پایان :
                        </td>
                        <td class="TdEditorSty">
                            <uc1:DatePicker ID="Edit_TDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdLblSty">
                            <asp:Label ID="lblPermit" runat="server" Text=""></asp:Label>
                        </td>
                        <td class="TdEditorSty" dir="ltr">
                            <asp:CheckBox ID="Edit_PermitValueBool" runat="server" Visible="false" />
                            <asp:TextBox ID="Edit_PermitValue" runat="server" Width="35px"></asp:TextBox>
                            <ACT:MaskedEditExtender ID="Edit_PermitValue_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                Enabled="True" MaskType="Number" TargetControlID="Edit_PermitValue" InputDirection="LeftToRight"
                                PromptCharacter="_" Mask="9" EnableViewState="False" AutoCompleteValue="0">
                            </ACT:MaskedEditExtender>
                        </td>
                        <td class="TdLblSty">بخش :
                        </td>
                        <td class="TdEditorSty">
                            <asp:DropDownList ID="EditSections" runat="server" CssClass="Ddl" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red" Style="text-align: center"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdLblSty" colspan="2" align="center" dir="rtl">&nbsp;<asp:Button ID="BtnOk" runat="server" Text="ثبت" CssClass="btn" OnClick="BtnOk_Click"
                            CausesValidation="False" />
                            &nbsp;&nbsp;
                            <asp:Button ID="BtnAddRequest" runat="server" Text="جدید" CssClass="btn" OnClick="BtnAdd_Click"
                                CausesValidation="False" />
                        </td>
                        <td class="TdLblSty" colspan="2" align="center"></td>
                    </tr>
                </table>
                <table width="100%">
                    <tr>
                        <td align="center" valign="top">
                            <table width="100%" id="tblsearch" runat="server" style="border-style: solid; border-width: 1px; border-color: inherit;">
                                <tr>
                                    <td style="text-align: center">شماره پرسنلی<br />
                                        <asp:TextBox ID="EditEmNo" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">نام خانوادگی<br />
                                        <asp:TextBox ID="EditEmFamily" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">نام<br />
                                        <asp:TextBox ID="EditEmName" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">بخش<br />
                                        <asp:TextBox ID="EditSection" runat="server" Width="80px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:ImageButton ID="BtnSearchEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                            OnClick="BtnSearchEmp_Click" Width="20px" />
                                    </td>
                                </tr>
                            </table>
                            <PT:GridViewEx ID="GrdConferment" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BorderColor="LightGray" Caption="لیست پرسنل دارای اختیار "
                                OnDataSourceRequested="GrdConferment_DataSourceRequested"
                                Style="width: 100%" CssClass="RedDatagrid" OnRowDataBound="GrdConferment_RowDataBound"
                                OnRowCommand="GrdConferment_RowCommand" DataKeyNames="ActionID,SEC_NO,EMP_NO,PermitValue,StartDate,EndDate" EnableModelValidation="True"
                                OnSelectedIndexChanged="GrdConferment_SelectedIndexChanged">
                                <PagerSettings FirstPageText="اول" LastPageText="آخر" NextPageText="بعدی" PreviousPageText="قبلی"
                                    Mode="NumericFirstLast" PageButtonCount="15" />
                                <FooterStyle CssClass="RedDatagridFooter" />
                                <RowStyle CssClass="RedDatagridItem" />
                                <Columns>
                                    <asp:BoundField DataField="EMP_NO" HeaderText="شماره پرسنلی" SortExpression="EMP_NO">
                                        <ItemStyle Width="120px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NAME" HeaderText="نام" SortExpression="NAME" />
                                    <asp:BoundField DataField="FAMILY" HeaderText="نام خانوادگی" SortExpression="FAMILY" />
                                    <asp:BoundField DataField="SEC_NO" HeaderText="کد بخش" SortExpression="SEC_NO" Visible="False" />
                                    <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE" />
                                    <asp:BoundField DataField="Fdesc" HeaderText="عملکرد" SortExpression="Fdesc" />
                                    <asp:BoundField DataField="StartDate" HeaderText="شروع" SortExpression="StartDate">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="EndDate" HeaderText="پایان" SortExpression="EndDate">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PermitValue" HeaderText="مقدار" SortExpression="PermitValue">
                                        <ItemStyle Width="60px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="BtnIsDelete" CommandName="IsDelete" runat="server" Width="100px"
                                                CommandArgument='<%# Eval("EMP_NO")+";"+Eval("SEC_NO")+";"+Eval("ActionID")+";"+Eval("EmpManager")+";"+Eval("IsDelete") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="ActionID" SortExpression="ActionID" Visible="False" />
                                    <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True">
                                        <ItemStyle Width="60px" />
                                    </asp:CommandField>
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
