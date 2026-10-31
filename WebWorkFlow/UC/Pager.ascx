<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.UC.Pager"
    CodeBehind="Pager.ascx.cs" %>
<div style="font-size: 8pt; font-family: Tahoma; width: 500px; background-color: #ffecec"
    dir="rtl">
    <div id="right" style="float: right; width: 200px">
        <span>نمایش&nbsp;</span>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged"
            Width="50px">
            <asp:ListItem Text="1" Value="1"></asp:ListItem>
            <asp:ListItem Text="5" Value="5"></asp:ListItem>
            <asp:ListItem Text="10" Value="10" Selected="True"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
            <asp:ListItem Text="25" Value="25"></asp:ListItem>
            <asp:ListItem Text="50" Value="50"></asp:ListItem>
        </asp:DropDownList>
        <span>&nbsp;ردیف در هر صفحه</span>
    </div>
    <div id="left" style="float: left; width: 300px">
        <span>نمایش&nbsp;صفحه</span>
        <asp:DropDownList ID="ddlPageNumber" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageNumber_SelectedIndexChanged">
        </asp:DropDownList>
        <span>&nbsp;از</span>
        <asp:Label ID="lblShowRecords" runat="server"></asp:Label>
        <span>صفحه&nbsp;</span>
    </div>
</div>
