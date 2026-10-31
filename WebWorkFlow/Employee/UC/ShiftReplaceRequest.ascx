<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.ShiftReplaceRequest"
    CodeBehind="ShiftReplaceRequest.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>

<body class="bd">
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
            <td colspan="3">
                <div class="cap">
                    درخواست جابجایی در شیفت
                </div>
                <asp:Label ID="lblParallelApprove" CssClass="alert-box"  runat="server" Text="..." Visible="false" />
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" width="20%">
                &nbsp;تاریخ&nbsp; درخواست :&nbsp;
            </td>
            <td class="TdEditorSty" align="left">
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
            <td align="right">
                &nbsp; مدت درخواست :&nbsp;
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:TextBox ID="EditDuration" runat="server" Width="70px"></asp:TextBox>
                &nbsp;روز&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="ChkDuration" runat="server" Text="تا اطلاع ثانوی" AutoPostBack="True"
                    OnCheckedChanged="ChkDuration_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td align="right">
                گروه فعلی :&nbsp;
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:TextBox ID="EditCurGroup" runat="server" ReadOnly="True" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                گروه جدید :
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:DropDownList ID="EditNewGroup" runat="server" Width="80%" CssClass="Ddl">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                توضیحات :</td>
            <td class="TdEditorSty" colspan="2">
                <asp:TextBox ID="EditDescription" runat="server" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblEmpNo0" runat="server" Text="شماره پرسنلی :"></asp:Label>
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="70%" Visible="false"
                    OnSelectedIndexChanged="EditEmpNo_SelectedIndexChanged" AutoPostBack="True" />
                <asp:LinkButton runat="server" ID="showModalPopup" Text="انتخاب گروهی پرسنل" OnClick="showModalPopupServerOperatorButton_Click"
                    BorderStyle="Solid" BorderWidth="1px" />
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
            <td align="left" colspan="3">
                <asp:Button ID="BtnDelete" runat="server" Text="حذف" CssClass="btn" OnClick="BtnDelete_Click"
                    CausesValidation="False" OnClientClick="return confirm_delete();" />
                &nbsp;
                <asp:Button ID="BtnOk" runat="server" Text="ثبت درخواست" CssClass="btn" OnClick="BtnOk_Click"
                    CausesValidation="False" />
                &nbsp;
                <asp:Button ID="BtnCancel" runat="server" Text="انصراف" OnClick="BtnCancel_Click"
                    CssClass="btn" CausesValidation="False" />
                <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</body>
