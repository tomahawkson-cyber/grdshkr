<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Admin.SetAccessManager" Title="شرکت دنیای پردازش :: نمایش چارت سازمانی"
    CodeBehind="SetAccessManager.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: نمایش چارت سازمانی</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%; height: 100%;" cellpadding="0" cellspacing="0">
        <caption>
            نمایش چارت سازمانی</caption>
        <tr>
            <td align="center" valign="top">
                <table width="100%">
                    <tr>
                        <td valign="top" width="50%">
                            <table style="width: 100%; background-color: #6B696B; color: White;" border="1">
                                <tr>
                                    <td style="width: 100px" nowrap="nowrap">
                                        بخش
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" width="50%">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <asp:Panel runat="server" ScrollBars="Horizontal" Height="500px" ID="PanMain">
                    <table width="100%">
                        <tr>
                            <td valign="top" width="50%">
                                <PT:GridViewEx ID="GrdSection" runat="server" AutoGenerateColumns="False" Height="100%"
                                    Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="4" DataKeyNames="SEC_NO" ForeColor="Black" GridLines="Vertical"
                                    OnDataSourceRequested="GrdSection_DataSourceRequested" OnRowCancelingEdit="GrdSection_RowCancelingEdit"
                                    OnRowEditing="GrdSection_RowEditing" OnRowUpdating="GrdSection_RowUpdating" EnableModelValidation="True">
                                    <FooterStyle BackColor="#CCCC99" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="SEC_NO" SortExpression="SEC_NO" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSEC_NO" runat="server" Text='<%# Bind("SEC_NO") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="بخش" SortExpression="TITLE">
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("TITLE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#F7F7DE" />
                                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#6B696B" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </PT:GridViewEx>
                            </td>
                            <td valign="top" width="50%">
                                <asp:TreeView ID="TRVOrgChart" runat="server" ImageSet="Contacts" NodeIndent="10"
                                    OnSelectedNodeChanged="TRVOrgChart_SelectedNodeChanged" Font-Names="Arial" Font-Overline="False"
                                    Font-Size="8.25pt" Font-Underline="False" ShowLines="True">
                                    <ParentNodeStyle Font-Bold="True" ForeColor="#5555DD" />
                                    <HoverNodeStyle Font-Underline="False" />
                                    <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" VerticalPadding="0px" />
                                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
                                        NodeSpacing="0px" VerticalPadding="0px" />
                                </asp:TreeView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
