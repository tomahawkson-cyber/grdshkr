<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.TimeLeave"
    CodeBehind="TimeLeave.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<body class="bd" style="direction: rtl">
    <!-- Full Screen Div For Show Hours -->
    <table id="TBL_ShowHours" runat="server" visible="false" border="1" cellpadding="2"
        cellspacing="0" style="border-width: 0px; font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color: #C0C0C0; position: absolute; left: 30%; top: 40%; width: 150px; cursor: default; z-index: 1000; font-weight: bold;">
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
        style="border: thin groove #800000; font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color: #C0C0C0; position: absolute; left: 30%; top: 40%; width: 300px; cursor: default; z-index: 1000; height: 70px"
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
            <td colspan="6">
                <div class="cap">
                    درخواست مرخصی ساعتی
                </div>
                <asp:Label ID="lblParallelApprove" CssClass="alert-box" runat="server" Text="..." Visible="false" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right" nowrap="nowrap" width="20%">عنوان :</td>
            <td class="TdEditorSty" colspan="3">
                <asp:DropDownList ID="EditCards" runat="server" CssClass="Ddl" Width="90%" AutoPostBack="True"
                    OnSelectedIndexChanged="EditCards_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp; &nbsp;
            </td>
            <td class="TdEditorSty" colspan="2" style="text-align: left">
                <span dir="ltr" style="text-align: left">
                    <asp:Label ID="lbl_SubmittedDate" runat="server" Font-Bold="True" ForeColor="#DFDFDF"
                        Text="1390/01/01 12:20" ToolTip="تاریخ و ساعت ثبت درخواست"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" >&nbsp;تاریخ&nbsp; درخواست :</td>
            <td class="TdEditorSty" colspan="3" nowrap="nowrap">
                <uc1:DatePicker ID="EditRequestDate" runat="server" />
            </td>
            <td class="TdEditorSty" colspan="2" nowrap="nowrap">
                <asp:CheckBox ID="chbIsFirstTimeShift" runat="server" OnCheckedChanged="chbIsFirstTimeShift_CheckedChanged"
                    Text="مرخصی اول وقت می باشد" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right">ساعت شروع :</td>
            <td class="TdEditorSty">
                <asp:TextBox ID="EditStartTime" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px" onblur="SetEndTime('TimeLeave');">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditStartTime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditStartTime"
                    MaskType="Time">
                </ACT:MaskedEditExtender>
                <ACT:MaskedEditValidator ID="MaskedEditValidator6" runat="server" ControlExtender="EditStartTime_MaskedEditExtender"
                    ControlToValidate="EditStartTime" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                    InvalidValueMessage="مقدار ناردست" IsValidEmpty="False" ToolTip="زمان را صحیح وارد نمایید"
                    ValidationGroup="t1"></ACT:MaskedEditValidator>
                &nbsp;<asp:Button ID="BtnSowHours" runat="server" Text="..." Width="25px" OnClick="BtnSowHours_Click"
                    CausesValidation="False" />
            </td>
            <td class="TdLblSty">&nbsp; مدت درخواست&nbsp; :&nbsp;
            </td>
            <td class="TdEditorSty">
                <asp:TextBox ID="EditDuration" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px" onblur="SetEndTime('TimeLeave');"
                    onfocus="SetDurationTime('TimeLeave');">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditDuration_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditDuration"
                    MaskType="Time">
                </ACT:MaskedEditExtender>
                <ACT:MaskedEditValidator ID="EditDuration_MaskedEditValidator" runat="server" ControlExtender="EditDuration_MaskedEditExtender"
                    ControlToValidate="EditDuration" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                    InvalidValueMessage="مقدار ناردست" IsValidEmpty="False" ToolTip="مدت را صحیح وارد نمایید"
                    ValidationGroup="t1"></ACT:MaskedEditValidator>
            </td>
            <td class="TdLblSty">
                <asp:Label runat="server" ID="lblEndTime_Shift" Text="ساعت پایان  :"></asp:Label>
                &nbsp;
            </td>
            <td class="TdEditorSty" style="max-width: 200px">
                <asp:TextBox ID="EditEndTime" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px" onfocus="SetEndTime('TimeLeave');" onblur="SetDurationTime('TimeLeave');">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditEndTime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditEndTime"
                    MaskType="Time">
                </ACT:MaskedEditExtender>
                <ACT:MaskedEditValidator ID="EditEndTime_MaskedEditValidator" runat="server" ControlExtender="EditEndTime_MaskedEditExtender"
                    ControlToValidate="EditEndTime" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                    InvalidValueMessage="مقدار ناردست" IsValidEmpty="False" ToolTip="ساعت پایان را صحیح وارد نمایید"
                    ValidationGroup="t1"></ACT:MaskedEditValidator>
                <asp:Label ID="lblEndTime" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right">توضیحات :</td>
            <td class="TdEditorSty" colspan="5">
                <asp:TextBox ID="Edit_Description" runat="server" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right">
                <asp:Label ID="lblEmpNo0" runat="server" Text="شماره پرسنلی :"></asp:Label>
            </td>
            <td class="TdEditorSty" colspan="5">
                <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="70%" Visible="false"
                    OnSelectedIndexChanged="EditEmpNo_SelectedIndexChanged" AutoPostBack="True" />
                <asp:LinkButton runat="server" ID="showModalPopup" Text="انتخاب گروهی پرسنل" OnClick="showModalPopupServerOperatorButton_Click"
                    BorderStyle="Solid" BorderWidth="1px" />
                <asp:Button runat="server" ID="hiddenTargetControlForModalPopup" Style="display: none" />
                <ACT:ModalPopupExtender runat="server" ID="programmaticModalPopup" TargetControlID="hiddenTargetControlForModalPopup"
                    PopupControlID="programmaticPopup" BackgroundCssClass="modalBackground" DropShadow="True"
                    PopupDragHandleControlID="programmaticPopupDragHandle" RepositionMode="RepositionOnWindowScroll">
                </ACT:ModalPopupExtender>
                <asp:Panel runat="server" CssClass="modalPopup" ID="programmaticPopup" Style="display: none; width: 650px; height: 400px; padding: 10px">
                    <asp:Panel runat="Server" ID="programmaticPopupDragHandle" Style="cursor: move; background-color: #DDDDDD; border: solid 1px Gray; color: Black; text-align: center;">
                        انتخاب پرسنل
                    </asp:Panel>
                    <br />
                    <div style="text-align: center">
                        <asp:LinkButton runat="server" ID="btnCheckAll" Text="انتخاب همه" OnClick="btnCheckAll_Click" />
                        <asp:LinkButton runat="server" ID="btnRevers" Text="برعکس" OnClick="btnRevers_Click" />
                    </div>
                    <asp:Panel runat="server" ID="Container" ScrollBars="Both" Style="width: 100%; height: 300px">
                        <asp:CheckBoxList ID="EditGroupEmpNo" runat="server" RepeatColumns="3">
                        </asp:CheckBoxList>
                    </asp:Panel>
                    <br />
                    <div style="text-align: center">
                        <asp:LinkButton runat="server" ID="BtnGroupOk" Text="تایید" OnClick="hideModalPopupViaServer_Click" />
                        <asp:LinkButton runat="server" ID="BtnGroupCancel" Text="انصراف" OnClick="hideModalPopupViaServer_Click" />
                    </div>
                    <br />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" colspan="6">
                <asp:Button ID="BtnDelete" runat="server" Text="حذف" CssClass="btn" OnClick="BtnDelete_Click"
                    CausesValidation="False" OnClientClick="return confirm_delete();" />
                &nbsp;
                <asp:Button ID="BtnOK" runat="server" CssClass="btn" Text="ثبت درخواست" OnClick="BtnOk_Click"
                    CausesValidation="False" />
                &nbsp;
                <asp:Button ID="BtnCancel" runat="server" CssClass="btn" Text="انصراف" OnClick="BtnCancel_Click"
                    CausesValidation="False" />
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center;">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" ForeColor="#DFDFDF"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblSumTime" runat="server" Font-Bold="True" ForeColor="#DFDFDF"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSumRequest" runat="server" Font-Bold="True" ForeColor="#DFDFDF"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblSumOther" runat="server" Font-Bold="True" ForeColor="#DFDFDF"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
