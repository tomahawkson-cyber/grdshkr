<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="ManageSignature.aspx.cs" Inherits="PW.WorkFlows.Web.Admin.ManageSignature" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="<%=ResolveUrl("~/Scripts/jquery.MultiFile.js") %>" type="text/javascript"></script>
    <style type="text/css">
        .fixed-cluster {
            display: block;
            max-height: 580px;
            overflow: hidden;
            width: 98%;
            text-align: center;
        }

        .app-cluster {
            background-color: #F7F7F7;
            color: #333333;
            display: table;
            padding-top: 20px;
            position: inherit;
        }

        .mcard {
            height: 110px;
            width: 110px;
        }

        .fa-card {
            background-color: #FFFFFF;
            border-radius: 4px 4px 4px 4px;
            box-shadow: 0 0 3px 3px rgba(128, 128, 128, 0.1);
            direction: rtl;
            display: table-cell;
            font-family: 'Droid-Naskh', 'Roboto',sans-serif;
            margin: 5px;
            position: relative;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="app-cluster fixed-cluster">
        <table width="100%">
            <tr>
                <td>
                    <asp:Button ID="btnSaveFromFolder" runat="server" Text="دریافت خودکار امضاها" OnClick="btnSaveFromFolder_Click" /><br />
                </td>
                <td>
                    <asp:Label ID="lblMessage" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="100%" colspan="2">
                    <asp:DataList ID="dtlist" runat="server" RepeatColumns="8" CellPadding="5" Width="100%">
                        <ItemTemplate>
                            <div class="fa-card mcard pull-left">
                                <asp:Image Width="100px" Height="100px" ID="Image1" ImageUrl='<%# String.Format("UC/ReadSignature.aspx?EmpNo={0}", Eval("EMP_NO").ToString()) %>'
                                    runat="server" />
                                <br />
                                <asp:Label ID="lblImageSrc" runat="server" Text='<%# String.Format("{0}", Eval("EmpName")) %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblCurrentPage" runat="server" Visible="true"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="cmdFirst" runat="server" Text=" << " OnClick="cmdFirst_Click" ToolTip="اولین" />
                    <asp:Button ID="cmdPrev" runat="server" Text=" < " OnClick="cmdPrev_Click" ToolTip="قبلی" />
                    <asp:Button ID="cmdNext" runat="server" Text=" > " OnClick="cmdNext_Click" ToolTip="بعدی" />
                    <asp:Button ID="cmdLast" runat="server" Text=" >> " OnClick="cmdLast_Click" ToolTip="آخرین" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
