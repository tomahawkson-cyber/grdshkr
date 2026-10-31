<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.DailyRequest"
    CodeBehind="DailyRequest.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/UC/imageUploadControl.ascx" TagName="imageUploadControl" TagPrefix="uc1" %>

<body class="bd">
    <table id="TBL_Show" runat="server" visible="false" border="1" cellpadding="2" cellspacing="0"
        style="border-width: 0px; font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color: #C0C0C0; position: absolute; left: 30%; top: 40%; width: 250px; cursor: default; z-index: 100; font-weight: bold;">
        <tr class="cap">
            <td align="right">
                <asp:ImageButton ID="BtnOkHours" runat="server" Height="17px" ImageUrl="~/images/BtnCancel.png"
                    OnClick="BtnOkHours_Click" ToolTip="خروج" CausesValidation="False" />
                نمایش تعطیلات
            </td>
        </tr>
        <tr>
            <td dir="rtl" align="center" valign="top" style="border-style: solid; border-bottom-width: 0px; border-color: #000000;">
                <div id="TdHoliday" runat="server" style="width: 100%; max-height: 300px; overflow: auto; margin: 0; padding: 0"></div>
            </td>
        </tr>
    </table>
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
                <asp:Button ID="btn_okMSG" runat="server" Style="border: 1px solid black; font-size: 9pt; color: black; font-family: tahoma; background-color: #ffffff;"
                    Text="&nbsp;&#1576;&#1604;&#1740;&nbsp;"
                    UseSubmitBehavior="False" OnClick="btn_okMSG_Click" />
            </td>
        </tr>
    </table>

    <table class="mainTable">
        <tr>
            <td colspan="6">
                <div class="cap">
                    درخواست مرخصی روزانه
                </div>
                <asp:Label ID="lblParallelApprove" CssClass="alert-box" runat="server" Text="..." Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">عنوان مجوز :
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:DropDownList ID="EditCards" runat="server" CssClass="Ddl" Width="100%">
                </asp:DropDownList>
            </td>
            <td class="TdEditorSty" colspan="2" style="text-align: left">
                <span dir="ltr" style="text-align: left">
                    <asp:Label ID="lbl_SubmittedDate" runat="server" Font-Bold="True" ForeColor="#DFDFDF"
                        Text="1390/01/01 12:20" ToolTip="تاریخ و ساعت ثبت درخواست" Style="text-align: right"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">از تاریخ :
            </td>
            <td class="TdEditorSty" nowrap="nowrap">
                <uc1:DatePicker ID="EditStartDate" runat="server" />
            </td>
            <td>تا تاریخ :
            </td>
            <td align="right" nowrap="nowrap">
                <uc1:DatePicker ID="EditEndDate" runat="server" />
            </td>
            <td align="right" nowrap="nowrap">مدت :
                <asp:TextBox name="EditDuration" runat="server" ID="EditDuration" ReadOnly="True"
                    Width="38px"></asp:TextBox>&nbsp;روز
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">توضیحات :
            </td>
            <td class="TdEditorSty" nowrap="nowrap" colspan="4">
                <asp:TextBox ID="EditDescription" runat="server" Width="95%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">
                <asp:Label ID="lblEmpNo" runat="server" Text="شماره پرسنلی :" Visible="False"></asp:Label>
            </td>
            <td colspan="4" align="right">
                <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="70%" OnSelectedIndexChanged="EditEmpNo_SelectedIndexChanged"
                    Visible="false" AutoPostBack="True" />
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
            <td colspan="5" id="divUpload" runat="server">
                <uc1:imageUploadControl ID="imageUploadControl1" runat="server" ImageUploadFolder="Attachment/Attachment_Temp" />
            </td>
        </tr>
        <tr>
            <td class="TdEditorSty" colspan="2">
                <asp:Button ID="BtnDelete" runat="server" Text="حذف" CssClass="btn" OnClick="BtnDelete_Click"
                    CausesValidation="False" OnClientClick="return confirm_delete();" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnOk" runat="server" Text="ثبت درخواست" CssClass="btn" OnClick="BtnOk_Click"
                    CausesValidation="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnCancel" runat="server" Text="انصراف" CssClass="btn" OnClick="BtnCancel_Click"
                    CausesValidation="False" />
            </td>
            <td class="TdEditorSty" colspan="3" align="center" nowrap="nowrap">
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: center">
                <table width="100%">
                    <tr>

                        <td>
                            <asp:Label ID="lblInfo" runat="server" Font-Bold="True" ForeColor="#DFDFDF"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblSumTime" runat="server" Font-Bold="True" ForeColor="#DFDFDF"></asp:Label></td>

                    </tr>
                    <tr>
                        <td><asp:Label ID="lblSumRequest" runat="server" Font-Bold="True" ForeColor="#DFDFDF"></asp:Label></td>

                        <td>
                            <asp:Label ID="lblSumOther" runat="server" Font-Bold="True" ForeColor="#DFDFDF"></asp:Label></td>
                    </tr>

                </table>

            </td>
        </tr>
    </table>
</body>
