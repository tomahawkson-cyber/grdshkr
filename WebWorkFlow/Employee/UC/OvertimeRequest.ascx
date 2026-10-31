<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.OvertimeRequest"
    CodeBehind="OvertimeRequest.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<style type="text/css">
    .auto-style1 {
        text-align: left;
    }

    .lblOverTime {
        /* display: inline-block; */
        /* width: 150px; */
        /* height: 25px; */
        /* font-weight: bold; */
        font-size: 9pt;
        font-family: tahoma;
        color: #00529b;
        border-width: 1px;
        border-style: Solid;
        border-color: #00529b;
        background-color: #bde5f8;
        padding: 5px;
    }
</style>
<body class="bd" style="direction: rtl">
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
            <td colspan="6">
                <div class="cap">
                    درخواست اضافه کاری
                </div>
                <asp:Label ID="lblParallelApprove" CssClass="alert-box" runat="server" Text="..." Visible="false" />
            </td>
            <td rowspan="5" style="width: 10%; text-align: center; background-color: whitesmoke; vertical-align: top; top: 0" id="tdDataFile" runat="server">
                <div class="cap">نمایش ترددها</div>
                <div style="overflow: auto; max-width: 140px; width: 90%; height: 135px; padding: 5px">
                    <PT:GridViewEx ID="GrdShowDataFile" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BorderColor="LightGray" OnDataSourceRequested="GrdShowDataFile_DataSourceRequested"
                        OnRowDataBound="GrdShowDataFile_RowDataBound" CssClass="RedDatagrid" BorderStyle="Solid"
                        BorderWidth="1px" EnableModelValidation="True" PageSize="31">
                        <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی" />
                        <FooterStyle CssClass="RedDatagridFooter" />
                        <RowStyle CssClass="DGItem" />
                        <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                        <HeaderStyle CssClass="RedDatagridHeader" />
                        <AlternatingRowStyle CssClass="DGAlternate" />
                    </PT:GridViewEx>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style1">
                <span dir="ltr" style="text-align: left">
                    <asp:Label ID="lbl_SubmittedDate" runat="server" Font-Bold="True"
                        ForeColor="#DFDFDF" Text="1390/01/01 12:20" ToolTip="تاریخ و ساعت ثبت درخواست"></asp:Label>
                </span>
            </td>

        </tr>
        <tr>
            <td class="TdLblSty" nowrap="nowrap">از&nbsp;تاریخ :
            </td>
            <td class="TdEditorSty">
                <uc1:DatePicker ID="EditStartDate" runat="server" />
            </td>
            <td class="TdLblSty">تا
                تاریخ :
            </td>
            <td class="TdEditorSty">
                <uc1:DatePicker ID="EditEndDate" runat="server" />
            </td>
            <td class="TdLblSty">مدت :
            </td>
            <td class="TdEditorSty">
                <asp:TextBox ID="EditOverTime" runat="server" Height="22px" Style="margin-right: 2px"
                    ValidationGroup="t1" Width="40px">00:00</asp:TextBox>
                <ACT:MaskedEditExtender ID="EditOverTime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                    CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="EditOverTime">
                </ACT:MaskedEditExtender>
                <ACT:MaskedEditValidator ID="MaskedEditValidator5" runat="server" ControlExtender="EditOverTime_MaskedEditExtender"
                    ControlToValidate="EditOverTime" Display="Dynamic" ErrorMessage="*" InvalidValueBlurredMessage="*"
                    InvalidValueMessage="مقدار ناردست" IsValidEmpty="False" ToolTip="زمان را وارد نمایید"
                    ValidationGroup="t1"></ACT:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right" nowrap="nowrap">توضیحات :</td>
            <td class="TdEditorSty" colspan="5">
                <asp:TextBox ID="EditDescription" runat="server" Height="52px" Width="95%"
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" align="right">
                <asp:Label ID="lblEmpNo" runat="server" Text="شماره پرسنلی :"></asp:Label>
            </td>
            <td class="TdEditorSty" colspan="5">
                <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="66%" Visible="false" OnSelectedIndexChanged="EditEmpNo_SelectedIndexChanged" AutoPostBack="True" />
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
            <td colspan="6">
                <asp:Button ID="BtnDelete" runat="server" Text="حذف" CssClass="btn" OnClick="BtnDelete_Click"
                    CausesValidation="False" OnClientClick="return confirm_delete();" />
                &nbsp;
                <asp:Button ID="BtnOk" runat="server" Text="ثبت درخواست" CssClass="btn" OnClick="BtnOk_Click"
                    CausesValidation="False" />
                &nbsp;
                <asp:Button ID="BtnCancel" runat="server" Text="انصراف" CssClass="btn" OnClick="btnCancel_Click"
                    CausesValidation="False" />
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" colspan="6" style="text-align: center;height: 30px">
                <asp:Label ID="lblShiftInfo" runat="server" CssClass="lblOverTime"></asp:Label>&nbsp;&nbsp;
                <asp:Label ID="lblCountInfo" runat="server" CssClass="lblOverTime"></asp:Label>&nbsp;&nbsp;
                <asp:Label ID="lblCountMonthInfo" runat="server" CssClass="lblOverTime"></asp:Label>&nbsp;&nbsp;
                  <asp:Label ID="lblSumMonthInfo" runat="server" CssClass="lblOverTime"></asp:Label>
            </td>
        </tr>
    </table>
</body>
