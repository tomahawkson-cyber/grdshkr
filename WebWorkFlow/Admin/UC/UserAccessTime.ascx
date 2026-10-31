<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserAccessTime.ascx.cs"
    Inherits="PW.WorkFlows.Web.Admin.UC.UserAccessTime" %>
<table width="99%" cellpadding="2" cellspacing="2" dir="rtl">
    <tr>
        <td align="center" dir="ltr">
            <asp:GridView ID="gridViewTimes" runat="server" AutoGenerateColumns="False" GridLines="None"
                CellPadding="4" Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#333333" EnableModelValidation="True">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH24" runat="server" Text="24" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk24" Checked='<%# Eval("H24")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH23" runat="server" Text="23" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk23" Checked='<%# Eval("H23")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH22" runat="server" Text="22" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk22" Checked='<%# Eval("H22")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH21" runat="server" Text="21" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk21" Checked='<%# Eval("H21")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH20" runat="server" Text="20" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk20" Checked='<%# Eval("H20")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH19" runat="server" Text="19" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk19" Checked='<%# Eval("H19")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH18" runat="server" Text="18" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk18" Checked='<%# Eval("H18")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH17" runat="server" Text="17" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk17" Checked='<%# Eval("H17")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH16" runat="server" Text="16" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk16" Checked='<%# Eval("H16")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH15" runat="server" Text="15" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk15" Checked='<%# Eval("H15")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />                        
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH14" runat="server" Text="14" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk14" Checked='<%# Eval("H14")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH13" runat="server" Text="13" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk13" Checked='<%# Eval("H13")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH12" runat="server" Text="12" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk12" Checked='<%# Eval("H12")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH11" runat="server" Text="11" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk11" Checked='<%# Eval("H11")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH10" runat="server" Text="10" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk10" Checked='<%# Eval("H10")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH9" runat="server" Text="9" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk9" Checked='<%# Eval("H9")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH8" runat="server" Text="8" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk8" Checked='<%# Eval("H8")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH7" runat="server" Text="7" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk7" Checked='<%# Eval("H7")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH6" runat="server" Text="6" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk6" Checked='<%# Eval("H6")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH5" runat="server" Text="5" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk5" Checked='<%# Eval("H5")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH4" runat="server" Text="4" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk4" Checked='<%# Eval("H4")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH3" runat="server" Text="3" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk3" Checked='<%# Eval("H3")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH2" runat="server" Text="2" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk2" Checked='<%# Eval("H2")%>' />
                        </ItemTemplate>
                        <HeaderStyle BackColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton ID="LBtnH1" runat="server" Text="1" OnClick="LBtnHour_Click" Style="font-weight: bold"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk1" Checked='<%# Eval("H1")%>' />
                        </ItemTemplate><HeaderStyle BackColor="#EFF3FB" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:LinkButton runat="server" ID="btnGridAll" Text="برعکس" Width="50px" OnClick="btnGridAll_Click"></asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LBtnDayNo" runat="server" Text='<%#this.GetPersianWeekDate(Eval("DayNo").ToString())%>'
                                OnClick="LBtnDayNo_Click" Style="font-weight: bold">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
    </tr>
</table>
