<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.Settings" Title="شرکت دنیای پردازش :: تنظیمات" %>

<%@ Register Src="../UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>شرکت دنیای پردازش :: تنظیمات</title>
    <style type="text/css">
        .style1 {
            text-align: right;
        }

        .style2 {
            text-align: left;
        }

        .ulError {
            color: red;
            height: 200px;
            overflow: auto;
        }

            .ulError li {
                color: red;
                text-align: right;
            }
    </style>
    <script language="javascript" type="text/javascript">

        document.onkeydown = KeyDownHandler;
        document.onkeyup = KeyUpHandler;

        var CTRL = false;
        var SHIFT = false;
        var ALT = false;
        var IsTypeS = false;
        var IsTypeP = false;
        var IsTypeA = false;


        function KeyDownHandler(e) {
            var x = '';
            if (document.all) {
                var evnt = window.event;
                x = evnt.keyCode;
            }
            else {
                x = e.keyCode;
            }
            DetectKeys(x, true);
        }

        function KeyUpHandler(e) {
            var x = '';
            if (document.all) {
                var evnt = window.event;
                x = evnt.keyCode;
            }
            else {
                x = e.keyCode;
            }
            DetectKeys(x, false);
        }

        function DetectKeys(KeyCode, IsKeyDown) {
            if (KeyCode == '16') {
                SHIFT = IsKeyDown;
            }
            else if (KeyCode == '17') {
                CTRL = IsKeyDown;
                if (!IsKeyDown) {
                    IsTypeA = false;
                    IsTypeP = false;
                    IsTypeS = false;
                }

            }
            else if (KeyCode == '18') {
                ALT = IsKeyDown;
                if (!IsKeyDown) {
                    IsTypeA = false;
                    IsTypeP = false;
                    IsTypeS = false;
                }
            }
            else if (KeyCode == '83') {
                if (ALT && CTRL) {
                    if (IsKeyDown)
                        IsTypeS = IsKeyDown;
                } else IsTypeS = IsKeyDown;
            }
            else if (KeyCode == '80') {
                if (ALT && CTRL && IsTypeS) {
                    if (IsKeyDown)
                        IsTypeP = IsKeyDown;
                } else IsTypeP = IsKeyDown;
            }
            else if (KeyCode == '65') {
                if (ALT && CTRL && IsTypeS && IsTypeP) {
                    if (IsKeyDown)
                        IsTypeA = IsKeyDown;
                } else IsTypeA = IsKeyDown;
            }

            if (CTRL && ALT && IsTypeS && IsTypeP && IsTypeA) {
                var td = document.getElementById('tdParallelApprove');
                td.style.display = 'inline';
                buffer = '';
                return false;
            }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="98%">
        <tr>
            <td width="160" style="text-align: left">نام شرکت:
            </td>
            <td class="style1" valign="top">
                <asp:TextBox ID="EditCompany" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="style2" dir="ltr">
                <asp:TextBox ID="EditDomain" runat="server"></asp:TextBox>
            </td>
            <td align="right" dir="ltr">Domain :
            </td>
        </tr>
        <tr>
            <td style="text-align: left" width="160">مشخصات شرکت:
            </td>
            <td class="style1">
                <asp:TextBox ID="EditCompnayInfo" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="style2" dir="ltr">
                <asp:TextBox ID="EditDomainFieldEmpNO" runat="server"></asp:TextBox>
            </td>
            <td align="right" dir="ltr">Domain Field EmpNO :
            </td>
        </tr>
        <tr>
            <td style="text-align: left" width="160">تلرانس زمان مجوزهای ساعتی:
            </td>
            <td style="text-align: right">
                <asp:TextBox ID="EditTolerance" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditTolerance_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditTolerance">
                </ACT:MaskedEditExtender>
            </td>
            <td style="text-align: left" dir="ltr">
                <asp:TextBox ID="EditDomainFieldAdmin" runat="server"></asp:TextBox>
            </td>
            <td align="right" dir="ltr">Domain Field Admin :
            </td>
        </tr>
        <tr>
            <td style="text-align: left" width="160">محدودیت ماه (نمایش ترددها):</td>
            <td style="text-align: right">
                <asp:TextBox ID="EditLimitMonthShowDaily" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="30px">60</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditLimitMonthShowDaily_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="EditLimitMonthShowDaily">
                </ACT:MaskedEditExtender>
            </td>
            <td style="text-align: left" dir="ltr" rowspan="2">
                <asp:Image ID="imgLogo" runat="server" Height="50px" Width="100px" />
            </td>
            <td style="text-align: right" dir="ltr">
                <asp:FileUpload ID="FileUploadControl" runat="server" Width="90%" />
            </td>
        </tr>
        <tr>
            <td style="text-align: left" width="160">مدت انتظار بعد از تایید مدیر:</td>
            <td style="text-align: right">
                <asp:TextBox ID="EditRegisterTolerance" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditRegisterTolerance_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditRegisterTolerance">
                </ACT:MaskedEditExtender>
            </td>
            <td style="text-align: center" dir="ltr">
                <asp:Button ID="btnUploadLogo" runat="server" Text="ثبت لوگو" OnClick="btnUploadLogo_Click" PostBackUrl="~/Admin/Settings.aspx" />
                <asp:Label ID="lblErrLogo" runat="server" Font-Bold="True" ForeColor="Red"
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap" colspan="2" style="text-align: right">
                <asp:RadioButton ID="rbExpireDay" Text="درخواستهای صادر شده از " runat="server" Checked="True"
                    GroupName="DayArchive" AutoPostBack="True" OnCheckedChanged="rbExpireDay_CheckedChanged" />
                &nbsp;<asp:TextBox ID="EditExpireDay" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="30px">60</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditExpireDay_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="EditExpireDay">
                </ACT:MaskedEditExtender>
                &nbsp; روز قبل به بعد ، در کارتابل مدیر قابل نمایش باشد&nbsp;
            </td>
            <td colspan="2" id="tdParallelApprove" style="display: none; text-align: right;">
                <asp:CheckBox ID="chbParallelApprove" runat="server" Text="قابلیت تایید موازی برگه ها توسط کارشناس " />
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap" colspan="2" style="text-align: right">
                <asp:RadioButton ID="rbMonthDay" Text="فقط درخواستهای ماه جاری در کارتابل مدیر قابل نمایش باشد.روز شروع ماه" runat="server"
                    GroupName="DayArchive" OnCheckedChanged="rbMonthDay_CheckedChanged" AutoPostBack="True" />
                <asp:TextBox ID="EditMonthDay" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="30px">000</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditMonthDay_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="EditMonthDay">
                </ACT:MaskedEditExtender>
                &nbsp;<asp:Label ID="lblStartDay" runat="server"></asp:Label>
            </td>
            <td nowrap="nowrap" colspan="2" style="text-align: right">
                <asp:CheckBox ID="Chb_IsInsertDataFile" runat="server" Text="ثبت تردد برای ماموریتهای ساعتی بدون بازگشت امکان پذیر باشد"
                    Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2" dir="rtl" style="text-align: right">
                <asp:CheckBox ID="Chb_WFIsAttachment" runat="server" Text="ثبت پیوست برای درخواست مرخصی و ماموریت روزانه باشد"
                    Visible="true" />
            </td>
            <td colspan="2" style="text-align: right">
                <asp:CheckBox ID="Chb_WFIsChangeUserName" runat="server" Text="امکان تغییر نام کاربری وجود نداشته باشد" />
            </td>
        </tr>
        <tr>
            <td colspan="2" dir="rtl" style="text-align: right">
                <br />
                <asp:Label ID="lblNegaMor" runat="server" ForeColor="blue" Font-Size="14px"></asp:Label>
                <asp:CheckBox ID="Chb_WFRequestMandeControl" runat="server" AutoPostBack="True" Text="در صورت کمبود ذخیره مرخصی استحقاقی ، درخواست صادر نشود" OnCheckedChanged="Chb_WFRequestMandeControl_OnCheckedChanged" Visible="False" />
                &nbsp;<br />
                <div ID="divMaxNegativeDuration" runat="server">
                    سقف مرخصی استحقاقی منفی بعد از درخواست :
                    <asp:TextBox ID="Edit_MaxNegativeDuration" runat="server" Style="margin-right: 2px"
                                 ValidationGroup="t1" Width="30px">2</asp:TextBox>
                    <ACT:MaskedEditExtender ID="Edit_MaxNegativeDuration_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                            CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="Edit_MaxNegativeDuration">
                    </ACT:MaskedEditExtender>        
                    &nbsp;روز
                
                </div>
            </td>

            <td colspan="2" style="text-align: right">
                <asp:CheckBox ID="Chb_WFDifrenceRequest" runat="server" Text="نمایش ترددهای بیش از حد مجاز به مدیران(بر اساس ترددهای جاری و بدون احتساب آیین نامه)" />
            </td>
        </tr>
        <tr>
            <td colspan="2" dir="rtl" style="text-align: right">&nbsp;</td>
            <td colspan="2" style="text-align: right">
                <asp:CheckBox ID="Chb_ShowRemainKardex" runat="server" Text="نمایش مانده مرخصی  فعال شود" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"
                    Visible="False"></asp:Label>
            </td>
            <td align="center">
                <asp:Button ID="BtnSave" runat="server" Text="ثبت اطلاعات" OnClick="BtnSave_Click"  BackColor="green" Font-Size="14px" ForeColor="white" style="padding: 5px"/>
            </td>
        </tr>
        <tr>
            <td colspan="4" bgcolor="#E6E6E6" align="center">سقف درخواست مجوزها(عملکردها)
                <table width="100%" style="border: 1px solid #000000" border="1" cellpadding="1">
                    <tr>
                        <td width="50%">مجوزهای روزانه
                        </td>
                        <td width="50%">مجوزهای ساعتی
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <PT:GridViewEx ID="GrdDailyRequest" runat="server" AutoGenerateColumns="False" Height="100%"
                                Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                CellPadding="4" DataKeyNames="CARD_NO" ForeColor="Black" GridLines="Vertical"
                                OnDataSourceRequested="GrdDailyRequest_DataSourceRequested" OnRowCancelingEdit="GrdDailyRequest_RowCancelingEdit"
                                OnRowEditing="GrdDailyRequest_RowEditing" OnRowUpdating="GrdDailyRequest_RowUpdating"
                                EnableModelValidation="True">
                                <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                                    NextPageText="بعدی" PreviousPageText="قبلی" PageButtonCount="20" />
                                <FooterStyle CssClass="RedDatagridFooter" />
                                <RowStyle CssClass="RedDatagridItem" />
                                <Columns>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" CancelText="انصراف" DeleteText="حذف"
                                        EditText="ویرایش" InsertText="جدید" NewText="جدید" UpdateText="ثبت">
                                        <ItemStyle HorizontalAlign="Center" Width="30px" Wrap="false" />
                                    </asp:CommandField>
                                    <asp:TemplateField HeaderText="شماره" SortExpression="CARD_NO">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblCARD_NO" runat="server" Text='<%# Bind("CARD_NO") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCARD_NO0" runat="server" Text='<%# Bind("CARD_NO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="مجوز" SortExpression="TITLE">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblTITLE" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTITLE0" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="سقف" SortExpression="LimitValue">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLimitDay" runat="server" Text='<%# Bind("LimitValue") %>'></asp:Label>
                                            روز
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="EditLimitDay" runat="server" Height="22px" Style="margin-right: 2px"
                                                Width="20px" Text='<%# Bind("LimitValue") %>'></asp:TextBox>
                                            روز
                                            <ACT:MaskedEditExtender ID="EditLimitDay_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                                CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="EditLimitDay">
                                            </ACT:MaskedEditExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="70px" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                                <SelectedRowStyle CssClass="RedDatagridSelected" />
                                <HeaderStyle CssClass="RedDatagridHeader" />
                                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                            </PT:GridViewEx>
                        </td>
                        <td valign="top">
                            <PT:GridViewEx ID="GrdTimeRequest" runat="server" AutoGenerateColumns="False" Height="100%"
                                Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                CellPadding="4" DataKeyNames="CARD_NO" ForeColor="Black" GridLines="Vertical"
                                OnDataSourceRequested="GrdTimeRequest_DataSourceRequested" OnRowCancelingEdit="GrdTimeRequest_RowCancelingEdit"
                                OnRowEditing="GrdTimeRequest_RowEditing" OnRowUpdating="GrdTimeRequest_RowUpdating"
                                EnableModelValidation="True" OnRowDataBound="GrdTimeRequest_RowDataBound">
                                <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                                    NextPageText="بعدی" PreviousPageText="قبلی" PageButtonCount="20" />
                                <FooterStyle CssClass="RedDatagridFooter" />
                                <RowStyle CssClass="RedDatagridItem" />
                                <Columns>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="True" CancelText="انصراف" DeleteText="حذف"
                                        EditText="ویرایش" InsertText="جدید" NewText="جدید" UpdateText="ثبت">
                                        <ItemStyle HorizontalAlign="Center" Width="30px" Wrap="false" />
                                    </asp:CommandField>
                                    <asp:TemplateField HeaderText="شماره" SortExpression="CARD_NO">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblCARD_NO1" runat="server" Text='<%# Bind("CARD_NO") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCARD_NO2" runat="server" Text='<%# Bind("CARD_NO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="مجوز" SortExpression="TITLE">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblTITLE1" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTITLE2" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="سقف" SortExpression="LimitValue">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLimitTime" runat="server" Text='<%# Bind("LimitValue") %>'></asp:Label>
                                            ساعت
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div dir="ltr">
                                                <asp:TextBox ID="EditLimitTime" runat="server" Height="22px" Width="35px" Text='<%# Bind("LimitValue") %>'></asp:TextBox>
                                                ساعت
                                                <ACT:MaskedEditExtender ID="EditLimitTime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                                    CultureTimePlaceholder="" Enabled="True" Mask="9999" TargetControlID="EditLimitTime"
                                                    PromptCharacter="_">
                                                </ACT:MaskedEditExtender>
                                            </div>
                                        </EditItemTemplate>
                                        <ItemStyle Width="90px" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                                <SelectedRowStyle CssClass="RedDatagridSelected" />
                                <HeaderStyle CssClass="RedDatagridHeader" />
                                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                            </PT:GridViewEx>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label runat="server" ForeColor="Red" ID="lblSaveRequest"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="border: 1px solid black">
                <h1>بررسی مجدد و ثبت درخواست های بلاتکلیف
                </h1>
                <table width="100%">
                    <tr>
                        <td style="text-align: center">
                            <uc1:DatePicker ID="EditFromDate" runat="server" Caption=" تاریخ شروع بررسی : " />
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btnSaveRequest" Text="بررسی مجدد و ثبت درخواست های بلاتکلیف" OnClick="btnSaveRequest_Click" OnClientClick="confirm('آیا با انجام عملیات مواففید؟\nممکن است عملیات زمانبر باشد')" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Numbered" ForeColor="Red" CssClass="ulError">
                            </asp:BulletedList>
                        </td>
                        <td>
                            <asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="Numbered" ForeColor="Red" CssClass="ulError">
                            </asp:BulletedList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
