<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true" CodeBehind="PrintSetting.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.PrintSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; background-color: LightSteelBlue;">
        <table style="width: 700px; margin: 0 auto;">
            <tr>
                <td style="text-align: left">نوع مجوز</td>
                <td style="text-align: right">
                    <asp:DropDownList ID="EditActions" runat="server" Width="200px"></asp:DropDownList></td>
                <td style="text-align: left">سربرگ
                </td>
                <td style="text-align: right">
                    <asp:TextBox ID="EditHeaderName" runat="server" Width="300px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: right">
                    <asp:TextBox ID="EditContext" runat="server" TextMode="MultiLine" Height="100px" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" />
                </td>
                <td colspan="1">
                    <asp:Button ID="btnNew" runat="server" Text="جدید" OnClick="btnNew_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="ذخیره" />
                </td>
            </tr>

        </table>
        <hr style="background-color: gray; height: 5px" />
        <asp:Repeater runat="server" ID="rptPritSetting" OnItemCommand="rptPritSetting_ItemCommand">
            <HeaderTemplate>
                <div class="cap" style="width: 800px; margin: 0 auto;">لیست تنظیمات چاپ مجوزها</div>
            </HeaderTemplate>
            <ItemTemplate>
                <div style="width: 800px; margin: 0 auto; background-color: whitesmoke">
                    <div style="height: 25px; padding: 10px;">
                        <div style="float: right; padding-left: 20px; width: 200px; line-height: 1.4; font-size: 13px">نوع مجوز :&nbsp;<%#Eval("Fdesc") %></div>
                        <div style="float: right; width: 300px; line-height: 1.4; font-size: 13px">سربرگ :&nbsp;<%#Eval("HeaderName") %></div>
                        <div style="float: left;">
                            <asp:LinkButton ID="Delete" runat="server" Text="حذف" CommandArgument='<%#Eval("ID") %>'
                                CommandName="Delete" OnClientClick="return confirm_delete();" CssClass="btn" Width="60px" Height="20px" Font-Size="14px" />
                            <asp:LinkButton ID="Edit" runat="server" Text="ویرایش"
                                CommandArgument='<%#Eval("ID") %>'
                                CommandName="Edit" CssClass="btn" Width="60px" Height="20px" Font-Size="14px" />
                        </div>
                    </div>
                    <div style="text-align: right; border: 1px solid gray; background-color: wheat; padding: 10px; line-height: 1.4; font-size: 13px; margin: 10px">
                        <%#Eval("Context") %>
                    </div>
                    <hr style="background-color: gray; height: 5px"></hr>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
