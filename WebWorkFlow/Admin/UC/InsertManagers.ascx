<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Admin.UC.InsertManagers"
    CodeBehind="InsertManagers.ascx.cs" %>
<%@ Register Assembly="PWTools" Namespace="PW.Tools.Component" TagPrefix="cc" %>
<%@ Register Src="~/UC/SearchEmp.ascx" TagName="UC_SearchEmp" TagPrefix="uc1" %>
<body class="bd" dir="rtl">
    <div id="PnlprogrammaticPopup" runat="server">
        <div id="progressBackgroundFilter">
        </div>
        <div id="Modalreq">
            <asp:Panel ID="Panel6" runat="server" Style="z-index: 20;">
                <asp:Panel ID="Panel7" runat="server" BorderStyle="Solid" BorderWidth="2px" BorderColor="black">
                    <table style="width: 100%; background-color: White">
                        <tr>
                            <td style="width: 30px">
                                <asp:ImageButton runat="server" ID="BtnExit" ImageUrl="~/images/BtnCancel.png" ToolTip="خروج"
                                    OnClick="BtnExit_Click" />
                            </td>
                            <td align="center">سیستم گردش کار
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="panSearchEmployee" runat="server" BackColor="#0B3D73"
                    ForeColor="whitesmoke" BorderWidth="2px" BorderColor="black" BorderStyle="Solid">
                    <uc1:UC_SearchEmp ID="UC_SearchEmp1" runat="server" />
                </asp:Panel>
            </asp:Panel>
        </div>
    </div>
    <!-- Full Screen Div For Accept -->
    <table id="TBL_MSG" runat="server" visible="false" border="1" cellpadding="2" cellspacing="0"
        style="border: thin groove #800000; font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color: #C0C0C0; position: absolute; left: 30%; top: 40%; width: 300px; cursor: default; z-index: 100; height: 70px"
        dir="rtl">
        <tr>
            <td dir="rtl" align="right" valign="middle" style="border-right-width: 0px; border-bottom-width: 0px;"
                rowspan="2" width="10%">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Info-icon.png" />
                &nbsp;
            </td>
            <td dir="rtl" align="center" valign="middle" style="border-left-width: 0px;">
                <asp:Label ID="lblConfirm" runat="server" Width="100%"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td dir="rtl" align="center" valign="middle" style="border-left-width: 0px;">
                <asp:Button ID="btn_okMSG" runat="server" Style="border: 1px solid black; font-size: 9pt; color: black; font-family: tahoma; background-color: #ffffff;"
                    Text="تایید"
                    UseSubmitBehavior="False" OnClick="btn_okMSG_Click" />
            </td>
        </tr>
    </table>
    <!-- Full Screen Div For Accept -->
    <table style="background-color: LightSteelBlue; width: 100%">

        <tr runat="server" id="Tr_Insert">
            <td>
                <table style="background-color: whitesmoke; border: thin solid #000000; text-align: center; vertical-align: top; margin-left: auto; margin-right: auto"
                    cellpadding="5" cellspacing="5">
                    <caption>
                        معرفی مدیران</caption>
                    <tr>
                        <td align="right" colspan="3">بخش :&nbsp;&nbsp;<asp:Label ID="lblSec" runat="server" Text="..."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="3">مدیر :&nbsp;&nbsp;
                                <asp:DropDownList ID="Edit_EmpManager" runat="server" CssClass="Ddl" Width="286" AutoPostBack="True" OnSelectedIndexChanged="Edit_EmpManager_SelectedIndexChanged">
                                </asp:DropDownList>
                            <asp:Button runat="server" ID="showModalPopup" Text="..." ToolTip="جستجو و انتخاب پرسنل"
                                OnClick="showModalPopupServerOperatorButton_Click" BorderStyle="Solid" BorderWidth="1px"
                                BackColor="White" Height="20" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="text-align: right; background-color: Silver" colspan="3">
                            <asp:RadioButton ID="rbtnTransferNewManager" runat="server" Text="کارتابل به مدیر جدید تحویل داده شود"
                                Checked="true" GroupName="Taransfer" AutoPostBack="True" OnCheckedChanged="rbtnTransferNewManager_CheckedChanged" />
                            &nbsp;
                                <br />
                            <asp:RadioButton ID="rbtnTransferOtherManager" runat="server" Text="کارتابل به مدیر دیگری تحویل داده شود"
                                GroupName="Taransfer" AutoPostBack="True" OnCheckedChanged="rbtnTransferOtherManager_CheckedChanged" />
                            <br />
                            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;مدیر دیگر :
                                <asp:DropDownList ID="Edit_OtherManager" runat="server" CssClass="Ddl" Width="286" Enabled="false" />
                            &nbsp;<asp:Button runat="server" ID="btnShowManager" Text="..." ToolTip="جستجو و انتخاب پرسنل"
                                OnClick="btnShowManager_Click" BorderStyle="Solid" BorderWidth="1px" BackColor="White"
                                Height="20" Enabled="false" />
                            <br />
                            <asp:CheckBox ID="chbRevokeConferment" runat="server" Text="تفویض اختیارهای مدیر قبلی باطل شود" />
                            <br />
                            <asp:CheckBox ID="chbRevokeSubstitute" runat="server" Text="جانشین مدیر قبلی باطل شود" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="text-align: right" colspan="2">
                            <asp:CheckBox ID="chbSetManager" runat="server" Text="امکان تعریف جانشین دارد" />
                            &nbsp;&nbsp;&nbsp;
                                <asp:CheckBox ID="chbSetConferment" runat="server" Text="امکان تفویض اختیار دارد" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" style="text-align: left">سقف اضافه کار ماهیانه بخش :
                            </td>
                        <td align="left" style="text-align: right" dir="ltr">
                            <asp:TextBox ID="Edit_LimitOvertime" runat="server" Style="width: 45px"
                                ValidationGroup="t1">999:00</asp:TextBox>
                            <ACT:MaskedEditExtender ID="Edit_Overtime0_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                CultureTimePlaceholder="" Enabled="True" Mask="999:99" TargetControlID="Edit_LimitOvertime">
                            </ACT:MaskedEditExtender>
                        </td>
                        <td>
                            <asp:Button ID="BtnOk" runat="server" Text="ثبت" OnClick="BtnOk_Click" CausesValidation="False" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table style="border-style: solid; border-width: 1px; border-color: inherit; width: 100%">
                    <tr>
                        <td style="text-align: center">نام بخش
                            <asp:TextBox ID="EditSectionName" runat="server"></asp:TextBox>
                        </td>
                        <td style="text-align: center; display: none">شماره پرسنلی مدیر<br />
                            <asp:TextBox ID="EditManagerNo" runat="server"></asp:TextBox>
                        </td>
                        <td style="text-align: center; display: none">نام مدیر<br />
                            <asp:TextBox ID="EditManagerFamily" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="BtnSearchManager" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                OnClick="BtnSearchManager_Click" Width="20px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <PT:GridViewEx ID="GrdManager" runat="server" Style="width: 100%" AutoGenerateColumns="False"
                    OnDataSourceRequested="GrdManager_DataSourceRequested" AllowPaging="True" AllowSorting="True"
                    PageSize="20" DataKeyNames="SEC_NO,EmpManager,SetManager,SetConferment,TITLE,ManagerName,WF_LimitOverTime"
                    OnSelectedIndexChanged="GrdManager_SelectedIndexChanged" Caption="لیست بخشها"
                    CssClass="RedDatagrid" EnableModelValidation="True" OnDataBound="GrdManager_DataBound"
                    OnRowDataBound="GrdManager_RowDataBound">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                        NextPageText="بعدی" PageButtonCount="20" PreviousPageText="قبلی" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <Columns>
                        <asp:CommandField SelectText="انتخاب" ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="SEC_NO" HeaderText="کد بخش" SortExpression="SEC_NO" />
                        <asp:BoundField DataField="TITLE" HeaderText="بخش" SortExpression="TITLE" />
                        <asp:BoundField DataField="EmpManager" HeaderText="شماره مدیر" SortExpression="EmpManager" />
                        <asp:BoundField DataField="ManagerName" HeaderText="نام مدیر" SortExpression="ManagerName" />
                        <asp:CheckBoxField DataField="SetManager" HeaderText="تعریف جانشین" SortExpression="SetManager">
                            <ItemStyle Width="100px" />
                        </asp:CheckBoxField>
                        <asp:CheckBoxField DataField="SetConferment" HeaderText="تفویض اختیار" SortExpression="SetConferment">
                            <ItemStyle Width="100px" />
                        </asp:CheckBoxField>
                        <asp:BoundField DataField="WF_LimitOverTime" HeaderText="سقف اضافه کاری" SortExpression="WF_LimitOverTime">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <SelectedRowStyle CssClass="RedDatagridSelected" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                </PT:GridViewEx>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="Btn_SetManagerKartabl" runat="server" Text="بازسازی کارتابل مدیران"
                    OnClick="Btn_SetManagerKartabl_Click" OnClientClick="return confirm('آیا با بازسازی کارتابل مدیران موافقید؟')" />
            </td>
        </tr>
    </table>
</body>
