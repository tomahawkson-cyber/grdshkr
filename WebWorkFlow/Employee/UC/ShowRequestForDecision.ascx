<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.ShowRequestForDecision"
    CodeBehind="ShowRequestForDecision.ascx.cs" %>

<style type="text/css">
    .style1 {
        text-align: center;
    }
</style>
<body class="bd">
    <!-- Full Screen Div For Delete -->
    <div id="TBL_MSG" runat="server" visible="false" style="min-width: 250px; max-width: 500px">
        <div id="BackgroundFilter">
        </div>
        <div id="ModalMsg">
            <div style="cursor: pointer; background-color: #DDDDDD; border: solid 1px Gray; color: Black; text-align: center">
                سیستم گردش کار
            </div>
            <table id="TBL_MSG1" border="1" style="border: thin groove #800000; font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color: #C0C0C0; cursor: default; min-width: 250px">
                <tr>
                    <td dir="rtl" align="right" valign="middle" style="border-right-width: 0px; border-bottom-width: 0px;">
                        <asp:Label ID="lblConfirm" runat="server"> آیا با تایید موافقید؟</asp:Label>
                    </td>
                    <td dir="rtl" align="center" valign="middle" rowspan="2" style="border-left-width: 0px; width: 70px">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/msg_icon_1.png" />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom" style="height: 20px; border-right-width: 0px; border-top-width: 0px;">
                        <asp:Button ID="btn_cancelMSG" runat="server" Style="border-right: black 1px solid; border-top: black 1px solid; font-size: 9pt; border-left: black 1px solid; color: black; border-bottom: black 1px solid; font-family: tahoma; background-color: #ffffff"
                            Text="&nbsp;&#1582;&#1610;&#1585;&nbsp;" UseSubmitBehavior="False" OnClick="btn_cancelMSG_Click" />
                        &nbsp;
                        <asp:Button ID="btn_okMSG" runat="server" Style="border-right: black 1px solid; border-top: black 1px solid; font-size: 9pt; border-left: black 1px solid; color: black; border-bottom: black 1px solid; font-family: tahoma; background-color: #ffffff"
                            Text="&nbsp;&#1576;&#1604;&#1740;&nbsp;"
                            UseSubmitBehavior="False" OnClick="btn_okMSG_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!-- Full Screen Div For Delete -->
    <table bgcolor="LightSteelBlue" dir="rtl" border="1" bordercolor="black" style="width: 100%">
        <tr runat="server" id="trBtn">
            <td colspan="3">
                <table style="width: 100%; height: 50px">
                    <tr>
                        <td class="style1">
                            <asp:ImageButton ID="BtnAccept" runat="server" ImageUrl="~/images/kartableAction/Accept.png"
                                OnClick="BtnAccept_Click" />
                            <br />
                        </td>
                        <td class="style1">
                            <asp:ImageButton ID="BtnReject" runat="server" ImageUrl="~/images/kartableAction/Reject.png"
                                OnClick="BtnReject_Click" />
                        </td>
                        <td class="style1">
                            <asp:ImageButton ID="BtnReview" runat="server" ImageUrl="~/images/kartableAction/Comment.png"
                                OnClick="BtnReview_Click" />
                        </td>
                        <td align="center">
                            <asp:ImageButton ID="BtnMoveUp" runat="server" ImageUrl="~/images/kartableAction/MoveUp.png"
                                OnClick="BtnMoveUp_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr runat="server" id="trReviewed">
            <td align="center" valign="top" colspan="3">
                <div runat="server" id="divGrdEmployees" style="float: right; width: 200px; height: 200px; background-color: white">
                    <PT:GridViewEx ID="GrdEmployees" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                        OnDataSourceRequested="GrdEmployees_DataSourceRequested" CssClass="RedDatagrid" EnableSortingAndPagingCallbacks="True"
                        Caption="نظر دهندگان" DataKeyNames="ReviewedByEmployeeID,ID,RequestID,Description,ReviewStatus,ReviewDate,Is_ShowPersonal,FullName"
                        OnSelectedIndexChanged="GrdEmployees_SelectedIndexChanged"
                        PageSize="4" EnableModelValidation="True" Width="100%">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/comment.png" SelectText="انتخاب" ShowSelectButton="True">
                                <ItemStyle Width="30px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="FullName" HeaderText="نام" SortExpression="FullName" FooterStyle-Wrap="False" />
                        </Columns>
                        <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                        <HeaderStyle CssClass="RedDatagridHeader" />
                        <AlternatingRowStyle CssClass="RedDatagridAlternate" />
                        <RowStyle CssClass="RedDatagridItem" />
                        <FooterStyle CssClass="RedDatagridFooter" />
                    </PT:GridViewEx>
                </div>
                <div runat="server" id="divReviewed" style="float: right;">
                    <table style="width: 100%">
                        <tr>
                            <td valign="middle">تاریخ اظهار نظر :&nbsp;&nbsp;
                            </td>
                            <td valign="middle" align="right" dir="ltr">
                                <asp:Label ID="lblDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">نوع نظر
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
                            <td colspan="2">&nbsp; نظر تایید کننده :&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:TextBox ID="EditDesc" runat="server" TextMode="MultiLine" Width="80%" Height="66px"
                                    Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:CheckBox ID="EditIs_ShowPersonal" runat="server" Text="نمایش نظر به درخواست کننده" />
                            </td>
                            <td align="left">
                                <asp:Literal ID="ltlRemoved" runat="server" Visible="false" />
                                &nbsp;&nbsp;
                            <asp:Literal ID="ltlCount" runat="server" Text="0" Visible="false" />
                                <asp:Button ID="btnCancelReview" runat="server" Text="انصراف" OnClick="btnCancelReview_Click" CssClass="btn"
                                    Enabled="False" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSaveReview" CssClass="btn" runat="server" Text="ذخیره" OnClick="btnSaveReview_Click"
                                Enabled="False" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Panel ID="PanRequest" runat="server" BorderStyle="Solid" BorderWidth="1">
                    <asp:PlaceHolder ID="PH_Container" runat="server"></asp:PlaceHolder>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center" width="90%" colspan="2">
                <asp:Label ID="LblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td align="right" width="10%">
                <asp:Button ID="btnClose" runat="server" Text="خروج" CssClass="btn" OnClick="btnClose_Click" CausesValidation="False" />
            </td>
        </tr>
    </table>
</body>
