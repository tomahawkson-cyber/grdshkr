<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.ShowManagerIdea"
    CodeBehind="ShowManagerIdea.ascx.cs" %>
<table dir="rtl" style="border: solid 1px black;width: 100%">
    <caption class="cap">
        نمایش نظرات مدیران
    </caption>
    <tr>
        <td width="40%" valign="top" runat="server" id="tdGrdEmployees">
            <PT:GridViewEx ID="GrdEmployees" runat="server" Style="width: 100%" EnableSortingAndPagingCallbacks="True"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="RedDatagrid"
                BorderColor="#E7E7FF" OnDataSourceRequested="GrdEmployees_DataSourceRequested"
                Caption="لیست مدیران" DataKeyNames="ID,RequestID,ReviewedByEmployeeID,Description,ReviewStatus,ReviewDate,Is_ShowPersonal,FullName"
                OnSelectedIndexChanged="GrdEmployees_SelectedIndexChanged">
                <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی"
                    Mode="NumericFirstLast" />
                <FooterStyle CssClass="RedDatagridFooter" />
                <Columns>
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/preview.jpg" SelectText="انتخاب"
                        ShowSelectButton="True" />
                    <asp:BoundField DataField="ReviewedByEmployeeID" HeaderText="شماره پرسنلی" SortExpression="ReviewedByEmployeeID">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FullName" HeaderText="نام" SortExpression="FullName">
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                <HeaderStyle CssClass="RedDatagridHeader" />
                <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                <RowStyle CssClass="RedDatagridItem" />
            </PT:GridViewEx>
        </td>
        <td width="80%" align="center" valign="top">
            <table width="100%">
                <tr>
                    <td valign="middle" dir="rtl">تاریخ اظهار نظر :&nbsp;&nbsp;
                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">نوع نظر
                            <asp:Panel ID="PanOpinion" runat="server" HorizontalAlign="Center" Width="80%" BorderColor="#66FFFF"
                                BorderStyle="Groove" BorderWidth="2px" Enabled="False">
                                <asp:RadioButton ID="RbNoAnswer" runat="server" Text="خنثی" ValidationGroup="Opinion"
                                    GroupName="Opinion" Checked="True" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RadioButton ID="RbAccept" runat="server" Text="تایید" ValidationGroup="Opinion"
                                    GroupName="Opinion" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RadioButton ID="RbReject" runat="server" Text="رد" ValidationGroup="Opinion"
                                    GroupName="Opinion" />
                            </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; نظر تایید کننده :&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:TextBox ID="EditDesc" runat="server" TextMode="MultiLine" Width="80%" Height="66px"
                            Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnClose" runat="server" Text="خروج" OnClick="btnClose_Click" />
        </td>
    </tr>
</table>
