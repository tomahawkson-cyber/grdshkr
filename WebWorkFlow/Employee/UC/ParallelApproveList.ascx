<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.ParallelApproveList" CodeBehind="ParallelApproveList.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/UC/Pager.ascx" TagName="Pager" TagPrefix="custom" %>

<style type="text/css">
    .style1 {
        text-align: left;
    }

    .style2 {
        width: 22px;
        height: 22px;
    }

    .Captionkartable {
        text-align: center;
    }

    .auto-style1 {
        background-color: #FFFFEC;
    }

    .auto-style2 {
        text-align: left;
        background-color: #FFFFEC;
    }
</style>
<script type="text/javascript">
    function IsSelectedItem(sender) {
        var grdList = document.getElementById('ctl00_ContentPlaceHolder1_ParallelApproveList1_GrdList');
        if (grdList == null) {
            alert('درخواست انتخاب شده ای وجود ندارد!');
            return false;
        }
        var isSelected = false;
        for (var i = 1; i < grdList.rows.length; i++) {
            if (grdList.rows[i].cells[0].childNodes[0].checked || grdList.rows[i].cells[0].childNodes[1].checked) {
                isSelected = true;
                break;
            }
        }
        if (isSelected) {
            return confirm('آیا با انجام عملیات ' + sender + ' موافقید؟');
        }
        else {
            alert('لطفا یک درخواست را جهت انجام عملیات ' + sender + ' انتخاب نمایید!!');
            return false;
        }
    }    
</script>

<div id="Pnl_Container" runat="server" visible="false">
    <div id="progressBackgroundFilter">
    </div>
    <div id="Modalreq">
        <div style="cursor: pointer; background-color: #DDDDDD; border: solid 1px Gray; color: Black; text-align: center">
            سیستم گردش کار
        </div>
        <table width="100%">
            <tr>
                <td dir="rtl" align="center">
                    <asp:PlaceHolder ID="PH_Container" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="PnlprogrammaticPopup" runat="server">
    <div id="Div2" class="progressBackgroundFilter">
    </div>
    <div id="Div3" class="Modalreq">
        <div style="cursor: pointer; background-color: #DDDDDD; border: solid 1px Gray; color: Black; text-align: center">
            سیستم گردش کار
        </div>
        <table width="100%">
            <tr>
                <td dir="rtl" align="center">
                    <asp:Panel ID="Pan_Err" runat="server" ScrollBars="Auto">
                        <asp:BulletedList ID="BL_Err" runat="server" BulletStyle="Numbered">
                        </asp:BulletedList>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <div align="center">
            <asp:Button CssClass="Btn" ID="ButtonOk" runat="server" Text="تایید" OnClick="ButtonOk_Click" />
        </div>
    </div>
</div>
<table style="width: 100%;" bgcolor="LightSteelBlue" dir="rtl">
    <caption>
        کارتابل کارشناسی</caption>
    <tr>
        <td valign="top" align="right">
            <table border="1" cellpadding="0" cellspacing="0" style="background-color: #eeeeee; width: 100%">
                <tr>
                    <td style="width: 35%;">
                        <div class="Captionkartable">
                            درخواستهای قابل نمایش
                        </div>
                        <table id="tblsearch" dir="rtl" style="width: 100%;">
                            <tr>
                                <td nowrap="nowrap" class="style1">وضعیت کارشناسی:
                                </td>
                                <td width="250" colspan="2">
                                    <asp:Label ID="lblStatus" runat="server" BackColor="#E6F2FF" Font-Bold="True" ForeColor="Red" BorderColor="Black" BorderStyle="Groove" BorderWidth="1px" Font-Names="tahoma" Font-Size="Medium"
                                        Style="padding: 10px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" class="style1">وضعیت بررسی مدیر:</td>
                                <td colspan="2">
                                    <asp:DropDownList ID="EditRequestStatus" runat="server" CssClass="Ddl" AutoPostBack="True" Width="200px"
                                        OnSelectedIndexChanged="EditRequestStatus_SelectedIndexChanged">
                                        <asp:ListItem Value="4">همه</asp:ListItem>
                                        <asp:ListItem Value="0">بررسی نشده</asp:ListItem>
                                        <asp:ListItem Value="1">تایید شده</asp:ListItem>
                                        <asp:ListItem Value="2">رد شده</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td nowrap="nowrap" class="style1">نوع عملیات :
                                    <asp:Literal ID="ltlCount" runat="server" Text="0" Visible="false" />
                                    <asp:Literal ID="ltlRemoved" Text="0" runat="server" Visible="False" />
                                </td>
                                <td colspan="2">
                                    <asp:DropDownList ID="EditOperation" runat="server" CssClass="Ddl" AutoPostBack="True"
                                        OnSelectedIndexChanged="EditOperation_SelectedIndexChanged" Width="200px">
                                    </asp:DropDownList>
                                    &nbsp;
                                </td>
                            </tr>

                            <tr>
                                <td nowrap="nowrap" class="style1">بخش ها:
                                </td>
                                <td width="250" colspan="2">
                                    <asp:DropDownList ID="EditSections" runat="server" CssClass="Ddl" AutoPostBack="True"
                                        OnSelectedIndexChanged="EditSections_SelectedIndexChanged" Width="200px">
                                    </asp:DropDownList>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" class="auto-style2">شماره یا نام کارمند:
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="EditEmpInfo" runat="server" Width="190px"></asp:TextBox>
                                </td>
                                <td align="center" class="auto-style1">
                                    <asp:ImageButton ID="BtnSearchEmp" runat="server" BorderWidth="0px" ImageAlign="TextTop"
                                        ImageUrl="~/images/icon_find.GIF" OnClick="BtnSearchEmp_Click" ToolTip="جستجو بر اساس تاریخ ثبت درخواست"
                                        Width="20px" />
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" class="auto-style2">تاریخ درخواست:
                                </td>
                                <td class="auto-style1">
                                    <uc1:DatePicker ID="EditFromDate" runat="server" />
                                </td>
                                <td class="auto-style1">
                                    <uc1:DatePicker ID="EditToDate" runat="server" Caption="تا :" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" align="center" runat="server" id="tdAction">
                        <div class="Captionkartable">
                            عملیات گروهی
                        </div>
                        <div style="padding: 10px">
                            <asp:ImageButton ID="BtnAcceptGrp" runat="server" ImageUrl="~/images/kartableAction/Accept.png"
                                OnClientClick="return IsSelectedItem('تایید گروهی');" OnClick="BtnAccept_Click" />
                        </div>

                        <div style="padding: 10px">
                            <asp:ImageButton ID="BtnRejectGrp" runat="server" ImageUrl="~/images/kartableAction/Reject.png"
                                OnClientClick="return IsSelectedItem('رد گروهی');" OnClick="BtnReject_Click" />
                        </div>
                    </td>
                    <td valign="top" align="center">
                        <div class="Captionkartable">
                            آمار درخواستها
                        </div>
                        <div dir="rtl" style="width: 100%; background-color: #eeeeee; padding-top: 10px; height: 100%">
                            <div runat="server" id="trNormalRequest" valign="top">
                                <asp:Label ID="lblNormalRequestCnt" runat="server" Text="0 درخواست" ToolTip="درخواستهاي عادي" Font-Size="Small" Font-Bold="True"></asp:Label>
                                <img alt="درخواستهاي عادي" class="style2" src="../images/requestStatus/Normal.png" />
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <PT:GridViewEx ID="GrdList" runat="server" Style="width: 100%" AutoGenerateColumns="False"
                BorderColor="Black" OnDataSourceRequested="GrdList_DataSourceRequested" AllowPaging="True"
                AllowSorting="True" OnRowDataBound="GrdList_RowDataBound" CssClass="RedDatagrid"
                EnableModelValidation="True" OnDataBound="GrdList_DataBound" AlternatingRowStyle-BorderColor="Black">
                <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی"
                    Mode="NumericFirstLast" />
                <FooterStyle CssClass="RedDatagridFooter" />
                <Columns>
                    <asp:TemplateField HeaderText="انتخاب" ItemStyle-HorizontalAlign="Center">
                        <EditItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="false" onclick="javascript:HighlightRow(this);" />
                        </EditItemTemplate>
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkAll" onclick="javascript:SelectAllCheckboxes(this);" runat="server"
                                AutoPostBack="false" ToolTip="Select/Deselect All"></asp:CheckBox>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" onclick="javascript:HighlightRow(this);" runat="server"
                                AutoPostBack="false"></asp:CheckBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="RequestsID" HeaderText="شماره" SortExpression="RequestsID">
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EMP_NO" HeaderText="شماره کارت" SortExpression="EMP_NO">
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Employee" HeaderText="نام کارمند" SortExpression="Employee">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TITLE" HeaderText="عنوان" SortExpression="TITLE">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StartDate" HeaderText="تاریخ" SortExpression="StartDate">
                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Duration" HeaderText="مدت/ساعت" SortExpression="Duration">
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Submitted" HeaderText="درخواست کننده" SortExpression="Submitted">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="STATUS" HeaderText="وضعیت" SortExpression="STATUS" />
                    <asp:BoundField DataField="Approval" HeaderText="رد/تایید کننده" SortExpression="Approval" />
                    <asp:BoundField DataField="CurManager" HeaderText="مدیر" SortExpression="CurManager" />
                    <asp:BoundField DataField="ApprovalDate" HeaderText="تاریخ تایید/رد" SortExpression="ApprovalDate" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button CssClass="btnGrd" ID="BtnOk" Text="بررسی"
                                runat="server" OnClick="BtnOk_Click" ToolTip='<%# "بررسی" + Eval("RequestsID") %>' CommandArgument='<%# Eval("RequestsID") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نمایش">
                        <ItemTemplate>
                            <img id="BtnPrint" class="btnGrd" src="../images/view.png" alt="<%# Eval("RequestsID")%>"
                                onclick="showPrint('<%# Eval("RequestsID")%>')" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                <HeaderStyle CssClass="RedDatagridHeader" />
                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                <RowStyle CssClass="RedDatagridItem" />
            </PT:GridViewEx>
            <custom:Pager ID="custPager" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center"></td>
    </tr>
</table>
