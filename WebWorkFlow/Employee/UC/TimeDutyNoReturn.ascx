<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.TimeDutyNoReturn"
    CodeBehind="TimeDutyNoReturn.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<body class="bd" dir="rtl">
    <!-- Full Screen Div For Accept -->
    <table id="TBL_MSG" runat="server" visible="false" border="1" cellpadding="2" cellspacing="0"
        style="border: thin groove #800000; font-family: Tahoma; font-size: 9pt; color: #0000FF;
        background-color: #C0C0C0; position: absolute; left: 30%; top: 40%; width: 300px;
        cursor: default; z-index: 100; height: 70px" dir="rtl">
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
                <asp:Button ID="btn_okMSG" runat="server" Style="border: 1px solid black; font-size: 9pt;
                    color: black; font-family: tahoma; background-color: #ffffff; height: 20px;"
                    Text="&nbsp;&#1576;&#1604;&#1740;&nbsp;" UseSubmitBehavior="False" OnClick="btn_okMSG_Click" />
            </td>
        </tr>
    </table>
    <!-- Full Screen Div For Accept -->
    <table class="mainTable">       
        <tr>
            <td colspan="5">
                <div class="cap">
                    درخواست ماموریت ساعتی بدون بازگشت
                </div>
                <asp:Label ID="lblParallelApprove" CssClass="alert-box"  runat="server" Text="..." Visible="false" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">
                عنوان :&nbsp;
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:DropDownList ID="EditCards" runat="server" CssClass="Ddl" Width="150px">
                </asp:DropDownList>
            </td>
            <td class="TdEditorSty" style="text-align: left" colspan="2">
                <span dir="ltr" style="text-align: left">
                    <asp:Label ID="lbl_SubmittedDate" runat="server" Font-Bold="True" ForeColor="#DFDFDF"
                        Text="1390/01/01 12:20" ToolTip="تاریخ و ساعت ثبت درخواست"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" nowrap="nowrap">
                &nbsp;تاریخ&nbsp; درخواست :
            </td>
            <td class="TdEditorSty" colspan="4">
                <uc1:DatePicker ID="EditRequestDate" runat="server" IsAutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center" id="tdDateFile" runat="server" dir="ltr">
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" nowrap="nowrap">
                ساعت شروع :
            </td>
            <td class="TdEditorSty" nowrap="nowrap" colspan="2">
                <asp:TextBox ID="EditStartTime" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px" onfocus="SetlastFocus(this)">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditStartTime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditStartTime">
                </ACT:MaskedEditExtender>
                <ACT:MaskedEditValidator ID="MaskedEditValidator7" runat="server" ControlExtender="EditEndTime_MaskedEditExtender"
                    ControlToValidate="EditEndTime" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                    InvalidValueMessage="مقدار ناردست" ToolTip="زمان را وارد نمایید" ValidationGroup="t1"
                    SetFocusOnError="True"></ACT:MaskedEditValidator>
            </td>
            <td class="TdEditorSty">
                ساعت پایان :&nbsp;
            </td>
            <td class="TdEditorSty">
                <asp:TextBox ID="EditEndTime" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px" onfocus="SetlastFocus(this)">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditEndTime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditEndTime">
                </ACT:MaskedEditExtender>
                <ACT:MaskedEditValidator ID="MaskedEditValidator6" runat="server" ControlExtender="EditEndTime_MaskedEditExtender"
                    ControlToValidate="EditEndTime" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                    InvalidValueMessage="مقدار ناردست" ToolTip="زمان را وارد نمایید" ValidationGroup="t1"
                    SetFocusOnError="True"></ACT:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" nowrap="nowrap" colspan="5" style="text-align: right">
                <asp:RadioButton ID="RBExitFromOrg" runat="server" 
                    Text="شروع ماموریت از سازمان می باشد" Checked="True" GroupName="Status" /><br />
                <asp:RadioButton ID="RBExitFromHome" runat="server" 
                    Text="شروع ماموریت خارج از سازمان می باشد" GroupName="Status" />
                <br />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" nowrap="nowrap">
                توضیحات :
            </td>
            <td class="TdEditorSty" nowrap="nowrap" colspan="4">
                <asp:TextBox ID="Edit_Description" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" nowrap="nowrap">
                <asp:Label ID="lblEmpNo0" runat="server" Text="شماره پرسنلی :"></asp:Label>
            </td>
            <td class="TdEditorSty" colspan="4">
                <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="70%" Visible="false"
                    OnSelectedIndexChanged="EditEmpNo_SelectedIndexChanged" AutoPostBack="True" />
                <asp:LinkButton runat="server" ID="showModalPopup" Text="انتخاب گروهی پرسنل" OnClick="showModalPopupServerOperatorButton_Click"
                    BorderStyle="Solid" BorderWidth="1px" Visible="False" />
                <asp:Button runat="server" ID="hiddenTargetControlForModalPopup" Style="display: none" />
                <ACT:ModalPopupExtender runat="server" ID="programmaticModalPopup" TargetControlID="hiddenTargetControlForModalPopup"
                    PopupControlID="programmaticPopup" BackgroundCssClass="modalBackground" DropShadow="True"
                    PopupDragHandleControlID="programmaticPopupDragHandle" RepositionMode="RepositionOnWindowScroll">
                </ACT:ModalPopupExtender>
                <asp:Panel runat="server" CssClass="modalPopup" ID="programmaticPopup" Style="display: none;
                    width: 650px; height: 400px; padding: 10px">
                    <asp:Panel runat="Server" ID="programmaticPopupDragHandle" Style="cursor: move; background-color: #DDDDDD;
                        border: solid 1px Gray; color: Black; text-align: center;">
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
            <td class="TdLblSty" colspan="2">
                <asp:Button ID="BtnDelete" runat="server" Text="حذف" CssClass="btn" OnClick="BtnDelete_Click"
                    CausesValidation="False" OnClientClick="return confirm_delete();" />
                &nbsp;
                <asp:Button ID="BtnOk" runat="server" CssClass="btn" Text="ثبت درخواست" OnClick="BtnOk_Click"
                    CausesValidation="False" />
                &nbsp;
                <asp:Button ID="BtnCancel" runat="server" CssClass="btn" Text="انصراف" OnClick="BtnCancel_Click"
                    CausesValidation="False" />
            </td>
            <td class="TdLblSty" colspan="3" align="center">
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</body>
