<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.ShowFlow"
    CodeBehind="ShowFlow.ascx.cs" %>
<div id="divrequestId" runat="server" style="border: thin solid #000000; font-family: tahoma; font-size: large; font-weight: bold; background-color: #ECFFFF; text-align: center; padding: 10px; width: 225px">
</div>
<br />
<asp:Repeater ID="FlowRepeater" runat="server">
    <HeaderTemplate>
        <table style="border: 1px solid black; width: 350px">
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td style="text-align: center">
                <img src="../images/arrow_down.png" />
            </td>
        </tr>
        <tr style="background-color: #EBEFF0; font-size: larger">
            <td style="border-style: solid; border-width: medium; border-color: inherit; text-align: center;">
                <div style="float: left">
                    <asp:Image ID="ImgEmployee" runat="server" ImageUrl='<%#Eval("imgUrl") %>'
                        Style="border: thin solid #FF9966; background-color: #949494; width: 80px; margin: 5px;" ToolTip='<%#Eval("EMP_NO") %>' />
                </div>
                <div style="float: right; width: 240px; padding-top: 10px; font-weight: bold">
                    بخش : <%#Eval("fromSection") %>
                    <br />
                    نام :<%#Eval("fromEmpName") %>
                    <br />
                    سمت :<%#Eval("posTitle") %>
                    <br />
                    تاریخ :<%#Eval("DateMoveUpFa") %>
                    <br />
                    زمان :<%#Eval("TimeMoveUp") %>
                    <br />
                    وضعیت :<%#Eval("fstate") %>
                </div>
            </td>
        </tr>

    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<asp:Button ID="btnClose" runat="server" Text="خروج" OnClick="btnClose_Click" />
