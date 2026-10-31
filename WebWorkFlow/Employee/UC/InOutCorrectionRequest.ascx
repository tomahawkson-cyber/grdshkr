<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.InOutCorrectionRequest"
    CodeBehind="InOutCorrectionRequest.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>

<body class="bd">
    <!-- Full Screen Div For Show Hours -->
    <table id="TBL_ShowHours" runat="server" visible="false" border="1" cellpadding="2"
        cellspacing="0" style="border-width: 0px; font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color: #C0C0C0; position: absolute; left: 30%; top: 40%; width: 150px; cursor: default; z-index: 100; font-weight: bold;">
        <tr class="cap">
            <td align="right">
                <asp:ImageButton ID="BtnOkHours" runat="server" Height="17px" ImageUrl="~/images/BtnCancel.png"
                    OnClick="BtnOkHours_Click" ToolTip="خروج" CausesValidation="False" />
                نمایش تردد پرسنل
            </td>
        </tr>
        <tr>
            <td dir="rtl" align="center" valign="top" style="border-style: solid; border-bottom-width: 0px; border-color: #000000;">
                <asp:PlaceHolder ID="PHShowHours" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
    </table>
    <!-- Full Screen Div For Show Hours -->
    <!-- Full Screen Div For Accept -->
    <table id="TBL_MSG" runat="server" visible="false" border="1" cellpadding="2" cellspacing="0"
        style="border: thin groove #800000; font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color: #C0C0C0; position: absolute; left: 30%; top: 40%; width: 300px; cursor: default; z-index: 100; height: 70px"
        dir="rtl">
        <tr>
            <td dir="rtl" align="right" valign="middle" style="border-right-width: 0px; border-bottom-width: 0px;"
                rowspan="2" width="10%">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/msg_icon_1.png" />
                &nbsp;
            </td>
            <td dir="rtl" align="center" valign="middle" style="border-left-width: 0px;">
                <asp:Label ID="lblConfirm" runat="server" Width="100%"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td dir="rtl" align="center" valign="middle" style="border-left-width: 0px;">
                <asp:Button ID="btn_okMSG" runat="server" Style="border: 1px solid black; font-size: 9pt; color: black; font-family: tahoma; background-color: #ffffff; height: 20px;"
                    Text="&nbsp;&#1576;&#1604;&#1740;&nbsp;" UseSubmitBehavior="False" OnClick="btn_okMSG_Click" />
            </td>
        </tr>
    </table>
    <!-- Full Screen Div For Accept -->
    <table class="mainTable">       
        <tr>
            <td colspan="4">
                <div class="cap">
                    اصلاح ورود و خروج
                </div>
                <asp:Label ID="lblParallelApprove" CssClass="alert-box"  runat="server" Text="..." Visible="false" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right" nowrap="nowrap" width="10%">تاریخ درخواست :
            </td>
            <td class="TdEditorSty" colspan="2" width="50%">
                <uc1:DatePicker ID="EditRequestDate" runat="server" />
            </td>
            <td class="TdEditorSty" style="text-align: left">
                <span dir="ltr" style="text-align: left">
                    <asp:Label ID="lbl_SubmittedDate" runat="server" Font-Bold="True" ForeColor="#DFDFDF"
                        Text="1390/01/01 12:20" ToolTip="تاریخ و ساعت ثبت درخواست"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right">ساعت قدیم :
            </td>
            <td class="TdEditorSty">
                <asp:TextBox ID="EditOldTime" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px" ReadOnly="True">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditOldTime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditOldTime"
                    MaskType="Time">
                </ACT:MaskedEditExtender>
                <ACT:MaskedEditValidator ID="MaskedEditValidator6" runat="server" ControlExtender="EditOldTime_MaskedEditExtender"
                    ControlToValidate="EditOldTime" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                    InvalidValueMessage="مقدار ناردست" IsValidEmpty="False" ToolTip="زمان را وارد نمایید"
                    ValidationGroup="t1"></ACT:MaskedEditValidator>
                <asp:Button ID="BtnSowHours" runat="server" Text="..." Width="25px" OnClick="BtnSowHours_Click"
                    Style="height: 26px" CausesValidation="False" />
            </td>
            <td align="right" style="text-align: left">ساعت جدید :
            </td>
            <td style="text-align: right">
                <asp:TextBox ID="EditNewTime" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditNewTime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditNewTime"
                    MaskType="Time">
                </ACT:MaskedEditExtender>
                <ACT:MaskedEditValidator ID="MaskedEditValidator7" runat="server" ControlExtender="EditNewTime_MaskedEditExtender"
                    ControlToValidate="EditNewTime" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                    InvalidValueMessage="مقدار ناردست" IsValidEmpty="False" ToolTip="زمان را وارد نمایید"
                    ValidationGroup="t1"></ACT:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right">عنوان:
            </td>
            <td colspan="3">
                <asp:DropDownList ID="EditCards" runat="server" CssClass="Ddl" Width="85%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" nowrap="nowrap" align="right">توضیحات :
            </td>
            <td class="TdEditorSty" nowrap="nowrap" colspan="3">
                <asp:TextBox ID="Edit_Description" runat="server" Width="85%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right">
                <asp:Label ID="lblEmpNo" runat="server" Text="شماره پرسنلی :"></asp:Label>
            </td>
            <td colspan="3">
                <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="85%" Visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="4" class="TdLblSty">
                <asp:Button ID="BtnDelete" runat="server" Text="حذف" CssClass="btn" OnClick="BtnDelete_Click"
                    CausesValidation="False" OnClientClick="return confirm_delete();" />
                &nbsp;<asp:Button ID="BtnOk" runat="server" Text="ثبت درخواست" CssClass="btn" OnClick="BtnOk_Click"
                    CausesValidation="False" />
                &nbsp;<asp:Button ID="BtnCancel" runat="server" Text="انصراف" CssClass="btn" OnClick="btnCancel_Click"
                    CausesValidation="False" />
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</body>
