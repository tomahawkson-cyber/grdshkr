<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.Requests"
    CodeBehind="Requests.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc" %>
<style type="text/css">
    .style1 {
        width: 170px;
        display: none;
        position: absolute;
        background-color: #B6B6B6;
        text-align: center;
        border: 1px #000000 solid;
    }
</style>
<script language="javascript" type="text/javascript">

    function ConfirmIsDelete() {
        var chekedCount = 0;
        var tGrid = document.getElementById('<%= GrdRequestArchive.ClientID%>');
        if (tGrid != null) {
            var elm = tGrid.getElementsByTagName('INPUT');

            for (var i = 0; i < elm.length; i++) {
                if (elm[i].type == "checkbox" && elm[i].id != 'ctl00_ContentPlaceHolder1_Requests1_GrdRequestArchive_ctl01_chkAll')
                    if (elm[i].checked)
                        chekedCount = chekedCount + 1;
            }
        }

        if (chekedCount > 0)
            return confirm('آیا با حذف درخواستهای انتخابی موافقید؟');
        else {
            jAlert('درخواستی انتخاب نشده!');
            return false;
        }
    }

</script>
<table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
    <tr>
        <td valign="top" align="center">
            <div id="PnlprogrammaticPopup" runat="server">
                <div id="progressBackgroundFilter">
                </div>
                <div id="Modalreq">
                    <div style="cursor: pointer; background-color: #DDDDDD; border: solid 1px Gray; color: Black; text-align: center">
                        سیستم گردش کار
                    </div>
                    <table width="100%">
                        <tr>
                            <td height="20" align="center" style="background-color: #ffecec">
                                <asp:Label ID="LblDesc" runat="server" Text="salam" ToolTip=""></asp:Label>
                            </td>
                        </tr>
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
            <table bgcolor="LightSteelBlue" style="width: 100%;">
                <caption>
                    <asp:Label ID="LblReqCaption" runat="server" Text="تمامی درخواستها"></asp:Label>
                </caption>
                <tr>
                    <td style="text-align: right;">
                        <asp:ImageButton ID="BtnAddRequest" runat="server" ImageUrl="~/images/add.png" ToolTip="ثبت درخواست جدید"
                            OnClick="BtnAdd_Click" CssClass="btnHeader" />
                        
                        <asp:ImageButton ID="BtnDeleteRequest" runat="server" ImageUrl="~/images/delete.png" CssClass="btnHeader"
                            ToolTip="حذف مجوزهای انتخاب شده" OnClientClick="return ConfirmIsDelete();" OnClick="BtnDeleteRequest_Click" />

                        <asp:ImageButton ID="BtnRefresh" runat="server" ImageUrl="~/images/Refresh.png" ToolTip="به روز رسانی"
                            OnClick="BtnRefresh_Click" CssClass="btnHeader"  />
                    </td>
                    <td style="text-align: right; white-space: nowrap;">
                        <asp:Label ID="lblCards" runat="server" Text="نوع مجوز :"></asp:Label>
                        <asp:DropDownList ID="EditCards" runat="server" CssClass="Ddl" Width="70%" OnSelectedIndexChanged="EditCards_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: right; white-space: nowrap;">وضعیت :
                        <asp:DropDownList ID="EditStatus" runat="server" CssClass="Ddl" AutoPostBack="True"
                            OnSelectedIndexChanged="EditStatus_SelectedIndexChanged">
                            <asp:ListItem Value="0">ارسال شده</asp:ListItem>
                            <asp:ListItem Value="1">تایید شده</asp:ListItem>
                            <asp:ListItem Value="2">رد شده</asp:ListItem>
                            <asp:ListItem Value="3">همه</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: right">
                        <asp:Button ID="BtnChangeView" runat="server" CssClass="btnHeader" OnClick="BtnChangeView_Click"
                            Text=" مجوزهای شخصی" />
                    </td>
                    <td style="text-align: right">
                        <uc:DatePicker ID="EditFromDate" runat="server" Caption="از:" />
                    </td>
                    <td style="text-align: right">
                        <uc:DatePicker ID="EditToDate" runat="server" Caption="تا:" />
                    </td>
                    <td style="text-align: right">
                        <asp:ImageButton ID="BtnSearchEmp" runat="server" ImageUrl="~/images/icon_find.GIF"
                            OnClick="BtnSearchEmp_Click" BorderWidth="0px" ToolTip="جستجو" />
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <hr />
                        <PT:GridViewEx ID="GrdRequestArchive" runat="server" Style="width: 100%" AllowPaging="True"
                            AllowSorting="True" AutoGenerateColumns="False" BorderColor="LightGray" OnDataSourceRequested="GrdRequestArchive_DataSourceRequested"
                            DataKeyNames="RequestsID,Type" OnRowDataBound="GrdRequestArchive_RowDataBound"
                            CssClass="RedDatagrid" BorderStyle="Solid" BorderWidth="1px" EnableModelValidation="True"
                            HorizontalAlign="Center">
                            <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی"
                                Mode="NumericFirstLast" />
                            <FooterStyle CssClass="RedDatagridFooter" />
                            <RowStyle CssClass="RedDatagridItem" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button CssClass="btn" ID="BtnEditRequest" runat="server" Text="ویرایش" OnClick="BtnOk_Click"
                                            ToolTip='<%# "انتخاب درخواست" + Eval("RequestsID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RequestsID" HeaderText="شماره" SortExpression="RequestsID" />
                                <asp:BoundField DataField="EMP_NO" HeaderText="شماره پرسنلی" SortExpression="EMP_NO" />
                                <asp:BoundField DataField="TITLE" HeaderText="عنوان" SortExpression="TITLE" />
                                <asp:BoundField DataField="EmployeeName" HeaderText="نام کارمند" SortExpression="EmployeeName" />
                                <asp:BoundField DataField="StartHour" HeaderText="ساعت" SortExpression="StartHour" />
                                <asp:BoundField DataField="StartDate" HeaderText="تاریخ " SortExpression="StartDate">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Duration" HeaderText="مدت/ساعت" SortExpression="Duration">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="False" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button CssClass="btn" ID="BtnShowIdea" runat="server" Text='<%#Eval("ReviewsCount")+" نظر" %>'
                                            OnClick="BtnShowIdea_Click" ToolTip='<%# "مشاهده نظر مدیر\n شماره درخواست :" + Eval("RequestsID")+"\n تعداد نظر : " +Eval("ReviewsCount")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Requested_Time" HeaderText="تایید شده" SortExpression="Requested_Time">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="انتخاب">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkAll" onclick="javascript:SelectAllCheckboxes(this);" runat="server"
                                            AutoPostBack="false" ToolTip="Select/Deselect All"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" onclick="javascript:HighlightRow(this);" runat="server"
                                            AutoPostBack="false"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IsApproved" HeaderText="وضعیت" SortExpression="IsApproved" />
                                <asp:BoundField DataField="Description" HeaderText="توضیحات" SortExpression="Description" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button CssClass="btn" ID="BtnRevoke" runat="server" Text="درخواست ابطال" OnClick="BtnRevoke_Click"
                                            CommandArgument='<%# Eval("RequestsID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button CssClass="btn" ID="BtnFlow" runat="server" Text="گردش" OnClick="BtnFlow_Click"
                                            CommandArgument='<%# Eval("RequestsID") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="نمایش">
                                    <ItemTemplate>
                                        <img id="BtnPrint" class="btnGrd" src="../images/view.png" alt="<%# Eval("RequestsID")%>"
                                            onclick="showPrint('<%# Eval("RequestsID")%>')" />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
