<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.RequestsList"
    CodeBehind="RequestsList.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>


<style type="text/css">
    .style1 {
        text-align: left;
    }

    .style2 {
        width: 22px;
        height: 22px;
    }

    .span1 {
        margin-left: auto;
        margin-right: auto;
        width: 150px;
        font-weight: bold;
    }
    .tblStatistic {
        width: 100%;
        max-width: 600px;
        background-color: white;
        border: 1px solid;
        border-spacing: 0;
        border-collapse: collapse;
    }
    .tblStatistic td {        
        text-align: center;
        border: 1px black solid;
        
    }

    .Ddl {
    }
</style>
<script language="javascript" type="text/javascript" src="<%=ResolveUrl("~/Scripts/RequestList.js") %>"></script>

<div id="Pnl_Container" runat="server">
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
<table style="width: 100%;" bgcolor="LightSteelBlue">
    <caption>
        کارتابل</caption>
    <tr>
        <td valign="top" align="right">
            <table border="1" cellpadding="0" cellspacing="0" style="background-color: #eeeeee; width: 100%">
                <tr>
                    <td valign="top" style="width: 35%;">
                        <div class="Captionkartable">
                            درخواستهای قابل نمایش
                        </div>
                        <table id="tblsearch" dir="rtl" style="width: 100%;">
                            <tr>
                                <td colspan="3" style="width: 100%; text-align: center">
                                    <asp:Label ID="lblStatus" runat="server" BackColor="#E6F2FF" Font-Bold="True" ForeColor="Red" BorderColor="Black" BorderStyle="Groove" BorderWidth="1px" Font-Names="tahoma" Font-Size="Medium"
                                        Style="padding: 10px; width: 93%; text-align: center"></asp:Label>
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
                                <td nowrap="nowrap" colspan="3">
                                    <asp:CheckBox ID="chbShowRemoveByPwkara" Text="نمایش مجوزهای تایید شده ای که در واحد حضور غیاب حذف شده"
                                        runat="server" AutoPostBack="True" OnCheckedChanged="chbShowRemoveByPwkara_CheckedChanged" />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" class="style1" title="شماره یا نام کارمند یا شماره درخواست">شماره یا نام کارمند:
                                </td>
                                <td>
                                    <asp:TextBox ID="EditEmpInfo" runat="server" Width="190px"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:ImageButton ID="BtnSearchEmp" runat="server" BorderWidth="0px" ImageAlign="TextTop"
                                        ImageUrl="~/images/icon_find.GIF" OnClick="BtnSearchEmp_Click" ToolTip="جستجو بر اساس تاریخ ثبت درخواست"
                                        Width="20px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left">تاریخ درخواست:
                                </td>
                                <td colspan="2">
                                    <div style="float: right">
                                        <uc1:DatePicker ID="EditFromDate" runat="server" Edit-Width="58px" />
                                    </div>
                                    <div style="float: left;">
                                        <uc1:DatePicker ID="EditToDate" runat="server" Caption="تا :" Edit-Width="58px" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" align="center" runat="server" id="tdAction" style="width: 100px">
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
                        <div style="padding: 10px">
                            <asp:ImageButton ID="BtnMoveUpGrp" runat="server" ImageUrl="~/images/kartableAction/MoveUp.png"
                                OnClientClick="return IsSelectedItem('ارجاع به بالا گروهی');" OnClick="BtnMoveUp_Click" />
                        </div>
                    </td>

                    <td valign="top" align="center">
                        <div class="Captionkartable">
                            آمار درخواستها
                        </div>
                        <div dir="rtl" style="width: 100%; background-color: #eeeeee; padding-top: 10px; height: 140px; overflow: auto">
                            <asp:CheckBox runat="server" ID="chbShowToday" Text="نمایش آمار برای روز جاری" Checked="True" AutoPostBack="True" OnCheckedChanged="chbShowToday_CheckedChanged"  />
                            <table  runat="server" id="tblStatistic" class="tblStatistic">
                                <tr class="RedDatagridHeader">
                                    <td>عنوان</td>
                                    <td style="width: 70px; text-align: center">بررسی نشده</td>
                                    <td style="width: 70px; text-align: center">تعداد</td>
                                    <td style="width: 70px; text-align: center">تایید شده</td>
                                    <td style="width: 70px; text-align: center">تعداد</td>
                                </tr>
                            </table>

                        </div>
                        <div style="margin-top: 5px">
                            <table runat="server" id="tblLimiOverTime" style="background-color: whitesmoke; border: thin solid #000000; min-width: 200px; margin-left: auto; margin-right: auto; font-size: 14px" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="BtnPreviousMonth" runat="server" ImageUrl="~/images/LeftBtnTop.jpg"
                                            OnClick="BtnPreviousMonth_Click" ForeColor="#AED7FF" OnClientClick="ShowContextMenu();" Height="20px" />
                                    </td>
                                    <td style="height: 20px; min-width: 100px; background-color: #F3F3F3; text-align: center">
                                        <asp:Label ID="lblMonth" runat="server" Text="فروردین 1390"
                                            CssClass="span1"
                                            ForeColor="black"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="BtnNextMonth" runat="server" ImageUrl="~/images/RightBtnTop.jpg"
                                            OnClick="BtnNextMonth_Click" OnClientClick="ShowContextMenu();" Height="20px" />
                                    </td>
                                    <td class="RedDatagridHeader">
                                        <asp:Label runat="server" ID="lblLimitOverTimePerSection"></asp:Label>
                                    </td>
                                </tr>

                            </table>
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
                EnableModelValidation="True" AlternatingRowStyle-BorderColor="Black" OnDataBound="GrdList_DataBound">
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
                    <asp:BoundField DataField="EmployeeName" HeaderText="نام کارمند" SortExpression="EmployeeName">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TITLE" HeaderText="عنوان" SortExpression="TITLE">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StartHour" HeaderText="ساعت" SortExpression="StartHour">
                        <ItemStyle HorizontalAlign="Center" Width="55px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StartDate" HeaderText="تاریخ" SortExpression="StartDate">
                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="توضیحات" SortExpression="Description">
                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Duration" HeaderText="مدت/ساعت" SortExpression="Duration">
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SubmittedFullName" HeaderText="درخواست کننده" SortExpression="SubmittedFullName">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="btnGrd" ID="BtnOk" ImageUrl="~/images/requestStatus/Comment.png" CommandArgument='<%# Eval("RequestsID") %>'
                                runat="server" OnClick="BtnOk_Click" ToolTip='<%# "نظر مدیر\n شماره درخواست :" + Eval("RequestsID")%>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="25px" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" HeaderText="گروه" SortExpression="ReqStatus">
                        <ItemTemplate>
                            <asp:Image CssClass="btnGrdGroup" ID="BtnStatus" runat="server" ImageUrl="~/images/requestStatus/Normal.png"
                                ToolTip='<%# Eval("ReqStatus")%>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نمایش">
                        <ItemTemplate>
                            <img id="BtnPrint" class="btnGrd" src="../images/view.png" alt="<%# Eval("RequestsID")%>"
                                onclick="showPrint('<%# Eval("RequestsID")%>')" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="کارشناس" SortExpression="ParallelCount">
                        <ItemTemplate>
                            <asp:Image CssClass="btnGrdGroup" ID="BtnParallelState" runat="server" ImageUrl="~/images/requestStatus/Normal.png"
                                ToolTip='<%# Eval("ParallelCount")%>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="گردش">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="btnGrd" ID="BtnFlow" runat="server" Text="گردش" OnClick="BtnFlow_Click"
                                CommandArgument='<%# Eval("RequestsID") %>' ToolTip="نمایش گردش" ImageUrl="~/images/Flow.png" />
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="SubmittedDate" HeaderText="تاریخ ثبت" SortExpression="SubmittedDate">
                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:BoundField>
                </Columns>
                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                <HeaderStyle CssClass="RedDatagridHeader" />
                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                <RowStyle CssClass="RedDatagridItem" />
            </PT:GridViewEx>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center"></td>
    </tr>
</table>

