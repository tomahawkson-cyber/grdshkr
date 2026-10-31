<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.DailyDuty"
    CodeBehind="DailyDuty.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/UC/imageUploadControl.ascx" TagName="imageUploadControl" TagPrefix="uc1" %>

<style type="text/css">
    .auto-style1 {
        vertical-align: middle;
        text-align: center;
        max-width: 120px;
    }
</style>
<script>
    function setOtherStr(sender) {
        var editor = document.getElementById(sender.id + 'Str');
        if (sender.selectedIndex == 6)
            editor.style.display = 'inline';
        else editor.style.display = 'none';
    }
</script>

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
            <td dir="rtl" id="TdHoliday" runat="server" align="center" valign="top" style="border-style: solid; border-bottom-width: 0px; border-color: #000000;"></td>
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
                    درخواست ماموریت روزانه
                </div>
                <asp:Label ID="lblParallelApprove" CssClass="alert-box"  runat="server" Text="..." Visible="false" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">عنوان مجوز :
            </td>
            <td class="TdEditorSty" colspan="3">
                <asp:DropDownList ID="EditCards" runat="server" CssClass="Ddl" Width="100%">
                </asp:DropDownList>
            </td>
            <td colspan="2" style="text-align: center">
                <span dir="ltr" style="text-align: left">
                    <asp:Label ID="lbl_SubmittedDate" runat="server" Font-Bold="True" ForeColor="#DFDFDF"
                        Text="1390/01/01 12:20" ToolTip="تاریخ و ساعت ثبت درخواست"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">از تاریخ :
            </td>
            <td class="TdEditorSty">
                <uc1:DatePicker ID="EditStartDate" runat="server" />
            </td>
            <td>تا تاریخ :
            </td>
            <td class="TdEditorSty">
                <uc1:DatePicker ID="EditEndDate" runat="server" />
            </td>
            <td>مدت :
            </td>
            <td style="text-align: right">
                <asp:TextBox name="EditDuration" ID="EditDuration" Enabled="false"
                    runat="server" Width="40px"></asp:TextBox>
                &nbsp;روز
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">مبدا :
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:TextBox ID="Edit_Source" runat="server" Width="90%" MaxLength="20"></asp:TextBox>
            </td>
            <td style="text-align: left">مقصد :
            </td>
            <td style="text-align: right" colspan="2">
                <asp:TextBox ID="Edit_Distination" runat="server" Width="90%" MaxLength="20"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">وسیله رفت :
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:DropDownList ID="EditDeviceWent" runat="server" CssClass="Ddl" Width="90%" />
            </td>
            <td style="text-align: left">وسیله برگشت :
            </td>
            <td style="text-align: right" colspan="2">
                <asp:DropDownList ID="EditDeviceBack" runat="server" CssClass="Ddl" Width="90%" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">وضعیت اقامت :
            </td>
            <td class="TdEditorSty" colspan="2">
                <asp:RadioButton ID="EditLocationCompany" runat="server" Text="تامین شده"
                    ValidationGroup="LocationStatus" GroupName="LocationStatus" />
            </td>
            <td style="text-align: right" colspan="3">&nbsp;
                <asp:RadioButton ID="EditLocationPersonal" runat="server" Text="تامین نشده"
                    ValidationGroup="LocationStatus" GroupName="LocationStatus" />
            </td>
        </tr>
          <tr>
            <td class="TdLblSty" nowrap="nowrap">هزینه ایاب و ذهاب :</td>
            <td class="TdEditorSty" nowrap="nowrap" colspan="5">
                <asp:TextBox ID="EditTransferCost" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="cv" runat="server" ControlToValidate="EditTransferCost" Type="Double"
                    Operator="DataTypeCheck" ErrorMessage="مقدار وارد  شده باید عدد باشد!" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">توضیحات :
            </td>
            <td colspan="5" >
                <asp:TextBox ID="Edit_Description" runat="server" Width="95%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">
                <asp:Label ID="lblEmpNo" runat="server" Text="شماره پرسنلی :" Visible="False"></asp:Label>
            </td>
            <td colspan="5" align="right">
                <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="70%" Visible="false" />
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
            <td colspan="6" id="divUpload" runat="server">
                <uc1:imageUploadControl ID="imageUploadControl1" runat="server" ImageUploadFolder="Attachment/Attachment_Temp" />
            </td>
        </tr>
        <tr>
            <td colspan="6" width="100%">
                <asp:Button ID="BtnDelete" runat="server" Text="حذف" CssClass="btn" OnClick="BtnDelete_Click"
                    CausesValidation="False" OnClientClick="return confirm_delete();" />
                &nbsp;&nbsp;
                <asp:Button ID="BtnOk" runat="server" Text="ثبت درخواست" CssClass="btn" OnClick="BtnOk_Click"
                    ValidationGroup="DD" CausesValidation="False" />
                &nbsp;&nbsp;
                <asp:Button ID="BtnCancel" runat="server" Text="انصراف" CssClass="btn" OnClick="BtnCancel_Click"
                    CausesValidation="False" />
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>        
    </table>
</body>
