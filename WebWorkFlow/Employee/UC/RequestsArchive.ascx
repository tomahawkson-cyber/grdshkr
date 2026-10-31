<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.RequestsArchive"
    CodeBehind="RequestsArchive.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc" %>
<style type="text/css">
    .Panel {
        background-color: #F2F2F2;
        position: absolute;
        z-index: 998;
        direction: ltr;
        right: 1px;
        left: 1px;
        width: 998px;
        height: 480px;
        margin-top: 2px;
        top: 133px;
    }
</style>
<body class="bd" dir="rtl">
    <div id="PnlprogrammaticPopup" runat="server">
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
                <tr>
                    <td height="10"></td>
                </tr>
            </table>
        </div>
    </div>
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
        <tr>
            <td valign="top" align="center">
                <table style="width: 100%;" bgcolor="LightSteelBlue">
                    <caption>
                        تمامی درخواستها</caption>
                    <tr id="trManager" runat="server">
                        <td align="right" style="text-align: left">
                            <asp:Label ID="lblChangeView" runat="server" Text="نوع ثبت : "></asp:Label>
                        </td>
                        <td align="right">
                            <asp:DropDownList ID="EditChangeView" runat="server" CssClass="Ddl" AutoPostBack="True"
                                Width="100px" OnSelectedIndexChanged="EditChangeView_SelectedIndexChanged">
                                <asp:ListItem Value="0">همه</asp:ListItem>
                                <asp:ListItem Value="1">از طرف پرسنل دیگر</asp:ListItem>
                                <asp:ListItem Value="2">شخصی</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left">
                            <asp:Label ID="lblManagerList" runat="server" Text="مدیران زیر مجموعه :"></asp:Label>
                        </td>
                        <td style="text-align: right">
                            <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="300px" AutoPostBack="True"
                                OnSelectedIndexChanged="EditEmpNo_SelectedIndexChanged" />
                        </td>
                        <td style="text-align: left" title="شماره یا نام کارمند یا شماره درخواست">شماره یا نام کارمند:</td>
                        <td style="text-align: right">
                            <asp:TextBox ID="EditEmpInfo" runat="server" Width="190px"></asp:TextBox>

                        </td>
                        <td style="text-align: center">
                            <asp:ImageButton ID="BtnSaveExcel" runat="server" Height="20px" ImageUrl="~/images/excel.png"
                                OnClick="BtnSaveExcel_Click" Width="16px" ToolTip="خروجی Excel" />

                        </td>
                    </tr>
                    <tr>
                        <td valign="top" nowrap="nowrap" style="text-align: left">وضعیت :
                        </td>
                        <td valign="top" nowrap="nowrap" style="text-align: right">
                            <asp:DropDownList ID="EditStatus" runat="server" CssClass="Ddl" AutoPostBack="True"
                                OnSelectedIndexChanged="EditStatus_SelectedIndexChanged" Width="100px">
                                <asp:ListItem Value="0">ارسال شده</asp:ListItem>
                                <asp:ListItem Value="1">تایید شده</asp:ListItem>
                                <asp:ListItem Value="2">رد شده</asp:ListItem>
                                <asp:ListItem Value="3">همه</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="center" valign="top" nowrap="nowrap" style="text-align: left">نوع عملیات :
                        </td>
                        <td align="center" valign="top" nowrap="nowrap" style="text-align: right">
                            <asp:DropDownList ID="EditOperation" runat="server" CssClass="Ddl" AutoPostBack="True"
                                OnSelectedIndexChanged="EditOperation_SelectedIndexChanged" Width="250px">
                            </asp:DropDownList>
                        </td>
                        <td align="center" valign="top" nowrap="nowrap" style="text-align: right">
                            <uc:DatePicker ID="EditFromDate" runat="server" Caption="از :" />
                        </td>
                        <td style="text-align: right">
                            <uc:DatePicker ID="EditToDate" runat="server" Caption="تا :" />
                        </td>
                        <td>
                            <asp:ImageButton ID="BtnSearch" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                                OnClick="BtnSearch_Click" Width="16px" ToolTip="جستجوی شماره پرسنلی - نام خانوادگی - نا" />
                            <asp:Literal ID="ltlRemoved" runat="server" Visible="False" Text="0" />
                            <asp:Literal ID="ltlCount" runat="server" Text="0" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <PT:GridViewEx ID="GrdRequestArchive" runat="server" Style="width: 100%" AllowPaging="True"
                                AllowSorting="True" AutoGenerateColumns="False" BorderColor="LightGray" OnDataSourceRequested="GrdRequestArchive_DataSourceRequested"
                                DataKeyNames="RequestsID,Type" OnRowDataBound="GrdRequestArchive_RowDataBound"
                                CssClass="RedDatagrid" BorderStyle="Solid" BorderWidth="1px">
                                <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی" />
                                <FooterStyle CssClass="RedDatagridFooter" />
                                <RowStyle CssClass="RedDatagridItem" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn" ID="BtnOk" runat="server" Text="مشاهده" OnClick="BtnOk_Click"
                                                ToolTip='<%# "انتخاب درخواست" + Eval("RequestsID") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="RequestsID" HeaderText="شماره" SortExpression="RequestsID" />
                                    <asp:BoundField DataField="EMP_NO" HeaderText="شماره پرسنلی" SortExpression="EMP_NO" />
                                    <asp:BoundField DataField="TITLE" HeaderText="عنوان" SortExpression="TITLE" />
                                    <asp:BoundField DataField="EmployeeName" HeaderText="نام کارمند" SortExpression="EmployeeName" />
                                    <asp:BoundField DataField="StartDate" HeaderText="تاریخ ثبت" SortExpression="StartDate">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SubmittedDate" HeaderText="تاریخ ارسال " SortExpression="SubmittedDate">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Duration" HeaderText="ساعت/مدت" SortExpression="Duration">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn" ID="BtnShowIdea" runat="server" Text='<%#Eval("ReviewsCount")+" نظر" %>'
                                                OnClick="BtnShowIdea_Click" ToolTip='<%# "مشاهده نظر مدیر\n شماره درخواست :" + Eval("RequestsID")+"\n تعداد نظر : " +Eval("ReviewsCount")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Requested_Time" HeaderText="تایید(ساعت/مدت)" SortExpression="Requested_Time">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ManagerName" HeaderText="نام مدیر" SortExpression="ManagerName" />
                                    <asp:BoundField DataField="IsApproved" HeaderText="وضعیت" SortExpression="IsApproved" />
                                </Columns>
                                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                                <HeaderStyle CssClass="RedDatagridHeader" />
                                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                            </PT:GridViewEx>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</body>
