<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="ManageParallelApprove.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.ManageParallelApprove" %>

<%@ Register Src="~/UC/SearchEmp.ascx" TagName="UC_SearchEmp" TagPrefix="uc1" %>
<%@ Register Src="../UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>شرکت دنیای پردازش :: تعریف کارشناس جهت تایید موازی</title>

    <style>
        .tbRadio {
            width: 100%;
            font-size: 15px;
            background-color: whitesmoke;
            padding: 10px;
        }

        .tdEditor {
            border: 1px;
            border-color: black;
            border-style: solid;
            background-color: wheat;
            padding: 10px;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="PnlprogrammaticPopup" runat="server">
        <div id="progressBackgroundFilter">
        </div>
        <div id="Modalreq">
            <asp:Panel ID="Panel6" runat="server" Style="z-index: 20;">
                <asp:Panel ID="Panel7" runat="server" BorderStyle="Solid" BorderWidth="2px" BorderColor="black">
                    <table style="width: 100%; background-color: White">
                        <tr>
                            <td style="width: 30px">
                                <asp:ImageButton runat="server" ID="BtnExit" ImageUrl="~/images/BtnCancel.png" ToolTip="خروج"
                                    OnClick="BtnExit_Click" />
                            </td>
                            <td align="center">سیستم گردش کار
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="panSearchEmployee" runat="server" BackColor="#0B3D73"
                    ForeColor="whitesmoke" BorderWidth="2px" BorderColor="black" BorderStyle="Solid">
                    <uc1:UC_SearchEmp ID="UC_SearchEmp1" runat="server" />
                </asp:Panel>
            </asp:Panel>
        </div>
    </div>
    <div style="background-color: LightSteelBlue; width: 100%;">
        <br />
        <div style="background: whitesmoke">
            <asp:RadioButtonList ID="rblAccessDomain" runat="server" OnSelectedIndexChanged="rblAccessDomain_SelectedIndexChanged" RepeatColumns="2" Width="100%" AutoPostBack="True">
                <asp:ListItem Value="0" Selected="True">کارشناس موازی مجوز ها</asp:ListItem>
                <asp:ListItem Value="1">کارشناس موازی بخشها </asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <br />

        <div id="divParallelForCards" runat="server">
            <table class="tdEditor">
                <tr>
                    <td>کلیه مجوزهای 
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbCards" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbCards_SelectedIndexChanged" />
                    </td>
                    <td>
                        <asp:Label ID="lblUp" runat="server" Text="بالای"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="EditLimitDuration" runat="server" Height="22px" Style="margin-right: 2px"
                            ValidationGroup="t1" Width="30px">1</asp:TextBox>
                        <ACT:MaskedEditExtender ID="EditLimitDuration_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False"
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                            CultureTimePlaceholder="" Enabled="True" Mask="999" TargetControlID="EditLimitDuration">
                        </ACT:MaskedEditExtender>
                    </td>
                    <td>
                        <asp:Label ID="lblRequire" runat="server" Text="روز نیاز به تایید "></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbEmployee" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbEmployee_SelectedIndexChanged" />

                        <asp:Button runat="server" ID="showModalPopup" Text="..." ToolTip="جستجو و انتخاب پرسنل"
                            OnClick="showModalPopupServerOperatorButton_Click" />
                    </td>
                    <td>به نمایندگی از بخش
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbSection" runat="server" />
                    </td>
                    <td>از تاریخ
                    </td>
                    <td>
                        <uc2:DatePicker ID="EditFromDate" runat="server" />
                    </td>
                    <td>دارد
                    </td>
                </tr>
                <tr>
                    <td colspan="11">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" />
                    </td>
                    <td colspan="3">
                        <asp:Button ID="btnSaveForCards" runat="server" CssClass="btn" Text="ثیت" OnClick="btnSaveForCards_Click" />
                    </td>
                </tr>
            </table>

            <br />

            <div style="text-align: center">
                <PT:GridViewEx ID="GrdParallelApprove" runat="server" Style="width: 100%" Caption="مجوزهای روزانه ، دارای امکان تایید دوم"
                    AutoGenerateColumns="False" OnDataSourceRequested="GrdParallelApprove_DataSourceRequested"
                    AllowPaging="True" AllowSorting="True" PageSize="20" CssClass="RedDatagrid"
                    EnableModelValidation="True"
                    OnRowDeleting="GrdParallelApprove_RowDeleting"
                    OnSelectedIndexChanged="GrdParallelApprove_SelectedIndexChanged" DataKeyNames="CardNo,SecNo,EmpNo,DateModified,LimitDuration,FullName">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                        NextPageText="بعدی" PreviousPageText="قبلی" PageButtonCount="15" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <Columns>
                        <asp:BoundField DataField="EmpNo" HeaderText="شماره کارت" SortExpression="EmpNo">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FullName" HeaderText="کارشناس تایید کننده" SortExpression="FullName" />
                        <asp:BoundField DataField="TITLE" HeaderText="مجوز نیاز با تایید موازی" SortExpression="TITLE" />
                        <asp:BoundField DataField="sectionName" HeaderText="بخش معرفی کننده" SortExpression="sectionName" />
                        <asp:BoundField DataField="LimitDuration" HeaderText="محدودیت تایید" SortExpression="LimitDuration">
                            <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DateModifiedFa" HeaderText="تاریخ شروع" SortExpression="DateModified" />

                        <asp:CommandField ButtonType="Button" SelectText="ویرایش" ShowSelectButton="True">
                            <ItemStyle Width="60px" />
                        </asp:CommandField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="حذف" OnClientClick="return confirm_delete();" />
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <SelectedRowStyle CssClass="RedDatagridSelected" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                </PT:GridViewEx>
            </div>
        </div>
        <div id="divParallelForSection" runat="server">

            <table class="tdEditor">
                <tr>
                    <td>کلیه مجوزهای بخش&nbsp; 
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSection" runat="server" />
                    </td>

                    <td>نیاز به تایید
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEmpNo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEmpNo_SelectedIndexChanged" />
                        <asp:Button runat="server" ID="btnSelectEmpForSection" Text="..." ToolTip="جستجو و انتخاب پرسنل" OnClick="btnSelectEmpForSection_Click" />
                    </td>
                    <td>از تاریخ
                    </td>
                    <td>
                        <uc2:DatePicker ID="EditFromDateSection" runat="server" />
                    </td>
                    <td>دارد
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblError2" runat="server" Text="" ForeColor="Red" />
                    </td>
                    <td colspan="1">
                        <asp:Button ID="btnSaveSectionParallelApprove" runat="server" Text="ثیت" CssClass="btn" OnClick="btnSaveSectionParallelApprove_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <div style="text-align: center">
                <PT:GridViewEx ID="grdSectionParallelApprove" runat="server" Style="width: 100%" Caption="بخش های دارای امکان تایید دوم"
                    AutoGenerateColumns="False" OnDataSourceRequested="grdSectionParallelApprove_DataSourceRequested"
                    AllowPaging="True" AllowSorting="True" PageSize="20" CssClass="RedDatagrid"
                    EnableModelValidation="True"
                    OnRowDeleting="grdSectionParallelApprove_RowDeleting"
                    OnSelectedIndexChanged="grdSectionParallelApprove_SelectedIndexChanged" DataKeyNames="Sec_No,WF_ParallelApproveEmp_No,FullName,WF_ParallelApproveStartDate">
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="اولین" LastPageText="آخرین"
                        NextPageText="بعدی" PreviousPageText="قبلی" PageButtonCount="15" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="RedDatagridItem" />
                    <Columns>
                        <asp:BoundField DataField="Sec_No" HeaderText="کد بخش" SortExpression="Sec_No">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Title" HeaderText="بخش" SortExpression="Title" />
                        <asp:BoundField DataField="WF_ParallelApproveEmp_No" HeaderText="شماره کارت" SortExpression="WF_ParallelApproveEmp_No">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FullName" HeaderText="کارشناس تایید کننده" SortExpression="FullName" />
                        <asp:BoundField DataField="WF_ParallelApproveStartDateFa" HeaderText="تاریخ شروع" SortExpression="WF_ParallelApproveStartDate" />
                        <asp:CommandField ButtonType="Button" SelectText="ویرایش" ShowSelectButton="True">
                            <ItemStyle Width="60px" />
                        </asp:CommandField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="حذف" OnClientClick="return confirm_delete();" />
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <SelectedRowStyle CssClass="RedDatagridSelected" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                </PT:GridViewEx>
            </div>
        </div>
    </div>
</asp:Content>
