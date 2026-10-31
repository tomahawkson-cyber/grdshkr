<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true" CodeBehind="DifrenceRequest.aspx.cs" Inherits="PW.WorkFlows.Web.Employee.DifrenceRequest" %>

<%@ Register Src="~/UC/DatePicker.ascx" TagPrefix="uc1" TagName="DatePicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;" bgcolor="LightSteelBlue">
        <caption>
            درخواستهای ساعتی بیش از حد مجاز بر اساس ترددهای جاری و بدون احتساب آیین نامه</caption>
        <tr>
            <td valign="top" align="right">
                <table width="100%" border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" style="width: 35%;">
                            <table id="tblsearch" dir="rtl" style="width: 100%; background-color: #eeeeee;"
                                bgcolor="White" cellspacing="0">
                                <tr>
                                    <td nowrap="nowrap" class="auto-style1">نوع عملیات :</td>
                                    <td>
                                        <asp:DropDownList ID="EditOperation" runat="server" AutoPostBack="True" CssClass="Ddl" OnSelectedIndexChanged="EditOperation_SelectedIndexChanged" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style1">شماره یا نام کارمند:
                                    </td>
                                    <td colspan="2">&nbsp;
                                        <asp:TextBox ID="EditEmpInfo" runat="server" Width="190px"></asp:TextBox>
                                    </td>
                                    <td rowspan="2" style="text-align: center">
                                        <asp:ImageButton ID="BtnSearchEmp" runat="server" BorderWidth="0px" ImageAlign="TextTop"
                                            ImageUrl="~/images/icon_find.GIF" OnClick="BtnSearchEmp_Click" ToolTip="جستجو بر اساس تاریخ ثبت درخواست"
                                            Width="20px" Height="18px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" class="auto-style1">بخش ها:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="EditSections" runat="server" CssClass="Ddl" AutoPostBack="True"
                                            OnSelectedIndexChanged="EditSections_SelectedIndexChanged" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="auto-style1">تاریخ درخواست:
                                    </td>
                                    <td>
                                        <uc1:DatePicker ID="EditFromDate" runat="server" />
                                    </td>
                                    <td>
                                        <uc1:DatePicker ID="EditToDate" runat="server" Caption="تا :" />
                                    </td>
                                </tr>
                            </table>
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
                    EnableModelValidation="True" AlternatingRowStyle-BorderColor="Black">
                    <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی"
                        Mode="NumericFirstLast" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <Columns>
                        <asp:BoundField DataField="RequestsID" HeaderText="شماره" SortExpression="RequestsID">
                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EMP_NO" HeaderText="شماره پرسنلی" SortExpression="EMP_NO">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EmployeeName" HeaderText="نام کارمند" SortExpression="EmployeeName">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TITLE" HeaderText="عنوان" SortExpression="TITLE">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StartHour" HeaderText="ساعت" SortExpression="StartHour">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StartDate" HeaderText="تاریخ" SortExpression="StartDate">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="توضیحات" SortExpression="Description">
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Duration" HeaderText="مدت درخواستی" SortExpression="Duration">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Duration" HeaderText="مدت مصرفی" SortExpression="PrimeryDuration">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
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
                    <RowStyle CssClass="RedDatagridItem" />
                </PT:GridViewEx>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center"></td>
        </tr>
    </table>
</asp:Content>
