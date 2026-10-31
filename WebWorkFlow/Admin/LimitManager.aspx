<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.LimitManager" Title="شرکت دنیای پردازش :: اعمال محدودیت مدیران"
    CodeBehind="LimitManager.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: اعمال محدودیت مدیران</title>
    <style type="text/css">
        .style1 {
            text-align: right;
            border: thin solid #000000;
        }

        .style2 {
            text-align: right;
            border: thin solid #000000;
        }

        .auto-style1 {
            text-align: left;
            border: thin solid #000000;
        }

        .auto-style2 {
            text-align: center;
            border: thin solid #000000;
        }

        .tbldata {
            width: 100%;
            border: 1px solid #000000;
            max-width: 800px;
            border-collapse: collapse;
        }

            .tbldata tr {
                height: 35px;
            }

                .tbldata tr input {
                    width: 40px;
                    direction: ltr;
                    text-align: center;
                }
    </style>
    <script type="text/javascript">
        function ConfirmSaveAs(sender) {

            jConfirm('آیا با ثبت اطلاعات جاری برای مدیر انتخابی موافقید؟', 'گردش کار',
                function (elem) {
                    if (elem) {
                        __doPostBack(sender.id, '');
                    }
                }
            );
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%; border: 1px solid #000000; background-color: White;">
        <caption>
            اعمال محدودیت مدیران
        </caption>
        <tr>
            <td align="center" valign="top">
                <table width="100%" style="border: 1px solid #000000; max-width: 800px; border-collapse: collapse;">
                    <tr>
                        <td style="text-align: left">مدیر :
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="Edit_ManagerNo" runat="server" Width="200px" AutoPostBack="True"
                                OnSelectedIndexChanged="Edit_ManagerNo_SelectedIndexChanged" />
                        </td>
                        <td style="text-align: left">بخش :
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="Edit_Section" runat="server" Width="200px" AutoPostBack="True"
                                OnSelectedIndexChanged="Edit_Section_SelectedIndexChanged" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td align="center" valign="top">
                <table class="tbldata">

                    <tr class="RedDatagridHeader" style="height: 35px">
                        <td class="auto-style2">عملکردهای سیستم</td>
                        <td style="border: thin solid #000000;" class="auto-style2">محدودیت های هر برگه</td>
                        <td class="auto-style2">محدودیت های ماهیانه</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">مرخصي روزانه :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_DailyLeave" runat="server" type="number">00</asp:TextBox>
                          
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="Edit_DailyLeave0" runat="server" type="number">0000</asp:TextBox>
                           
                            &nbsp;روز</td>
                    </tr>
                    <tr class="RedDatagridAlternate">
                        <td class="auto-style1">ماموريت روزانه :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_DailyDuty" runat="server" type="number">00</asp:TextBox>
                           
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="Edit_DailyDuty0" runat="server" type="number">0000</asp:TextBox>
                            
                            &nbsp;روز</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">مرخصي روزانه بدون حقوق :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_DailyLeaveOut" runat="server" type="number">00</asp:TextBox>
                          
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="Edit_DailyLeaveOut0" runat="server" type="number">0000</asp:TextBox>
                           
                            &nbsp;روز</td>
                    </tr>
                    <tr class="RedDatagridAlternate">
                        <td class="auto-style1">جابجایی در گروه :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_ShiftReplace" runat="server" type="number">00</asp:TextBox>
                           
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="Edit_ShiftReplace0" runat="server" type="number">0000</asp:TextBox>
                           
                            &nbsp;روز</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">اصلاح ورود خروج :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:CheckBox ID="Edit_InOutCorrection" runat="server" />
                        </td>
                        <td class="auto-style2">
                            <asp:CheckBox ID="Edit_InOutCorrection0" runat="server" />
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1">ورود و خروج فراموش شده :
                        </td>
                        <td class="auto-style2">
                            <asp:CheckBox ID="Edit_ForgottenInOut" runat="server" />
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:CheckBox ID="Edit_ForgottenInOut0" runat="server" />
                        </td>
                    </tr>
                    <tr class="RedDatagridAlternate">
                        <td class="auto-style1">ماموریت ساعتی بدون بازگشت :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:CheckBox ID="Edit_TimeDutyNoReturn" runat="server" />
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:CheckBox ID="Edit_TimeDutyNoReturn0" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">مرخصی ساعتي :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_TimeLeave" runat="server" Style="margin-right: 2px"
                                ValidationGroup="t1">00:00</asp:TextBox>
                            <ACT:MaskedEditExtender ID="Edit_TimeLeave_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="Edit_TimeLeave">
                            </ACT:MaskedEditExtender>
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_TimeLeave0" runat="server" Style="margin-right: 2px" type="number"
                                ValidationGroup="t1">0000</asp:TextBox>
                          
                            &nbsp;ساعت</td>
                    </tr>
                    <tr class="RedDatagridAlternate">
                        <td class="auto-style1">ماموریت ساعتي :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_TimeDuty" runat="server" Style="margin-right: 2px"
                                ValidationGroup="t1">00:00</asp:TextBox>
                            <ACT:MaskedEditExtender ID="Edit_TimeDuty_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                CultureTimePlaceholder="" Enabled="True" Mask="99:99" TargetControlID="Edit_TimeDuty">
                            </ACT:MaskedEditExtender>
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_TimeDuty0" runat="server" Style="margin-right: 2px" type="number"
                                ValidationGroup="t1">0000</asp:TextBox>
                            
                            &nbsp;ساعت</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">مجوز اضافه کاري :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_Overtime" runat="server" Style="margin-right: 2px"
                                ValidationGroup="t1">000:00</asp:TextBox>
                            <ACT:MaskedEditExtender ID="Edit_Overtime_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                CultureTimePlaceholder="" Enabled="True" Mask="999:99" TargetControlID="Edit_Overtime">
                            </ACT:MaskedEditExtender>

                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_Overtime0" runat="server" type="number" Style="margin-right: 2px" ValidationGroup="t1">0000</asp:TextBox>
                           
                            &nbsp;ساعت
                        </td>
                    </tr>
                    <tr class="RedDatagridAlternate">
                        <td class="auto-style1">افزايش و کاهش مرخصي :
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_LeaveAddition" runat="server" Style="margin-right: 2px"
                                ValidationGroup="t1">000:00</asp:TextBox>
                            <ACT:MaskedEditExtender ID="Edit_LeaveAddition_MaskedEditExtender" runat="server"
                                ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                CultureTimePlaceholder="" Enabled="True" Mask="999:99" TargetControlID="Edit_LeaveAddition">
                            </ACT:MaskedEditExtender>
                        </td>
                        <td style="border: thin solid #000000;" class="auto-style2">
                            <asp:TextBox ID="Edit_LeaveAddition0" runat="server" Style="margin-right: 2px" type="number"
                                ValidationGroup="t1">0000</asp:TextBox>
                           
                            &nbsp;ساعت</td>
                    </tr>


                </table>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <table width="100%" style="max-width: 800px; border-collapse: collapse;">
                    <tr>

                        <td>
                            <asp:Button ID="Btn_Save" runat="server" OnClick="Btn_Save_Click" Text="ثبت محدودیت ها" CssClass="btn" />&nbsp;<asp:Button ID="Btn_SaveAll" runat="server" OnClick="Btn_SaveAll_Click" Text="ثبت برای کلیه مدیران" OnClientClick="return confirm('تنظیمات تمام مدیران تغییر پیدا می کند.\nآیا موافقید؟');" Visible="False" />
                            <br />
                        </td>
                        <td style="text-align: left">ذخیره اطلاعات برای مدیر&nbsp;
                            <asp:DropDownList ID="Edit_ManagerNo0" runat="server" Width="200px" Style="text-align: right" onchange="javascript:ConfirmSaveAs(this);" OnSelectedIndexChanged="Edit_ManagerNo0_SelectedIndexChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
