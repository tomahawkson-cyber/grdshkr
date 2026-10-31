<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    CodeBehind="SetAccessWarden.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.SetAccessWarden"
    Title="شرکت دنیای پردازش :: تنظیمات کارکرد بازرس" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>شرکت دنیای پردازش :: تنظیمات کارکرد بازرس</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="background-color: LightSteelBlue; width: 100%">
        <caption>
            تنظیمات کارکرد بازرس
        </caption>
        <tr>
            <td align="right" colspan="2">بازرس :&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="Cmb_Warden" runat="server" OnSelectedIndexChanged="Cmb_Warden_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:CheckBox ID="Chb_JustShift" runat="server" Text="فقط در طول شیفت کاری حق بازرسی دارد" />
            </td>
            <td align="right">
                <asp:CheckBox ID="ChbIsShowRequest" runat="server" Text="قابلیت مشاهده جزییات درخواست را دارد" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:TextBox ID="Txt_DayCount" runat="server" Width="46px"></asp:TextBox>
                <ACT:MaskedEditExtender ID="Txt_DayCount_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                    CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                    Enabled="True" MaskType="Number" Mask="999" TargetControlID="Txt_DayCount">
                </ACT:MaskedEditExtender>
                &nbsp;روز قبل را میتواند کنترل کند(999 روز&nbsp; به معنای دایمی میباشد)
            </td>
            <td align="right">
                <asp:CheckBox ID="ChbIsShowReview" runat="server" Text="قابلیت مشاهده نظر مدیر را دارد" />
            </td>
        </tr>

        <tr>
            <td align="center" colspan="2">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 15%; vertical-align: top">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="background-color: #ffecec">لیست مجوزها
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" dir="rtl">
                                        <asp:CheckBoxList ID="CHL_Cards" runat="server" AutoPostBack="True" RepeatColumns="1" Width="100%"
                                            BorderStyle="Solid" BackColor="AntiqueWhite">
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 84%">
                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td style="background-color: #ffecec">لیست بخشهای قابل دسترسی
                            
                            <asp:Button ID="BtnSelectAll" runat="server" Text="انتخاب همه" OnClick="BtnSelectAll_Click" />
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" dir="rtl">
                                        <asp:CheckBoxList ID="CHL_Sections" runat="server" AutoPostBack="True" RepeatColumns="4" Width="100%"
                                            BorderStyle="Solid" BackColor="AntiqueWhite">
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>


            </td>
        </tr>
        <tr align="left">
            <td align="center" colspan="2">
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="BtnSave" runat="server" Text="ثبت" OnClick="BtnSave_Click" OnClientClick="return  confirm('آیا با اعمال تغییرات موافقید؟')" />
            </td>
        </tr>
    </table>
</asp:Content>
