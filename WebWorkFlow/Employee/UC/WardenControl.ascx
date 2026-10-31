<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.WardenControl"
    CodeBehind="WardenControl.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc" %>
<%@ Register Src="~/UC/Pager.ascx" TagName="Pager" TagPrefix="custom" %>
<style type="text/css">
    .style1 {
        width: 100%;
    }
</style>
<body class="bd" dir="rtl">
    <div id="Pan_Container" runat="server" visible="false">
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
    <table style="background-color: LightSteelBlue; width: 100%">
        <caption>
            تمامی درخواست ها</caption>
        <tr>
            <td width="35%">نوع عملیات :<asp:DropDownList ID="EditOperation" runat="server" CssClass="Ddl" AutoPostBack="True"
                OnSelectedIndexChanged="EditOperation_SelectedIndexChanged">
            </asp:DropDownList>
                <asp:Literal ID="ltlCount" runat="server" Text="0" Visible="false" />
                <asp:DropDownList ID="EditCardNo" runat="server" CssClass="Ddl" AutoPostBack="True"
                    OnSelectedIndexChanged="EditCardNo_SelectedIndexChanged" Width="150px">
                </asp:DropDownList>
            </td>
            <td align="center" nowrap="nowrap" width="35%">بخش :
                <asp:DropDownList ID="EditSection" runat="server" CssClass="Ddl" AutoPostBack="True"
                    OnSelectedIndexChanged="EditOperation_SelectedIndexChanged" Width="70%">
                </asp:DropDownList>
            </td>
            <td align="center" valign="top" width="30%">
                <asp:Literal ID="ltlRemoved" runat="server" Visible="False" Text="0" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center" align="left" colspan="3">
                <table id="tblsearch" class="style1" dir="rtl">
                    <tr>
                        <td align="center">وضعیت بررسی مدیر : <asp:DropDownList ID="EditStatus" runat="server" CssClass="Ddl" AutoPostBack="True"
                    OnSelectedIndexChanged="EditStatus_SelectedIndexChanged">
                    <asp:ListItem Value="0">ارسال شده</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">تایید شده</asp:ListItem>
                    <asp:ListItem Value="2">رد شده</asp:ListItem>
                    <asp:ListItem Value="3">ارجاع شده</asp:ListItem>
                            <asp:ListItem Value="5">ابطال شده</asp:ListItem>
                    <asp:ListItem Value="4">همه</asp:ListItem>
                </asp:DropDownList>
                        </td>
                        <td align="center">وضعیت بررسی بازرس : <asp:DropDownList ID="EditIsWardenCheck" runat="server" CssClass="Ddl" AutoPostBack="True"
                    OnSelectedIndexChanged="EditStatus_SelectedIndexChanged">
                    <asp:ListItem Value="0" Selected="True">بررسی نشده</asp:ListItem>
                    <asp:ListItem Value="1">بررسی شده</asp:ListItem>
                    <asp:ListItem Value="4">همه</asp:ListItem>
                </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">ش&nbsp; پرسنلی :
                            <asp:TextBox ID="EditEmpNo" runat="server" Width="250px"></asp:TextBox>
                        </td>
                        <td align="center">نام :
                            <asp:TextBox ID="EditEmpName" runat="server" Width="250px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="BtnSearch" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                OnClick="BtnSearch_Click" Width="20px" ToolTip="جستجوی شماره پرسنلی - نام خانوادگی - نا" />
                        </td>
                    </tr>
                    <tr id="DivSearch" runat="server">
                        <td align="center">
                            <uc:DatePicker ID="EditFromDate" runat="server" Caption="از :" />
                        </td>
                        <td align="center">
                            <uc:DatePicker ID="EditToDate" runat="server" Caption="تا :" />
                        </td>
                        <td>
                            <asp:ImageButton ID="BtnSaveExcel" runat="server" Height="20px" ImageUrl="~/images/excel.png"
                                OnClick="BtnSaveExcel_Click" Width="16px" ToolTip="خروجی Excel" PostBackUrl="~/Employee/WardenControl.aspx" />
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="right">
                <PT:GridViewEx ID="GrdRequestArchive" runat="server" Style="width: 100%" AllowPaging="true"
                    AllowSorting="True" AutoGenerateColumns="False" OnDataSourceRequested="GrdRequestArchive_DataSourceRequested"
                    DataKeyNames="RequestsID,Type" OnRowDataBound="GrdRequestArchive_RowDataBound" Caption="لیست درخواستها"
                    EnableModelValidation="True" OnRowCommand="GrdRequestArchive_RowCommand" CssClass="RedDatagrid" BorderStyle="Solid" BorderWidth="1px">
                    <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="BtnOk" runat="server" Text="مشاهده" OnClick="BtnOk_Click"
                                    ToolTip='<%# "انتخاب درخواست" + Eval("RequestsID") %>' />
                            </ItemTemplate>
                            <ItemStyle Width="70px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="RequestsID" HeaderText="RequestsID" SortExpression="RequestsID"
                            Visible="False" />
                        <asp:BoundField DataField="EMP_NO" HeaderText="ش کارت" SortExpression="EMP_NO">
                            <ItemStyle Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TITLE" HeaderText="عنوان" SortExpression="TITLE" />
                        <asp:BoundField DataField="Employee" HeaderText="نام کارمند" SortExpression="Employee" />
                        <asp:BoundField DataField="StartDate" HeaderText="تاریخ ثبت" SortExpression="StartDate">
                            <ItemStyle Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SubmittedDate" HeaderText="تاریخ ارسال " SortExpression="SubmittedDate">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Duration" HeaderText="ساعت/مدت" SortExpression="Duration">
                            <ItemStyle Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="BtnShowIdea" runat="server" Text="نظر" OnClick="BtnShowIdea_Click"
                                    ToolTip='<%# "مشاهده نظر مدیر\n شماره درخواست :" + Eval("RequestsID")+"\n تعداد نظر : " +Eval("ReviewsCount")%>' />
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="STATUS" HeaderText="وضعیت" SortExpression="STATUS">
                            <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Submitted" HeaderText="ارسال کننده" SortExpression="Submitted" />
                        <asp:BoundField DataField="Approval" HeaderText="رد/تایید کننده" SortExpression="Approval" />
                        <asp:BoundField DataField="CurManager" HeaderText="مدیر" SortExpression="CurManager" />
                        <asp:BoundField DataField="ApprovalDate" HeaderText="تاریخ تایید/رد" SortExpression="ApprovalDate">
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="BtnIsWardenCheck" runat="server" CommandName="IsWardenCheck"
                                    CommandArgument='<%# Eval("RequestsID") %>' />
                            </ItemTemplate>
                            <ItemStyle Width="30px" />
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
                </PT:GridViewEx>
                <br />
                <custom:Pager ID="custPager" runat="server" />
            </td>
        </tr>
    </table>
</body>
